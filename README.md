# DayFlow

DayFlow is a daily planning and productivity app built with Flutter.

## Architecture

This project follows a Clean Architecture approach with Feature-first structure.

```
lib/
  core/           # global shared components
    constants/
    database/     # Drift database setup
    router/       # GoRouter configuration
    theme/        # App Theme & Colors
  features/
    tasks/        # 'Tasks' feature
      data/       # Repositories & Data Sources
      domain/     # Entities & Use Cases
      presentation/ # UI & Riverpod Providers
```

## Tech Stack

- **Flutter**: UI Framework
- **Riverpod**: State Management
- **Drift**: Local SQLite Database
- **GoRouter**: Navigation
- **Freezed**: Data Class generation
- **Flutter Local Notifications**: (Setup dependent on platform)

## Getting Started

1. `flutter pub get`
2. `flutter pub run build_runner build`
3. `flutter run`
