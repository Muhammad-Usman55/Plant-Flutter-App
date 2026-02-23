# Flutter Plants App

A beautiful, feature-rich Plants App built with Flutter and Dart. Browse, favorite, and shop for plants with an elegant UI.

![plant-app](https://user-images.githubusercontent.com/102694446/173368186-5ac0d80f-d6f6-4594-98b3-838d95b0b8f8.png)

## Features

- **Onboarding Screen** - Beautiful introduction screens for new users
- **Authentication** - Sign in, Sign up, and Forgot password functionality
- **Home Page** - Browse plants by categories (Recommended, Indoor, Outdoor, Garden, Supplement)
- **Plant Details** - View detailed information about each plant
- **Favorites** - Save your favorite plants
- **Shopping Cart** - Add plants to cart for purchase
- **User Profile** - Manage your profile settings
- **Dark Mode** - Toggle between light and dark themes
- **Multi-language Support** - Available in English, Spanish, French, Arabic, Chinese, and Hindi
- **Search** - Search for plants easily

## Screenshots

| Onboarding | Home | Details |
|:---:|:---:|:---:|
| Coming soon | Coming soon | Coming soon |

## Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **State Management:** ValueNotifier
- **Packages:**
  - `animated_bottom_navigation_bar` - Animated navigation bar
  - `page_transition` - Page transition animations
  - `cupertino_icons` - iOS style icons

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0 <4.0.0)
- Dart SDK
- Android Studio / VS Code

### Installation

1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/flutter-plants-app.git
   ```

2. Navigate to the project directory
   ```bash
   cd flutter-plants-app
   ```

3. Install dependencies
   ```bash
   flutter pub get
   ```

4. Run the app
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart              # App entry point with theme and localization setup
├── constants.dart         # App constants and colors
├── models/
│   └── plants.dart        # Plant data model
└── ui/
    ├── onboarding_screen.dart
    ├── root_page.dart
    ├── scan_page.dart
    └── screens/
        ├── home_page.dart
        ├── detail_page.dart
        ├── cart_page.dart
        ├── favorite_page.dart
        ├── profile_page.dart
        ├── settings_page.dart
        ├── signin_page.dart
        ├── signup_page.dart
        ├── forgot_password.dart
        └── widgets/
```

## Platforms Supported

- Android
- iOS
- Web
- Windows
- macOS
- Linux

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).


