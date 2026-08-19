<h1 align="center">🏀 Basketball Points Counter</h1>

<p align="center">
  A simple Flutter application to track basketball scores for two teams (Team A and Team B) focusing on state management implementation.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/Cubit-7B1FA2?style=for-the-badge&logo=flutter&logoColor=white" alt="Cubit"/>
</p>

---

### 📖 About The Project
This project is a practical implementation of State Management in Flutter using the **Cubit** pattern (part of the `flutter_bloc` library). It demonstrates how to separate business logic from the UI layer to maintain a clean and reactive state flow.

### 🛠️ Key Features
- **Real-time Scoring:** Track and update scores for Team A and Team B independently.
- **Cubit Integration:** Centralized points increment logic managed cleanly via `CounterCubit`.
- **Reactive UI:** Instant updates using `BlocConsumer` without unnecessary widget rebuilds.

### 📂 Project Structure
```text
lib/
├── cubit/
│   ├── counter_cubit.dart    # Manages the logic for points increment
│   └── counter_state.dart    # Defines the states for the counter
└── main.dart                 # Main entry point and UI implementation
```

*Developed as part of the Flutter Advanced Course (BLoC & MVVM) by Eng. Tharwat Samy.*
