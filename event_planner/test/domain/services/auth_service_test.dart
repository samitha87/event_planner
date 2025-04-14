import 'package:event_planner/data/models/user_data_model.dart';
import 'package:event_planner/domain/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([FirebaseAuth, User, UserCredential])
import 'auth_service_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthService authService;
  late MockFirebaseAuth mockFirebaseAuth;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    authService = AuthService(auth: mockFirebaseAuth);
  });

  group('signUpWithEmailAndPassword', () {
    test('should return User when sign up is successful', () async {
      // Arrange
      final userData = UserDataModel(
        email: 'test@example.com',
        password: 'password123',
      );

      final mockUser = MockUser();
      final mockUserCredential = MockUserCredential();

      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: userData.email!,
        password: userData.password!,
      )).thenAnswer((_) async => mockUserCredential);

      // Act
      final result = await authService.signUpWithEmailAndPassword(userData);

      // Assert
      expect(result, equals(mockUser));
      verify(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: userData.email!,
        password: userData.password!,
      )).called(1);
    });

    test('should handle FirebaseAuthException', () async {
      // Arrange
      final userData = UserDataModel(
        email: 'test@example.com',
        password: 'password123',
      );

      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: userData.email!,
        password: userData.password!,
      )).thenThrow(FirebaseAuthException(code: 'email-already-in-use'));

      // Act
      final result = await authService.signUpWithEmailAndPassword(userData);

      // Assert
      expect(result, isNull);
    });

    test('should handle other exceptions', () async {
      // Arrange
      final userData = UserDataModel(
        email: 'test@example.com',
        password: 'password123',
      );

      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: userData.email!,
        password: userData.password!,
      )).thenThrow(Exception('Some error'));

      // Act
      final result = await authService.signUpWithEmailAndPassword(userData);

      // Assert
      expect(result, isNull);
    });
  });

  group('signInWithEmailAndPassword', () {
    test('should successfully sign in with email and password', () async {
      // Arrange
      final userData = UserDataModel(
        email: 'test@example.com',
        password: 'password123',
      );

      final mockUser = MockUser();
      final mockUserCredential = MockUserCredential();

      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: userData.email!,
        password: userData.password!,
      )).thenAnswer((_) async => mockUserCredential);

      // Act
      final result = await authService.signInWithEmailAndPassword(userData);

      // Assert
      expect(result, equals(mockUser));
      verify(mockFirebaseAuth.signInWithEmailAndPassword(
        email: userData.email!,
        password: userData.password!,
      )).called(1);
    });

    test('should handle FirebaseAuthException', () async {
      // Arrange
      final userData = UserDataModel(
        email: 'test@example.com',
        password: 'password123',
      );

      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: userData.email!,
        password: userData.password!,
      )).thenThrow(FirebaseAuthException(code: 'user-not-found'));

      // Act
      final result = await authService.signInWithEmailAndPassword(userData);

      // Assert
      expect(result, isNull);
    });

    test('should handle other exceptions', () async {
      // Arrange
      final userData = UserDataModel(
        email: 'test@example.com',
        password: 'password123',
      );

      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: userData.email!,
        password: userData.password!,
      )).thenThrow(Exception('Some error'));

      // Act
      final result = await authService.signInWithEmailAndPassword(userData);

      // Assert
      expect(result, isNull);
    });
  });

  group('signOut', () {
    test('should successfully sign out', () async {
      // Arrange
      when(mockFirebaseAuth.signOut()).thenAnswer((_) async => Future.value());

      // Act
      await authService.signOut();

      // Assert
      verify(mockFirebaseAuth.signOut()).called(1);
    });

    test('should throw exception when sign out fails', () async {
      // Arrange
      when(mockFirebaseAuth.signOut()).thenThrow(Exception('Sign out failed'));

      // Act & Assert
      expect(
        () => authService.signOut(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
