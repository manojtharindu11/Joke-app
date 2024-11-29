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
├── state/                  # State management (using provider, bloc, etc.)
│   └── joke_state.dart     # Manages the state of jokes
├── utils/                  # Utility functions or constants
│   └── app_constants.dart  # App-wide constants like URLs
└── main.dart               # Entry point of the application
