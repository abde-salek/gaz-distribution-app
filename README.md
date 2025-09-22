# 🚀 Gaz Distribution App

A modern Flutter application designed for gas distribution management, featuring a beautiful responsive UI, comprehensive dashboard, client management, and currency switching capabilities. Built with Flutter 3.x and following professional development practices.

## ✨ What's New (Latest Updates)

### 🎨 **Enhanced UI/UX**
- **Responsive Design**: Adaptive layouts for all screen sizes (mobile, tablet, desktop)
- **Modern Dashboard**: Clean, intuitive interface with real-time data visualization
- **Custom App Bar**: Consistent navigation with currency switcher and dynamic icons
- **Bottom Navigation**: Seamless navigation between Dashboard, Clients, and other sections

### 🔧 **Technical Improvements**
- **Responsive Layout System**: Custom `Responsive` class for adaptive UI components
- **State Management**: Riverpod integration for efficient state management
- **Currency System**: Multi-currency support (DH, USD, EUR) with real-time conversion
- **Component Architecture**: Reusable widgets with consistent styling

### 📱 **New Features**
- **Truck Inventory Management**: Visual representation of gas cylinders with quantity tracking
- **Currency Switcher**: Dynamic currency conversion across the entire app
- **Responsive Grid System**: Adaptive layouts that work on any device size
- **Professional Naming Convention**: Following Flutter best practices

## 📱 Current Features

### 🏠 **Dashboard**
- **Welcome Section**: Personalized greeting with current date display
- **Financial Overview**: Target amount, collected amount, and owed amount cards
- **Truck Inventory**: Visual representation of gas cylinders with quantities
- **Responsive Cards**: Adaptive layouts that scale beautifully on all devices
- **Currency Support**: Multi-currency display with real-time conversion

### 👥 **Client Management**
=======
A comprehensive Flutter application designed for gas distribution management, featuring modern UI/UX design and robust functionality for delivery tracking, client management, and payment collection.

## 📱 Features

### 🔐 Authentication & Security
- **User Authentication**: Secure login/signup with email verification
- **Role-based Access**: Different access levels for drivers, managers, and administrators
- **Session Management**: Automatic token refresh and secure session handling
- **Biometric Authentication**: Fingerprint/Face ID support for quick access

### 📦 Delivery Management
- **Offline Support**: Works without internet connection with data sync

### 👥 Client Management
- **Client Database**: Comprehensive client information management
- **Search Functionality**: Advanced search with responsive UI
- **Client Cards**: Beautiful, informative client display cards
- **Consistent Navigation**: Same app bar and navigation as dashboard

### 💱 **Currency System**
- **Multi-Currency Support**: DH (Dirham), USD, EUR
- **Real-time Conversion**: Dynamic currency switching across the app
- **Professional UI**: Clean currency switcher in the app bar
- **Responsive Design**: Works perfectly on all screen sizes

## 🏗️ Current Architecture

### **Project Structure**
```
lib/
├── core/                    # Core utilities and constants
│   ├── app_colors.dart     # Color scheme definitions
│   ├── app_text_styles.dart # Typography system
│   └── responsive.dart  # Responsive layout utilities
├── models/                  # Data models
│   ├── client.dart         # Client data model
│   ├── transaction.dart    # Transaction data model
│   └── sync_data_model.dart # Data synchronization models
├── providers/               # State management
│   └── client_provider.dart # Client data provider
├── services/                # Business logic services
│   ├── currency_service.dart # Currency conversion service
│   └── mock_data.dart      # Sample data for development
├── src/                     # Main application screens
│   ├── auth/               # Authentication screens
│   ├── dashboard/          # Dashboard screens
│   └── clients/            # Client management screens
├── widgets/                 # Reusable UI components
│   ├── app_bar.dart        # Custom app bar component
│   ├── app_navigation_bar.dart # Bottom navigation bar
│   ├── client_card.dart    # Client display card
│   └── currency_switcher.dart # Currency switching widget
└── main.dart               # Application entry point
```

### **State Management**
- **Riverpod**: Modern state management solution
- **Provider Pattern**: For simple state management
- **Consumer Widgets**: Efficient state watching and updates

### **Responsive Design System**
- **Custom Responsive Class**: Handles different screen sizes
- **Breakpoint System**: Mobile (<500px), Tablet (500-800px), Desktop (>800px)
- **Adaptive Layouts**: Components that automatically adjust to screen size
- **Flexible Grids**: Responsive grid systems for optimal viewing

## 🛠️ Technologies & Dependencies

### **Core Framework**
- **Flutter 3.x**: Latest stable Flutter version
- **Dart 3.x**: Modern Dart programming language
- **Material Design 3**: Latest Material Design components

### **Key Packages**
```yaml
dependencies:
  flutter: ^3.0.0
  flutter_riverpod: ^2.4.0          # State management
  intl: ^0.18.0                     # Internationalization
  flutter_svg: ^2.0.0               # SVG support
  # Add other dependencies as needed
```

### **Development Tools**
- **BLoC Pattern**: For complex state management
- **Repository Pattern**: For data access abstraction

### Data Layer
- **RESTful API**: Integration with backend services
- **Shared Preferences**: User preferences and settings

## 🛠️ Technologies Used

### Frontend
- **Flutter 3.x**: Cross-platform mobile development
- **Dart 3.x**: Programming language
- **Material Design 3**: Modern UI components
- **Custom Animations**: Smooth transitions and micro-interactions

### Backend Integration
- **WebSocket**: Real-time data synchronization

### Development Tools
- **VS Code**: Primary development environment
- **Flutter DevTools**: Debugging and profiling
- **Git**: Version control
- **Dart Analysis**: Strict linting and code quality

## 📱 Screens & Features


### **Dashboard Overview**
- **Welcome Section**: Personalized greeting with current date
- **Financial Cards**: Beautiful cards showing target, collected, and owed amounts
- **Truck Inventory**: Visual gas cylinder representation with quantity labels
- **Responsive Layout**: Adapts perfectly to any screen size

### **Client Management**
- **Search Interface**: Clean search bar with responsive design
- **Client Cards**: Informative client display with consistent styling
- **Navigation**: Seamless integration with main app navigation

### **Responsive Design**
- **Mobile First**: Optimized for mobile devices
- **Tablet Support**: Enhanced layouts for medium screens
- **Desktop Ready**: Professional desktop experience
- **Adaptive Components**: All widgets automatically adjust to screen size
=======
### Main Features
- **Dashboard**: Overview of deliveries, clients, and payments
- **Delivery Tracking**: Real-time GPS tracking with status updates
- **Client Management**: Comprehensive client database
- **Payment Collection**: Multiple payment methods with invoice generation

## 🚀 Getting Started

### **Prerequisites**
- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- VS Code or Android Studio
- Git

### **Installation**

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/gaz-distribution-app.git
   cd gaz-distribution-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### **Configuration**
- **Assets**: Ensure all icons and images are in the correct folders
- **Dependencies**: Check `pubspec.yaml` for required packages
- **Responsive Setup**: Customize breakpoints in `responsive.dart` if needed

## 📊 Current Implementation Status

### **✅ Completed Features**
- Responsive dashboard with financial overview
- Truck inventory management system
- Multi-currency support with switcher
- Client management interface
- Custom app bar and navigation
- Responsive design system
- Professional code structure

### **🔄 In Progress**
- Enhanced client search functionality
- Additional dashboard metrics
- More currency options
- Advanced responsive features

### **📋 Planned Features**
- User authentication system
- Real-time data synchronization
- Advanced analytics dashboard
- Offline support capabilities
- Push notifications

## 🔧 Development Guidelines

### **Code Style**
- **Professional Naming**: Use descriptive class names (e.g., `DashboardScreen`, not `Dash`)
- **Responsive Design**: Always implement responsive layouts using the `Responsive` class
- **Component Architecture**: Build reusable, well-documented widgets
- **State Management**: Use Riverpod for efficient state handling

### **Responsive Design Principles**
- **Mobile First**: Design for mobile, enhance for larger screens
- **Breakpoint System**: Use consistent breakpoints (500px, 800px)
- **Flexible Layouts**: Avoid fixed dimensions, use relative sizing
- **Adaptive Components**: All widgets should work on any screen size

### **Best Practices**
- **Documentation**: Comprehensive code comments for portfolio
- **Error Handling**: Graceful error handling and user feedback
- **Performance**: Optimize for smooth animations and fast loading
- **Accessibility**: Ensure app is accessible to all users

## 📈 Performance & Quality

### **Current Metrics**
- **Responsive Design**: 100% responsive across all screen sizes
- **Code Quality**: Professional-grade code structure
- **UI Consistency**: Unified design language throughout the app
- **Performance**: Optimized layouts and efficient state management

### **Quality Standards**
- **Clean Architecture**: Well-organized, maintainable code
- **Responsive UI**: Perfect display on all device sizes
- **Professional Naming**: Industry-standard naming conventions
- **Documentation**: Comprehensive code documentation

## 🤝 Contributing

### **Development Process**
1. Fork the repository
2. Create a feature branch
3. Follow the coding guidelines
4. Implement responsive design
5. Add comprehensive documentation
6. Submit a pull request

### **Code Review Checklist**
- [ ] Responsive design implemented
- [ ] Professional naming conventions used
- [ ] Code properly documented
- [ ] No hardcoded dimensions
- [ ] Follows Flutter best practices

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [](https://github.com/abde-salek)
- LinkedIn: [](https://linkedin.com/in/abde-salek)


## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design team for the design system
- Riverpod team for excellent state management
- Open source community for various packages
- Flutter community for best practices and guidance

---

⭐ **Star this repository if you found it helpful!**


