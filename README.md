# Meal Tracker App

## Description
The **Meal Tracker App** is a Flutter-based mobile application designed to help users log and track their daily meals. The app allows users to add meals with details such as name, calorie count, time of consumption, and an optional photo. It uses **Flutter Bloc (Cubit)** for state management and **Shared Preferences** for local storage, ensuring meals are saved even after restarting the app.

## Features
- **Add Meals**: Users can add meals with a name, calorie count, time, and an image.
- **View and Sort Meals**: Meals can be sorted by name, calorie count, or time.
- **Persist Data**: Uses **Shared Preferences** to save meals locally.
- **Delete Meals**: Users can remove meals, and changes are updated in local storage.
- **Image Picker Support**: Users can capture or select meal photos from their gallery.

## Technologies Used
- **Flutter** for UI development.
- **Cubit (Flutter Bloc)** for state management.
- **Shared Preferences** for data persistence.
- **Image Picker** for handling meal images.

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/meal-tracker.git
   ```
2. Navigate to the project directory:
   ```sh
   cd meal-tracker
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the application:
   ```sh
   flutter run
   ```

## APK Build
To generate a release APK, use the command:
```sh
flutter build apk --release
```

## File Structure
```
meal-tracker/
│── lib/
│   ├── cubit/meal_cubit.dart   # Handles state management
│   ├── models/meal.dart        # Meal data model
│   ├── screens/home_screen.dart  # Main screen displaying meals
│   ├── screens/add_meal_screen.dart  # Screen for adding meals
│   ├── main.dart               # Entry point of the app
│── android/                    # Android-specific files
│── pubspec.yaml                 # Project dependencies
```

## Screenshots!![Simulator Screenshot - iPhone 15 - 2025-03-24 at 16 47 23](https://github.com/user-attachments/assets/cac83a3d-a23b-42ef-88d3-8b3a617b1dbe)
![Simulator Screenshot - iPhone 15 - 2025-03-24 at 16 47 13](https://github.com/user-attachments/assets/ac1013ff-6fac-40f8-9179-17f50e8d324c)
![Simulator Screenshot - iPhone 15 - 2025-03-24 at 16 46 46](https://github.com/user-attachments/assets/8ed82d33-ed74-4085-a646-bc0edf0ad2d7)![Simulator Screenshot - iPhone 15 - 2025-03-24 at 18 41 28](https://github.com/user-attachments/assets/68190b0f-0ef8-47df-aa42-f3a460457e2e)![Simulator Screenshot - iPhone 15 - 2025-03-24 at 16 46 46](https://github.com/user-attachments/assets/58ee61d4-7c7d-438d-ae36-fe562c071e8b)





## License
MIT License
