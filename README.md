# HR Flutter App

A **Human Resource Application** designed and developed using **Flutter** for the frontend and **.NET Web API** for the backend. This project is aimed at providing a robust, cross-platform solution for managing HR-related functionalities such as employee data, attendance, leave requests, and more.

## 🛠 Tech Stack

- **Frontend:** Flutter (Dart)
- **Backend:** .NET Web API
- **State Management:** Provider (or specify if you're using GetX, Riverpod, etc.)
- **Database:** (Specify your DB if applicable – MSSQL, SQLite, etc.)
- **Authentication:** (If any – JWT, OAuth2, etc.)

## 📱 Features

- Employee Management
- Attendance Tracking
- Leave Application & Approval
- Role-based Access Control (Admin, HR, Employee)
- API Integration with .NET Web Services
- Responsive UI for both Android & iOS

## 📂 Project Structure (Flutter)

```
lib/
├── models/             # Data models
├── screens/            # UI screens
├── services/           # API services
├── providers/          # State management
├── utils/              # Helper methods & constants
└── main.dart           # Entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed
- Visual Studio / Android Studio
- .NET 6.0 SDK or later
- Emulator or physical device for testing

### Frontend Setup (Flutter)

```bash
git clone https://github.com/sultan-ul-arefin/hr-flutter-app.git
cd hr-flutter-app
flutter pub get
flutter run
```

### Backend Setup (.NET API)

> Note: This repo contains only the frontend Flutter application. Please refer to the corresponding .NET Web API repository or folder if available.

```bash
cd path-to-backend
dotnet restore
dotnet run
```

## 🔐 Environment Variables

Ensure you configure your API base URL and any required keys in a `.env` file or within your app's constants file.

```dart
const String apiBaseUrl = "http://your-api-url/api";
```
## 🧑‍💻 Author

- [Sultan Ul Arefin](https://github.com/sultan-ul-arefin)

## 🤝 Contributing

Contributions are welcome! Feel free to fork the repo and submit a pull request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```
