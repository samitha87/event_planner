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

