import 'package:beauty_near/route_generator.dart';
import 'package:beauty_near/widgets/bottom%20sheet/image_selection_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  String? _profileImagePath;
  String? get getProfileImagePath => _profileImagePath;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // TextEditingControllers for Login (if needed)
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  // Form Keys
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Loading states
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Error messages
  String? _errorMessage;

  // Getters
  bool get isLoading => _isLoading;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  String? get errorMessage => _errorMessage;

  // Toggle password visibility
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  // Validation methods
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    // Adjust regex based on your requirements
    final phoneRegex = RegExp(r'^\+?[\d\s-()]+$');
    if (!phoneRegex.hasMatch(value) || value.length < 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    // Add more password strength requirements if needed
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Signup method
  Future<void> signup(BuildContext context) async {
    if (signupFormKey.currentState!.validate()) {
      Navigator.pushNamed(context, otpScreen, arguments: {'forget': true});
      // _setLoading(true);
      // _errorMessage = null;
      //
      // try {
      //   // Simulate API call
      //   await Future.delayed(const Duration(seconds: 2));
      //
      //
      //
      //   // Navigate to OTP screen on success
      //   if (context.mounted) {
      //     Navigator.pushNamed(
      //       context,
      //       otpScreen, // Replace with your route constant
      //     ); // Replace with your route constant
      //   }
      // } catch (error) {
      //   _errorMessage = error.toString();
      //   notifyListeners();
      // } finally {
      //   _setLoading(false);
      // }
    }
  }

  // Social login methods
  Future<void> signInWithGoogle(BuildContext context) async {
    _setLoading(true);
    _errorMessage = null;

    try {
      // Implement Google Sign In
      await Future.delayed(const Duration(seconds: 2));

      // Navigate on success
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/locationScreen', // Replace with your route constant
          (_) => false,
        );
      }
    } catch (error) {
      _errorMessage = 'Google sign in failed: ${error.toString()}';
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signInWithFacebook(BuildContext context) async {
    _setLoading(true);
    _errorMessage = null;

    try {
      // Implement Facebook Sign In
      await Future.delayed(const Duration(seconds: 2));

      // Navigate on success
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/locationScreen', // Replace with your route constant
          (_) => false,
        );
      }
    } catch (error) {
      _errorMessage = 'Facebook sign in failed: ${error.toString()}';
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // Clear form
  void clearSignupForm() {
    fullNameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    _errorMessage = null;
    notifyListeners();
  }

  // Clear error
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // Private helper
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Dispose controllers
  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  Future<void> setProfileImagePath({required BuildContext context}) async {
    final String? imagePath = await ImageSelectionBottomSheet.show(
      context: context,
      title: 'Select Profile Image',
    );

    if (imagePath != null) {
      _profileImagePath = imagePath;
    }
    notifyListeners();
  }
}
