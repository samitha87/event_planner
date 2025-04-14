# Event Planner App

A Flutter-based event planning application that helps users manage and organize their events efficiently.

## Features

- User Authentication
  - Email/Password Sign Up & Login
  - Profile Management
  - Profile Image Upload
- Personal Information Management
  - First Name & Last Name (Alphabetic, 3-10 characters)
  - Email Validation
  - Sri Lankan Phone Number Validation
  - Address Management (6-50 characters)
- Event Management
  - Create and Manage Events
  - Event Details
  - Photo Gallery
  - Organizer Information

## Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- Firebase Account
- Android Studio / VS Code
- Android SDK / iOS Development Tools

## Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/event_planner.git
   cd event_planner
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project
   - Enable Authentication (Email/Password)
   - Enable Firestore Database
   - Enable Firebase Storage
   - Download and add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) to respective platform folders

4. **Configure Environment**
   - Update Firebase configuration in `lib/core/firebase_options.dart`
   - Set up necessary API keys and configurations

5. **Run the App**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── core/                 # Core functionality and configurations
├── data/                # Data layer (models, repositories)
├── domain/              # Business logic and use cases
├── presentation/        # UI layer
│   ├── screens/        # App screens
│   ├── widgets/        # Reusable widgets
│   └── state/          # State management
└── utils/              # Utility functions and constants
```

## Dependencies

- `firebase_core`: Firebase core functionality
- `firebase_auth`: Authentication
- `cloud_firestore`: Database
- `firebase_storage`: File storage
- `provider`: State management
- `flutter_screenutil`: Responsive UI
- `image_picker`: Image selection
- `shared_preferences`: Local storage

## Validation Rules

- **First Name & Last Name**
  - Alphabetic characters only
  - Minimum 3 characters
  - Maximum 10 characters

- **Email**
  - Valid email format
  - Standard email validation

- **Phone Number**
  - Sri Lankan mobile format (07XXXXXXXX)
  - Sri Lankan landline format (0XX-XXXXXXX)
  - International format (+94XXXXXXXXX)

- **Address**
  - Minimum 6 characters
  - Maximum 50 characters

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/feature`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature/feature`)
5. Open a Pull Request


## Flutter + Firebase Setup Guide

### Prerequisites
- Flutter SDK installed
- Firebase account: https://console.firebase.google.com/
- Created a Flutter project using `flutter create my_app`
- Android Studio / Xcode installed and configured

---

### Step 1: Install FlutterFire CLI (Optional)
```bash
dart pub global activate flutterfire_cli
```
Then configure it in your system path.

---

### Step 2: Create a Firebase Project
1. Visit [Firebase Console](https://console.firebase.google.com/)
2. Click **Add Project** and follow the steps

---

### Android Setup

#### Register App in Firebase Console
1. Go to Project Settings > Android
2. Enter your Android package name (e.g., `com.apptest.eventplanner`)
3. Download `google-services.json`
4. Place it in:
   ```
   android/app/google-services.json
   ```

#### Update Android Files
- **android/build.gradle**:
```groovy
buildscript {
  dependencies {
    classpath 'com.google.gms:google-services:4.3.15'
  }
}
```

- **android/app/build.gradle**:
```groovy
apply plugin: 'com.google.gms.google-services'
```

---

### iOS Setup

#### Register App in Firebase Console
1. Go to Project Settings > iOS
2. Enter your iOS bundle ID (e.g., `com.example.myApp`)
3. Download `GoogleService-Info.plist`
4. Place it in:
   ```
   ios/Runner/GoogleService-Info.plist
   ```

#### Update iOS Configuration
- **ios/Podfile**:
```ruby
platform :ios, '12.0'
```

- Run:
```bash
cd ios
pod install
```

---

### Add Firebase Packages
In `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.30.0
```
Run:
```bash
flutter pub get
```

---

### Initialize Firebase
In `main.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

If using multiple environments, you can use:
```dart
Firebase.initializeApp(options: FirebaseOptions(...))
```

---

### Verify the Setup
Run your app:
```bash
flutter run
```
Firebase should initialize without errors.

---

### Add More Firebase Features for app
```yaml
firebase_auth: ^4.17.0
cloud_firestore: ^4.17.0
firebase_messaging: ^14.7.0
firebase_storage: ^11.6.0
firebase_analytics: ^10.8.0
```

---

### References
- FlutterFire Overview: https://firebase.flutter.dev/
- Firebase Console: https://console.firebase.google.com/
- Firebase CLI: https://firebase.google.com/docs/cli
- Installation Docs: https://firebase.flutter.dev/docs/overview#installation


