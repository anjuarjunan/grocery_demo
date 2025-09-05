# grocery_demo

This Flutter app demonstrates a grocery list with category filtering using Riverpod state management.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Prerequisites

- Flutter SDK installed ([Installation guide](https://flutter.dev/docs/get-started/install))
- VSCode installed with Flutter and Dart extensions
- An Android Emulator or connected physical device (for mobile)
- Chrome browser (for Flutter Web)

## Features

- Display grocery items grouped by category
- Filter items by category via a bottom modal sheet
- Add new grocery items via dialog
- State management with Riverpod
- Async data handling and filtering
- Widget tests covering UI and state interaction

### Testing Setup Overview

- **Mock Data:** Use a static list of grocery items to avoid calling real APIs during tests.
- **Filter Logic:** The filtered list is computed by `filteredGroceryListProvider` based on the selected category.
- **UI Interaction:** Tests simulate opening the filter modal, selecting categories, and clearing filters.

## Commands

Use these commands to manage, build, run, and test the app from the terminal:

- **Clean the project (removes build artifacts):**

  ```bash
  `flutter clean`
  ```

- **Get dependcies:**

`flutter pub get`

- **Build app (optional):**

`flutter build apk` # For Android APK
`flutter build ios` # For iOS
`flutter build web` # For Web

- **Run app:**

On connected device or emulator:

`flutter run`

On Chrome for Flutter Web:

`flutter run -d chrome`

- **Run tests:**

`flutter test`
