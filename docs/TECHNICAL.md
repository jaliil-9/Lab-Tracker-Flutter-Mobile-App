# docs/TECHNICAL.md

# Technical Documentation

## Architecture Overview
```
lab_tracker/
├── lib/
│   ├── controllers/    # GetX controllers
│   ├── models/        # Data models
│   ├── services/      # Firebase services
│   ├── ui/           # UI components
│   ├── utils/        # Utilities
│   └── main.dart     # Entry point
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

## Data Models
```dart
// Task Model
class Task {
  final String id;
  final String name;
  final String? description;
  final DateTime? deadline;
  // ... other properties
}

// Experiment Model
class Experiment {
  final String id;
  final String name;
  final String objective;
  final List<String> tools;
  final String status;
  // ... other properties
}