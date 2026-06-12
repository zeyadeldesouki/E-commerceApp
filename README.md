<!-- <p align="center">
  <img src="assets/images/logo.png" alt="Ecommerce App Logo" width="120" height="120" />
</p> -->

<h1 align="center">🛍️ Ecommerce App</h1>

<p align="center">
  A cross-platform e-commerce solution built with Flutter — clean architecture, multi-payment integration, and a seamless shopping experience.
  <br />
  <br />
  <a href="#features"><strong>Explore Features »</strong></a>
  <br />
  <br />
  <img src="https://img.shields.io/badge/platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-blue" alt="Platforms" />
  <img src="https://img.shields.io/badge/Flutter-3.8%2B-02569B?logo=flutter" alt="Flutter" />
  <img src="https://img.shields.io/badge/license-MIT-green" alt="License" />
  <img src="https://img.shields.io/badge/status-In%20Progress-yellow" alt="Status" />
</p>

---

## 📖 Overview

The **Ecommerce App** is a fully functional, cross-platform e-commerce platform designed to provide a seamless shopping experience. Built with **Flutter** and **Dart**, it allows users to browse products, manage a cart, authenticate securely, and complete purchases through integrated payment gateways.

This project is ideal for developers looking for a production-ready foundation with **Clean Architecture**, **multi-payment support** (Stripe & PayPal), and a **scalable feature-first codebase**. Whether you're building a MVP or a full-scale store, this app gives you a solid head start.

---

## ✨ Features

- **User Authentication** — Secure login and registration via Firebase Authentication.
- **Product Catalog** — Browse products by category, price, or popularity with Firestore.
- **Shopping Cart** — Add/remove products and manage quantities in real time.
- **Checkout & Payments** — Seamless payment processing through Stripe and PayPal.
- **Responsive Design** — Material Design UI that adapts beautifully across screen sizes.
- **Adaptive Typography** — Font sizes that scale proportionally to device height.
- **Global Error Handling** — Friendly error screens instead of crash dump messages.
- **Custom Snackbar System** — Rich in-app notifications for success, warning, and error states.
- **CLI Code Generators** — Dart scripts to instantly scaffold features, cache helpers, and failure classes.
- **Clean Architecture** — Maintainable, testable, and scalable code structure.

---

## 🏗️ Architecture

The project follows **Clean Architecture** with a **feature-first** approach:

- **Separation of Concerns** — Each feature (auth, products, cart, checkout) is isolated with its own `data` and `presentation` layers.
- **Dependency Inversion** — Core infrastructure (`core/`) provides shared utilities; features depend on abstractions, not concrete implementations.
- **Testability** — Business logic is decoupled from UI, making unit testing straightforward.

```
Presentation Layer  →  Domain Layer  →  Data Layer
     (UI/State)         (Entities)       (Repositories/Models)
```

---

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| **Framework** | Flutter |
| **Language** | Dart |
| **Authentication** | Firebase Authentication |
| **Database** | Cloud Firestore |
| **Payment Gateways** | Stripe (`flutter_stripe`), PayPal (`flutter_paypal_payment`) |
| **HTTP Client** | Dio |
| **State Management** | Feature-based (per-presentation manager) |
| **Architecture** | Clean Architecture + Feature-First |
| **UI Design** | Material Design |
| **Utilities** | dartz, freezed_annotation, json_annotation |

---

## 📂 Project Structure

```
lib/
├── app/
│   └── app_name.dart               # MaterialApp root configuration
│
├── core/                           # Shared infrastructure
│   ├── database/                   # Data persistence layer
│   ├── errors/
│   │   └── crash_view.dart         # Global error widget
│   ├── locale/                     # Internationalization (ready)
│   ├── routes/                     # Navigation / routing (ready)
│   ├── services/                   # API services layer (ready)
│   ├── themes/                     # Light/dark theming (ready)
│   ├── utils/
│   │   ├── app_styles.dart         # Responsive text styles
│   │   └── custom_snackbar.dart    # Custom snackbar system
│   └── widgets/                    # Shared reusable widgets (ready)
│
├── feature/                        # Business features
│   └── signup/                     # Example: Signup feature
│       ├── data/
│       │   ├── models/             # Data models
│       │   └── repository/         # Data repositories
│       └── presentation/
│           ├── manager/            # State management
│           ├── views/              # UI screens
│           └── widgets/            # Feature-specific widgets
│
└── main.dart                       # Application entry point
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (stable channel, 3.8+)
- Dart SDK (included with Flutter)
- A [Stripe account](https://stripe.com) for payment processing
- A [Firebase project](https://firebase.google.com) with Authentication & Firestore enabled

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/ecommerce.git
cd ecommerce

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Platform-Specific Setup

**Android** — Add your Stripe publishable key to `android/app/build.gradle.kts`.

**iOS** — Add to `ios/Runner/Info.plist`:
```xml
<key>StripePublishableKey</key>
<string>pk_test_your_key</string>
```

---

<!-- ## 📸 Screenshots -->
<!-- <p align="center">
  <em>Screenshots coming soon.</em>
</p> -->

---

## 🔌 API / Configuration

### Environment Variables

Configure these in your Firebase Console and Stripe Dashboard:

| Variable | Description |
|---|---|
| `Stripe Publishable Key` | Client-side Stripe identifier |
| `Stripe Secret Key` | Server-side Stripe secret |
| `Firebase Project ID` | Your Firebase project identifier |
| `Firebase API Key` | Firebase Web API key |

### Payment Gateway Setup

The app uses `multi_payment_gateway` as an abstraction layer over `flutter_stripe` and `flutter_paypal_payment`. To add a new gateway, extend the gateway interface in the `services/` layer.

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Fork** the repository
2. Create a **feature branch** (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. Open a **Pull Request**

Please ensure your code follows the existing lint rules (`flutter_lints`) and includes tests where applicable.

---

## 📄 License

Distributed under the **MIT License**. See [LICENSE](LICENSE) for more information.

---

## 👤 Author

**Your Name**

- GitHub: [@zeyadeldesouki](https://github.com/zeyadeldesouki)
- Email: zeyadeldesouki@gmail.com

---

<p align="center">
  Built with ❤️ using Flutter
</p>
