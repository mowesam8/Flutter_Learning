# Practice on Firebase

A Flutter practice project that demonstrates Firebase integration: **Authentication (Email/Password + Google Sign-In), Firestore (CRUD for categories and nested notes), Cloud Messaging, and Local Notifications.**

## Features

- **Email/Password Auth** — sign up, sign in, email verification, and password reset.
- **Google Sign-In** — one-tap authentication with `google_sign_in`.
- **Firestore CRUD** — users can create, read, update, and delete categories, and manage notes nested inside each category.
- **Per-user data isolation** — each user only sees and manages their own data (enforced both in the app query and by Firestore security rules).
- **Push Notifications** — Firebase Cloud Messaging with foreground/background handling and local notification channels.
- **Image Picker** — sample page demonstrating camera image capture.

## Project Structure

```
lib/
├── main.dart                 # App entry point, Firebase init, FCM setup
├── auth/
│   ├── login.dart            # Login screen (email + Google)
│   └── signup.dart           # Signup screen
├── pages/
│   ├── home.dart             # Categories grid (home screen)
│   └── filter.dart           # Image picker sample
├── Categories/
│   ├── addCategory.dart      # Add a category
│   └── editCategory.dart     # Edit a category
├── Note/
│   ├── viewNote.dart         # Notes grid for a category
│   ├── addNote.dart          # Add a note
│   └── editNote.dart         # Edit a note
└── Custom/
    ├── App_Colors.dart       # App color palette
    ├── Custom_Button.dart    # Reusable button
    ├── Custom_TextField.dart # Reusable text field
    └── Custom_logo.dart      # App logo widget
```

## Getting Started

### Prerequisites

- Flutter SDK (3.x)
- A Firebase project with the following services enabled:
  - Authentication (Email/Password and Google providers)
  - Cloud Firestore
  - Cloud Messaging
  - (Optional) Cloud Storage

### Setup

1. Clone the repository and install dependencies:

   ```bash
   flutter pub get
   ```

2. Add your Firebase configuration files:
   - `android/app/google-services.json` for Android.
   - `ios/Runner/GoogleService-Info.plist` for iOS.

   The simplest way is to use the [FlutterFire CLI](https://firebase.flutter.dev/docs/cli):

   ```bash
   flutterfire configure
   ```

3. Deploy the Firebase security rules (see the `firestore.rules` and `storage.rules` files at the project root). You can paste them into the Firebase console under **Firestore Database → Rules** and **Storage → Rules**, or use the Firebase CLI:

   ```bash
   firebase deploy --only firestore:rules,storage:rules
   ```

   > **Important:** the project ships with locked-down rules, so Firestore/Storage will deny access until they are deployed.

4. Run the app:

   ```bash
   flutter run
   ```


