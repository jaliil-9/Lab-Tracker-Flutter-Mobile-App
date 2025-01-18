# docs/TECHNICAL.md

# Technical Documentation

## Architecture Overview
```
lab_tracker/
├── lib/
│   ├── app.dart                       # Application setup
│   ├── home_page.dart                 # Main home page
│   ├── firebase_options.dart          # Firebase setup
│   ├── main.dart                      # Entry point
│   ├── common/                        # Shared bindings
│   ├── data/repositories/             # Authentication & data management services
│   │   ├── auth_repository.dart       # Handles authentication
│   │   ├── experiment_repository.dart # Handles experiment-related data
│   │   ├── task_repository.dart       # Handles task-related data
│   │   └── user_repository.dart       # Handles user-related data
│   ├── features/                      # Core application features
│   │   ├── authentication/            # Authentication module
│   │   │   ├── controllers/           # Business logic for authentication
│   │   │   ├── models/                # Data models for authentication
│   │   │   └── screens/               # UI screens for authentication
│   │   │       ├── login_screen.dart
│   │   │       ├── signup_screen.dart
│   │   │       ├── email_verification.dart
│   │   │       └── password_reset_screen.dart
│   │   ├── data_management/           # Task & experiment management module
│   │   │   ├── tasks/                 # Task management
│   │   │   │   ├── controllers/       # Business logic for tasks
│   │   │   │   ├── models/            # Data models for tasks
│   │   │   │   └── screens/           # UI screens for tasks
│   │   │   │       ├── task_screen.dart
│   │   │   │       └── task_detail_screen.dart
│   │   │   ├── experiments/           # Experiment management
│   │   │   │   ├── controllers/       # Business logic for experiments
│   │   │   │   ├── models/            # Data models for experiments
│   │   │   │   └── screens/           # UI screens for experiments
│   │   │   │       ├── experiment_screen.dart
│   │   │   │       └── experiment_detail_screen.dart
│   │   ├── personalization/           # Personalization module
│   │   │   ├── controllers/           # Business logic for personalization
│   │   │   ├── models/                # Data models for personalization
│   │   │   └── screens/               # UI screens for personalization
│   │   │       ├── profile_screen.dart
│   │   │       ├── settings_screen.dart
│   │   │       ├── help_screen.dart
│   │   │       └── about_screen.dart
│   ├── utils/                         # Utility functions or classes
│   │   ├── constants                  # Common constants
│   │   ├── exceptions.dart            # Exceptions handlers
│   │   ├── helpers.dart               # elper methods
│   │   └── widgets.dart               # Reusable widgets

```

## Dependencies
```yaml
dependencies:
  firebase_core: [^3.9.0]
  firebase_auth: [^5.3.4]
  cloud_firestore: [^5.6.0]
  google_fonts : [^6.2.1]
  get: [^4.6.6]
  connectivity_plus: [^6.1.1]
  get_storage: [^2.1.1]
  flutter_localization: [latest]
```

## Firebase Configuration
1. Authentication setup
2. Firestore database structure
3. Security rules

## State Management
- GetX implementation
- Controllers structure
- Dependency injection
