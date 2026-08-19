<div align="center">

# 🌦️ Weather App (Cubit Migration)

**A clean Flutter weather application refactored from Provider to the Cubit (`flutter_bloc`) state-management pattern.**

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Cubit-7B1FA2?style=for-the-badge&logo=flutter&logoColor=white" alt="Cubit"/>
  <img src="https://img.shields.io/badge/WeatherAPI-FF6F00?style=for-the-badge&logo=api&logoColor=white" alt="API"/>
</p>

</div>

---

## 📖 About The Project
This project started as a course implementation using standard state management, and I **refactored it to use Cubit (`flutter_bloc`)**. 
The goal was to separate business logic and API handling from the UI widgets, managing states cleanly (`Initial`, `Loading`, `Success`, `Failure`).

## ✨ Key Features
- **Cubit State Management:** Centralized weather logic and state transitions.
- **Dynamic Theming:** App bar and background gradients adapt automatically based on weather conditions (Sunny, Rainy, Snow, etc.).
- **Live REST API:** Fetches real-time 7-day forecast data using the `http` package and WeatherAPI.com.
- **City Search:** Instant lookup for any city's minimum and maximum temperatures.

## 📂 Project Structure
```text
lib/
├── main.dart                        # App entry point — registers WeatherCubit via BlocProvider
├── cubits/
│   └── weather_cubit/
│       ├── weather_cubit.dart       # Business logic — fetches weather & emits states
│       └── weather_state.dart       # WeatherInitial | Loading | Success | Failure
├── models/
│   └── weather_model.dart           # Data model — JSON parsing + theme & image mapping
├── pages/
│   ├── home_page.dart               # Home screen — reacts to states via BlocBuilder
│   └── search_page.dart             # City search screen — triggers the Cubit
└── services/
    └── weather_service.dart         # REST API layer (http package)
```

---

<div align="center">

*Developed as part of the **Flutter Advanced Course (BLoC & MVVM)** by **Eng. Tharwat Samy**.*

</div>