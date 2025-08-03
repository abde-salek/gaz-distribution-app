// import '../models/user.dart';

// class AuthService {
//   static User? _currentUser;

//   static User? get currentUser => _currentUser;

//   static bool get isLoggedIn => _currentUser != null;

//   static Future<bool> signUp({
//     required String name,
//     required String phoneNumber,
//   }) async {
//     // TODO: Implement actual signup logic with API
//     await Future.delayed(const Duration(seconds: 1)); // Simulate API call

//     _currentUser = User(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       name: name,
//       phoneNumber: phoneNumber,
//       isVerified: false,
//       createdAt: DateTime.now(),
//     );

//     return true;
//   }

//   static Future<bool> verifyOTP({
//     required String phoneNumber,
//     required String otp,
//   }) async {
//     // TODO: Implement actual OTP verification with API
//     await Future.delayed(const Duration(seconds: 1)); // Simulate API call

//     if (_currentUser != null) {
//       _currentUser = _currentUser!.copyWith(isVerified: true);
//       return true;
//     }

//     return false;
//   }

//   static Future<bool> login({
//     required String name,
//     required String phoneNumber,
//   }) async {
//     // TODO: Implement actual login logic with API
//     await Future.delayed(const Duration(seconds: 1)); // Simulate API call

//     _currentUser = User(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       name: name,
//       phoneNumber: phoneNumber,
//       isVerified: true,
//       createdAt: DateTime.now(),
//       lastLoginAt: DateTime.now(),
//     );

//     return true;
//   }

//   static void logout() {
//     _currentUser = null;
//   }
// } 