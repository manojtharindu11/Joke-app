# Joke Application

A Flutter-based joke application that fetches and displays jokes in a clean and user-friendly UI. It leverages the **Provider** package for state management and the **Dio** package for HTTP requests. The app is structured with scalability and maintainability in mind.

## **Features**
- Fetch jokes from an API with a single tap.
- Dynamic UI that responds to loading states and errors.
- Scrollable list of jokes styled with Material Design principles.
- State management using the **Provider** package.

---

## **Project Structure**

The project is organized into a modular folder structure for clarity and scalability:

```
lib/
├── data/                   # Handles data sources and models
│   ├── dto/                # Data Transfer Objects (DTOs) for mapping API responses
│   │   └── joke_dto.dart   # DTO for Joke API
│   └── services/           # Handles API calls and data fetching
│       └── joke_service.dart
├── presentation/           # Contains UI components (Views, Widgets)
│   ├── screens/            # Screens of the app
│   │   └── home_page.dart  # HomePage UI
│   └── styles/             # Styling constants and theme-related classes
│       └── app_styles.dart # Styles and colors
├── state/                  # State management (using Provider, Bloc, etc.)
│   └── joke_state.dart     # Manages the state of jokes
├── utils/                  # Utility functions or constants
│   └── app_constants.dart  # App-wide constants like URLs
└── main.dart               # Entry point of the application
```

---

## **Dependencies**
- **Flutter SDK**: Ensure you have the latest Flutter SDK installed.
- **Provider**: For state management.
- **Dio**: For making HTTP requests.

Install dependencies:
```bash
flutter pub get
```

---

## **How It Works**

### Fetching Jokes
- **`JokeState`**: Manages the app's state, including loading indicators and fetched jokes.
- **`JokeService`**: Handles API calls using the **Dio** library to retrieve jokes.
- **`JokeDTO`**: Maps API responses into a format usable within the app.

### UI
- **HomePage**: Displays a button to fetch jokes and a dynamically rendered list of fetched jokes.
- **Material Design Components**: Widgets like `Scaffold`, `Card`, and `ListView` ensure a clean and responsive UI.

---

## **Customization**

- Update the API URL in `lib/utils/app_constants.dart`.
- Modify colors and styles in `lib/presentation/styles/app_styles.dart`.