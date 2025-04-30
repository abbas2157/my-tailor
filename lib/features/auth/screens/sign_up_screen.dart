import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/app_constants.dart';
import '../../../config/app_theme.dart';
import '../../../config/routes.dart';
import '../../../core/utils/validators.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../services/auth_service.dart';

class SignUpController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final shopNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  final RxBool isLoading = false.obs;
  final RxBool agreeToTerms = false.obs;
  
  void toggleAgreeToTerms(bool? value) {
    if (value != null) {
      agreeToTerms.value = value;
    }
  }
  
  String? validateConfirmPassword(String? value) {
    return Validators.validateConfirmPassword(
      value,
      passwordController.text,
    );
  }
  
  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    
    if (!agreeToTerms.value) {
      Get.snackbar(
        'Error',
        'Please agree to the Terms & Conditions',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.errorColor,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
      );
      return;
    }
    
    try {
      isLoading.value = true;
      
      await _authService.register(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        phone: phoneController.text.trim(),
        shopName: shopNameController.text.trim(),
      );
      
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.errorColor,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    shopNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Sign Up',
        showBackButton: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header section
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          AppConstants.logoPath,
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Create an Account',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Enter your details to get started',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.subtextColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Name
                  CustomTextField(
                    label: 'Full Name',
                    hint: 'Enter your full name',
                    controller: controller.nameController,
                    prefixIcon: Icons.person_outline,
                    validator: Validators.validateName,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Email
                  CustomTextField(
                    label: 'Email',
                    hint: 'Enter your email',
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email_outlined,
                    validator: Validators.validateEmail,
                    textInputAction: TextInputAction.next,
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Phone
                  CustomTextField(
                    label: 'Phone Number',
                    hint: 'Enter your phone number',
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icons.phone_outlined,
                    validator: Validators.validatePhone,
                    textInputAction: TextInputAction.next,
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Shop Name
                  CustomTextField(
                    label: 'Shop Name',
                    hint: 'Enter your shop name',
                    controller: controller.shopNameController,
                    prefixIcon: Icons.store_outlined,
                    validator: (value) => Validators.validateRequired(
                      value,
                      'Shop name',
                    ),
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Password
                  CustomTextField(
                    label: 'Password',
                    hint: 'Enter your password',
                    controller: controller.passwordController,
                    obscureText: true,
                    prefixIcon: Icons.lock_outline,
                    validator: Validators.validatePassword,
                    textInputAction: TextInputAction.next,
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Confirm Password
                  CustomTextField(
                    label: 'Confirm Password',
                    hint: 'Confirm your password',
                    controller: controller.confirmPasswordController,
                    obscureText: true,
                    prefixIcon: Icons.lock_outline,
                    validator: controller.validateConfirmPassword,
                    textInputAction: TextInputAction.done,
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Terms and Conditions
                  Obx(
                    () => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: controller.agreeToTerms.value,
                            onChanged: controller.toggleAgreeToTerms,
                            activeColor: AppTheme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 14,
                                color: AppTheme.subtextColor,
                              ),
                              children: [
                                TextSpan(text: 'I agree to the '),
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: TextStyle(
                                    color: AppTheme.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(text: ' and '),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: AppTheme.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Sign up button
                  Obx(
                    () => CustomButton(
                      text: 'Sign Up',
                      onPressed: controller.signUp,
                      isLoading: controller.isLoading.value,
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Sign in link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.subtextColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}