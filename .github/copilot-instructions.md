---
applyTo: "**/*.dart"
---

## Project Context
The **Gaz Distribution App** is a comprehensive mobile application built with **Flutter** and **Dart**. Its primary purpose is to manage gas distribution, including client management, delivery tracking, and payment collection.

## Core Technologies
* **Framework:** Flutter
* **Language:** Dart
* **State Management:** Riverpod (following the Provider/Consumer pattern)

## Codebase Overview
The project follows a modular, component-based architecture to ensure clarity and maintainability.

* `lib/main.dart`: The main entry point of the app. It must be wrapped in `ProviderScope`.
* `lib/src/`: Contains all feature-specific code, separated into sub-directories (e.g., `auth`, `clients`).
* `lib/src/auth/`: Contains authentication-related screens and widgets (`login`, `signup`, `splash`).
* `lib/src/clients/`: Contains client-related features like the client list UI.
* `lib/providers/`: Stores all Riverpod provider definitions (e.g., `client_provider.dart`).
* `lib/models/`: Contains data model classes (e.g., `client.dart`, `transaction.dart`).
* `lib/core/`: Houses global, core logic, and utility classes, such as `responsive_ui.dart`, `app_colors.dart`, and `app_text_styles.dart`.
* `lib/services/`: Contains service classes and mock data (e.g., `mock_data.dart`).
* `lib/widgets/`: Contains reusable widget components (e.g., `client_card.dart`, `app_navigation_bar.dart`).

## Coding Standards & Architectural Rules
1. **File Naming:** Use `snake_case` for filenames (e.g., `my_widget.dart`).
2. **Widget Naming:** Use `PascalCase` for widget class names (e.g., `MyWidget`).
3. **Component Separation:** Break down complex pages into smaller, single-purpose widgets.
4. **State Management:** Use Riverpod for all state management. Prefer `StateNotifierProvider` for complex state and `Provider` for read-only data.
5. **Styling:** Avoid hardcoding colors, fonts, and dimensions. Use centralized constants from `lib/Core/app_colors.dart` and `lib/Core/app_text_styles.dart`.
6. **Responsive Design:** Utilize the `lib/Core/responsive.dart` class for all responsive calculations. Do not use hardcoded screen width or height values.
7. **Comments:** All public methods and classes should have a brief, clear comment explaining their purpose.

## Key Components & Utilities
* **Colors:** Use `AppColors` class from `lib/Core/app_colors.dart` for consistent theming (primary, secondary, text, background, actions colors).
* **Text Styles:** Use `AppTextStyles` class from `lib/Core/app_text_styles.dart` for consistent typography.
* **Responsive Design:** Use `Responsive` class methods from `lib/Core/responsive.dart` for screen-size-aware calculations.
* **State Management:** Follow the established pattern in `lib/providers/client_provider.dart` using `StateNotifierProvider`.

## Build & Test
* To get dependencies: `flutter pub get`
* To run the app: `flutter run`
* To run tests: `flutter test`
