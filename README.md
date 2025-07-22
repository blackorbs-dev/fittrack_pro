# FitTrack Pro 📊

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.6.1+ (Dart 3)
- Android SDK or iOS Xcode tools

### Setup & Run

```bash
git clone https://github.com/blackorbs-dev/fittrack_pro.git
cd fittrack_pro

flutter pub get

# Run code generators (Freezed, json_serializable, etc.)
flutter pub run build_runner build --delete-conflicting-outputs

flutter run
```
---

## 🏛 Architecture Overview

FitTrack Pro uses a modular **Clean Architecture** approach:

```
lib/
├── core/             # Utilities, error types, theming, constants
├── data/             # Repositories implementation, simulated sensor sources
├── domain/           # Models, repository abstractions
├── presentation/     # UI screens, widgets, BLoC/Cubit states
├── app.dart          # Root widget and dependency setup
```

### 🧩 Native Integration

- **Kotlin (Android)**: Foreground service for real-time tracking
- **Swift (iOS)**: Background task manager with simulated data
- **Flutter ↔ Native**: Uses `MethodChannel` and `EventChannel`

---

## 🤸 Gesture Controls (Workout Session Page)

| Gesture         | Action        |
|----------------|---------------|
| **Swipe Up**    | Play workout  |
| **Swipe Down**  | Pause workout |
| **Swipe Left**  | Next exercise |
| **Swipe Right** | Previous exercise |

These intuitive gestures enhance user control without extra buttons.

---

## 🖼️ Advanced UI Features

1. **🔵 Progress Ring**
    - Custom circular progress with multiple animated segments
    - Reflects real-time workout session goals

2. **✨ Morphing FAB**
    - Floating action button that smoothly changes shape and state

3. **🃏 Staggered Card Animation**
    - Dashboard stat cards animate in with staggered timing and bounce

4. **📈 Custom Chart**
    - Hand-drawn-style line chart with smooth transitions between heart rate/calories data

5. **🔄 Custom Loading Widget**
    - Compact animated spinner used during state transitions and syncing

---

## 📱 Notifications

- Native notifications with real-time updates
- **Android**: Foreground service with **interactive actions** (pause/resume/stop)
- **iOS**: Standard notifications shown
  > ⚠️ iOS **does not include notification actions** (due to platform limitations)

---

## ⚙️ Assumptions

- No authentication or user profiles
- Notification permissions requested at runtime as needed

---

## 🐞 Known Issues & Limitations

- iOS: No notification actions
- No syncing — sessions reset on app close

---

## ✅ Running Tests

```bash
# Unit, widget, bloc tests
flutter test

# Code coverage (optional)
flutter test --coverage
```

### Integration Testing

```bash
flutter test integration_test/app_test.dart

# Performance profiling
flutter drive \
  --driver=test_driver/perf_driver.dart \
  --target=integration_test/performance_test.dart \
  --profile --no-dds
```

---

## 🚀 Roadmap

- [ ] Google Fit and Apple HealthKit integration
- [ ] Cloud sync and user profiles
- [ ] Enhanced chart interactions (zoom, pinch)
- [ ] Social goals and challenge system

---
