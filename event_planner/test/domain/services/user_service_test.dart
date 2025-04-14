import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/data/models/user_data_model.dart';
import 'package:event_planner/domain/services/user_service.dart';
import 'package:event_planner/presentation/state/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

@GenerateMocks([
  FirebaseFirestore,
  FirebaseStorage,
  Reference,
  UploadTask,
  DocumentReference,
  CollectionReference,
  AuthenticationProvider,
  User,
  FirebaseAuth,
  TaskSnapshot,
])
import 'user_service_test.mocks.dart';

// Mock Firebase.initializeApp()
class MockFirebaseApp extends Mock implements FirebaseApp {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserService userService;
  late MockFirebaseFirestore mockFirestore;
  late MockFirebaseStorage mockStorage;
  late MockAuthenticationProvider mockAuthProvider;
  late MockReference mockStorageRef;
  late MockUploadTask mockUploadTask;
  late MockDocumentReference<Map<String, dynamic>> mockDocRef;
  late MockCollectionReference<Map<String, dynamic>> mockCollectionRef;
  late MockUser mockUser;
  late BuildContext testContext;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockTaskSnapshot mockTaskSnapshot;

  setUpAll(() async {
    mockFirestore = MockFirebaseFirestore();
    mockStorage = MockFirebaseStorage();
    mockAuthProvider = MockAuthenticationProvider();
    mockStorageRef = MockReference();
    mockUploadTask = MockUploadTask();
    mockDocRef = MockDocumentReference<Map<String, dynamic>>();
    mockCollectionRef = MockCollectionReference<Map<String, dynamic>>();
    mockUser = MockUser();
    mockFirebaseAuth = MockFirebaseAuth();
    mockTaskSnapshot = MockTaskSnapshot();

    // Setup Firebase Auth mock
    when(mockFirebaseAuth.currentUser).thenReturn(mockUser);
    AuthenticationProvider.auth = mockFirebaseAuth;

    when(mockUser.uid).thenReturn('test-uid');
    when(mockUser.email).thenReturn('test@example.com');
    when(mockUser.displayName).thenReturn('Test User');
    when(mockUser.photoURL).thenReturn(null);

    when(mockAuthProvider.credential).thenReturn(mockUser);

    when(mockStorage.ref()).thenReturn(mockStorageRef);
    when(mockStorageRef.child(any)).thenReturn(mockStorageRef);
    when(mockStorageRef.putFile(any)).thenAnswer((_) => mockUploadTask);
    when(mockUploadTask.then(any, onError: anyNamed('onError'))).thenAnswer((invocation) async => mockTaskSnapshot);
    when(mockStorageRef.getDownloadURL()).thenAnswer((_) => Future.value('https://example.com/image.jpg'));

    when(mockFirestore.collection(any)).thenReturn(mockCollectionRef);
    when(mockCollectionRef.doc(any)).thenReturn(mockDocRef);
    when(mockDocRef.update(any)).thenAnswer((_) => Future.value());
    when(mockDocRef.set(any)).thenAnswer((_) => Future.value());

    // Override Firebase instances with mocks
    UserService.firestore = mockFirestore;
    UserService.storage = mockStorage;
  });

  setUp(() {
    userService = UserService();
  });

  group('UserService Tests', () {
    testWidgets('uploadProfileImage - successful upload', (WidgetTester tester) async {
      // Arrange
      final testFile = File('test.jpg');
      final widget = MaterialApp(
        home: ChangeNotifierProvider<AuthenticationProvider>.value(
          value: mockAuthProvider,
          child: Builder(
            builder: (context) {
              testContext = context;
              return Container();
            },
          ),
        ),
      );
      await tester.pumpWidget(widget);

      // Act
      final result = await userService.uploadProfileImage(testFile, testContext);

      // Assert
      expect(result, 'https://example.com/image.jpg');
      verify(mockStorageRef.putFile(testFile)).called(1);
      verify(mockStorageRef.getDownloadURL()).called(1);
      verify(mockDocRef.update({'profileImage': 'https://example.com/image.jpg'})).called(1);
    });

    testWidgets('uploadProfileImage - null image', (WidgetTester tester) async {
      // Arrange
      final widget = MaterialApp(
        home: ChangeNotifierProvider<AuthenticationProvider>.value(
          value: mockAuthProvider,
          child: Builder(
            builder: (context) {
              testContext = context;
              return Container();
            },
          ),
        ),
      );
      await tester.pumpWidget(widget);

      // Act
      final result = await userService.uploadProfileImage(null, testContext);

      // Assert
      expect(result, isNull);
      verifyNever(mockStorageRef.putFile(any));
    });

    testWidgets('updateUserInfo - successful update', (WidgetTester tester) async {
      // Arrange
      final userData = UserDataModel(
        id: 'test-uid',
        email: 'test@example.com',
        fname: 'Test',
        lname: 'User',
        phone: '1234567890',
        address: 'Test Address',
        profileImage: 'https://example.com/image.jpg',
      );

      final widget = MaterialApp(
        home: ChangeNotifierProvider<AuthenticationProvider>.value(
          value: mockAuthProvider,
          child: Builder(
            builder: (context) {
              testContext = context;
              return Container();
            },
          ),
        ),
      );
      await tester.pumpWidget(widget);

      // Act
      await userService.updateUserInfo(userData, testContext);

      // Assert
      verify(mockDocRef.set({
        'uid': 'test-uid',
        'email': 'test@example.com',
        'fname': 'Test',
        'lname': 'User',
        'phone': '1234567890',
        'address': 'Test Address',
        'profileImage': 'https://example.com/image.jpg',
        'createdAt': FieldValue.serverTimestamp(),
      })).called(1);
    });

    testWidgets('updateUserInfo - handles error', (WidgetTester tester) async {
      // Arrange
      final userData = UserDataModel(
        id: 'test-uid',
        email: 'test@example.com',
        fname: 'Test',
        lname: 'User',
        phone: '1234567890',
        address: 'Test Address',
        profileImage: 'https://example.com/image.jpg',
      );

      when(mockDocRef.set(any)).thenThrow(Exception('Test error'));

      final widget = MaterialApp(
        home: ChangeNotifierProvider<AuthenticationProvider>.value(
          value: mockAuthProvider,
          child: Builder(
            builder: (context) {
              testContext = context;
              return Container();
            },
          ),
        ),
      );
      await tester.pumpWidget(widget);

      // Act & Assert
      await expectLater(
        () => userService.updateUserInfo(userData, testContext),
        throwsException,
      );
    });

    testWidgets('uploadProfileImage - handles error', (WidgetTester tester) async {
      // Arrange
      final testFile = File('test.jpg');
      when(mockStorageRef.putFile(any)).thenThrow(Exception('Upload error'));

      final widget = MaterialApp(
        home: ChangeNotifierProvider<AuthenticationProvider>.value(
          value: mockAuthProvider,
          child: Builder(
            builder: (context) {
              testContext = context;
              return Container();
            },
          ),
        ),
      );
      await tester.pumpWidget(widget);

      // Act & Assert
      await expectLater(
        () => userService.uploadProfileImage(testFile, testContext),
        throwsException,
      );
    });
  });
}
