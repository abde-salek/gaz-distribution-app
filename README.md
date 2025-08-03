# Product Delivery Tracker

A Flutter application designed for delivery captains to efficiently manage product deliveries and payment collections. Built with a focus on clarity, discipline, and fast decision-making.

## 🎨 Design Principles

The UI is built on core principles of **clarity and discipline**, ensuring captains can make fast decisions without clutter:

- **Deep Navy** (`#1A2332`) - Used for deliveries and money owed
- **Teal** (`#20B2AA`) - Used for payments and settled accounts
- **Clean Layout** - Scannable cards and organized information hierarchy
- **Streamlined Workflows** - Focus on core tasks with highly accessible actions

## 🚀 Features

### Dashboard
- **Overview Cards** - Key metrics at a glance (Total Revenue, Collected, Pending, Overdue)
- **Quick Actions** - Fast access to create new deliveries and collect payments
- **Recent Deliveries** - List of recent deliveries with status indicators
- **Pull-to-refresh** functionality

### Delivery Management
- **Create New Deliveries** - Comprehensive form with client, product, and delivery information
- **View Delivery Details** - Complete delivery information with action buttons
- **Status Tracking** - Visual indicators for delivery and payment status
- **Payment Collection** - Dedicated payment collection interface

### Payment Collection
- **Payment Summary** - Clear breakdown of total, paid, and remaining amounts
- **Multiple Payment Methods** - Cash, Card, Bank Transfer, Mobile Money
- **Validation** - Ensures payment amounts don't exceed remaining balance
- **Payment History** - Track payment status and history

## 📱 Screenshots

The app features a clean, modern interface with:
- Card-based layout for easy scanning
- Color-coded status indicators
- Intuitive navigation
- Responsive design

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── models/
│   │   └── delivery.dart          # Delivery data model
│   └── theme/
│       └── app_theme.dart         # App theme and colors
├── features/
│   ├── dashboard/
│   │   └── presentation/
│   │       ├── pages/
│   │       │   └── dashboard_page.dart
│   │       └── widgets/
│   │           ├── overview_card.dart
│   │           ├── delivery_list_item.dart
│   │           └── quick_action_button.dart
│   ├── delivery/
│   │   └── presentation/
│   │       └── pages/
│   │           ├── delivery_details_page.dart
│   │           └── new_delivery_page.dart
│   └── payment/
│       └── presentation/
│           └── pages/
│               └── payment_collection_page.dart
└── main.dart                      # App entry point
```

## 🎯 Key Features

### For Delivery Captains
1. **Fast Overview** - See all key metrics at a glance
2. **Quick Actions** - Create deliveries and collect payments with minimal taps
3. **Status Tracking** - Visual indicators for delivery and payment status
4. **Payment Management** - Track payments and outstanding amounts
5. **Client Information** - Complete client details for each delivery

### Design Highlights
- **Scannable Layout** - Information organized for quick reading
- **Visual Hierarchy** - Clear distinction between different types of information
- **Color Coding** - Deep Navy for deliveries/money owed, Teal for payments
- **Accessible Actions** - Key functions prominently placed and easily accessible

## 🛠️ Technical Stack

- **Framework**: Flutter
- **Language**: Dart
- **Architecture**: Feature-based folder structure
- **State Management**: Local state with setState
- **UI**: Material Design 3 with custom theme

## 🚀 Getting Started

1. **Prerequisites**
   - Flutter SDK (latest stable version)
   - Dart SDK
   - Android Studio / VS Code

2. **Installation**
   ```bash
   git clone <repository-url>
   cd gaz
   flutter pub get
   flutter run
   ```

3. **Running the App**
   ```bash
   flutter run
   ```

## 📋 Usage

### Creating a New Delivery
1. Tap "New Delivery" on the dashboard
2. Fill in client information (name, phone, address)
3. Enter product details (name, quantity, unit price)
4. Set delivery date and optional notes
5. Review order summary and save

### Collecting Payments
1. Tap "Collect Payment" on the dashboard
2. Select a delivery with outstanding balance
3. Enter payment amount and method
4. Add optional notes
5. Confirm payment collection

### Viewing Delivery Details
1. Tap on any delivery in the list
2. View complete delivery information
3. Take actions like marking as delivered or collecting payment

## 🔮 Future Enhancements

- [ ] Database integration (SQLite/Hive)
- [ ] Offline support
- [ ] Push notifications
- [ ] Export reports
- [ ] Multi-language support
- [ ] Dark mode
- [ ] Analytics dashboard
- [ ] Client management
- [ ] Route optimization

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

Built with ❤️ for delivery captains who need efficient tools to manage their business.
