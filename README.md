# MovieFlix

MovieFlix is a Flutter movie app that lets users browse popular movies, search for titles, view movie details, save favorites locally, and explore a profile/settings section.

## Features

- Browse popular movies from TMDB
- Search movies in real time
- View detailed movie information
- Save and remove favorite movies
- Persistent favorites using Hive
- Bottom navigation with Movies, Favorites, and Profile screens
- Profile page with settings links such as Account, Notifications, Privacy Policy, Terms of Service, and Help & Support

## Tech Stack

- Flutter
- Dart
- TMDB API
- HTTP for API requests
- Hive for local favorites storage
- flutter_dotenv for environment variables

## Project Structure

- `lib/main.dart` - app entry point and navigation
- `lib/api.dart` - TMDB API calls and Hive favorites logic
- `lib/pages/` - screen implementations
- `lib/pages/settings/` - profile-related settings screens

## Prerequisites

Before you start, make sure you have:

- Flutter SDK installed
- Android Studio or VS Code with Flutter plugins
- An emulator or physical device connected
- A TMDB API token

## Setup

1. Clone the repository.
2. Open the project in your Flutter editor.
3. Create a `.env` file in the root folder.
4. Add your TMDB token:

```env
TMDB_API_TOKEN=your_tmdb_api_token_here
```

5. Install dependencies:

```bash
flutter pub get
```

## Run the app

```bash
flutter run
```

## Notes

- The app expects the `.env` file to exist before launch.
- Favorites are stored locally in Hive, so they remain available between app sessions.
- If the TMDB token is missing or invalid, movie requests will fail and the app will show an error state.

## Useful Commands

```bash
flutter clean
flutter pub get
flutter test
```

## License

This project is for educational/demo use unless otherwise specified.
