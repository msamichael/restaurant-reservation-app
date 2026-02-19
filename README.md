# Restaurant Reservation App

A cross-platform Flutter app for restaurant discovery and reservation booking, with Supabase-backed authentication and persistent reservation data.

## Highlights

- Supabase email/password authentication
- Restaurant browse flow with filters (location, price, availability)
- Cuisine search flow with filters and text search
- Cart-based reservation booking flow
- Profile tools: reservation summary, clear reservations, logout
- Cloud persistence for reservation state

## Demo

Add your screenshots or GIFs here.

Suggested files:
- `docs/images/home.png`
- `docs/images/search.png`
- `docs/images/cart.png`
- `docs/images/profile.png`

Example markdown:

```md
![Home Screen](docs/images/home.png)
![Search Screen](docs/images/search.png)
```

## Tech Stack

- Flutter (Dart)
- Supabase 
- Material Design components

## Architecture


- `lib/main.dart`
  - Initializes Supabase
  - Boots app with `AuthScreen`
- `lib/screens/`
  - Auth, home, cuisine search, restaurant detail, cart, profile, filters
- `lib/model/data/`
  - Seed restaurant/cuisine data
  - In-memory reservation maps
- `lib/model/service/reservation_service.dart`
  - Supabase read/write operations

### User Flow

1. App starts and initializes Supabase.
2. `AuthScreen` listens to auth session state.
3. Logged-in users land on `MainScreen` with 3 tabs:
   - Home
   - Search
   - Profile
4. Reservation actions update local maps and are persisted via Supabase service methods.

##  Feature Set

- Authentication: register, login, logout
- Restaurant list and detail
- Cuisine list and keyword search
- Filter controls:
  - Home: location, price range, availability
  - Search: restaurant, price range, availability
- Cart + reservation increment/decrement and confirmation dialogs
- Reservation summary and clear reservations action



## Repository Structure

```text
lib/
  components/           reusable UI widgets
  model/
    data/               restaurant/cuisine lists + reservation maps
    service/            Supabase reservation service
  screens/              all app screens and navigation flows
  theme/                app theme
assets/images/          app images
android/ ios/ web/      platform folders
test/                   starter tests
```

## Getting Started

### Prerequisites

- Flutter SDK 3.x
- Dart SDK (bundled with Flutter)
- A Supabase project
- Android Studio or VS Code + Flutter extensions

### 1. Install dependencies

```bash
flutter pub get
```

### 2. Configure Supabase

Update credentials in `lib/model/constants.dart`:

- `ksupabaseUrl`
- `ksupabaseAnonKey`


### 4. Run the app

```bash
flutter run
```

### Useful commands

```bash
flutter analyze
flutter test
```

