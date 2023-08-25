# AnyWhere Mobile Test

A Flutter test project.

## Getting Started

1. Clone this repository.
2. Make sure your Flutter & Dart version is compatible with this repository.
3. Run command `flutter pub get` to fetch Flutter package dependencies.
4. To run the app, use the command `flutter run --flavor [simpsons/wire] -t lib/[main_simpsons/main_wire].dart`

## Architecture
Clean Architecture

## Folder Structure
```
⁞
│
├── lib (The root directory for your application's source code.)
│    │
│    │
│    ├── config (Contains configuration-related code, such as colors and themes used throughout the app.)
│    │    │
│    │    ├── colors (Defines color constants used for styling.)
│    │    │
│    │    └── theme (Includes the overall theme configuration for consistent styling.)
│    │
│    │
│    ├── core (Holds core functionality that is independent of the application's business logic.)
│    │    │
│    │    ├── constants (Stores constant values used across the application.)
│    │    │
│    │    ├── functions (Contains utility functions that provide common functionality.)
│    │    │
│    │    ├── resources (Manages assets like images, fonts, etc.)
│    │    │
│    │    ├── usecase (Defines application-specific use cases that interact with the domain.)
│    │    │
│    │    └── widgets (Custom widgets that are reused throughout the app.)
│    │
│    │   
│    └── features (Contains individual features of the application, each in its own subdirectory.)
│         │
│         └── [feature_name]  (Represents a specific feature module.)
│             │
│             ├── data (Handles data-related operations, such as API calls or local database interactions.)
│             │
│             ├── domain (Contains domain entities and business logic interfaces for the feature.)
│             │
│             └── presentation (Manages the UI and user interactions for the feature.)
│
└── tests (This is where you would place your unit tests, integration tests, and any other testing-related code for your application.)
```

## Developer Notes
- Used [anim_search_bar](https://pub.dev/packages/anim_search_bar) just for the purpose of making a fancy search bar with animations.
- For generating flavors, I have used this package called [flutter_flavorizr](https://pub.dev/packages/flutter_flavorizr) in order to easily generate flavors/variants with different app name and package name. _(I was unable to utilize the variable parameters to dynamically set api, so what I did is just I just created a method to logically return a constant api based on the current flavor.)_
- Used [retrofit](https://pub.dev/packages/retrofit) to easily generate API requests with Dio Adapter.
- For Flutter Clean Architecture, this [youtube video](https://www.youtube.com/watch?v=7V_P6dovixg&t=8s) from Flutter Guys is my model for it.
- iOS platform has a clear implementation of detecting the user's device by using the [device_info_plus](https://pub.dev/packages/device_info_plus) package, which can tell whether you are on a phone or tablet device. But for some reason, Android platform is having trouble on this one. And after scouring for a solid implementation, I have found this [article](https://iiro.dev/implementing-adaptive-master-detail-layouts/) where I based my Android device logic on.
