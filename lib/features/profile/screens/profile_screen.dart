import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/app_theme.dart';
import '../../../core/utils/image_picker_helper.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_text_field.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final shopNameController = TextEditingController();
  final addressController = TextEditingController();
  
  final RxBool isLoading = false.obs;
  final Rx<File?> profileImage = Rx<File?>(null);
  
  @override
  void onInit() {
    super.onInit();
    // Load user data from auth service or API
    // This would typically populate the text controllers with existing data
    loadUserData();
  }
  
  void loadUserData() {
    // Example of loading data - in a real app, you'd get this from your user service
    nameController.text = "John Doe";
    emailController.text = "john.doe@example.com";
    phoneController.text = "123-456-7890";
    shopNameController.text = "Elegant Tailors";
    addressController.text = "123 Fashion Street, Style City";
  }
  
  Future<void> pickProfileImage() async {
    final File? pickedImage = await ImagePickerHelper.pickImage();
    if (pickedImage != null) {
      profileImage.value = pickedImage;
      // Here you would typically upload the image to your backend
    }
  }
  
  Future<void> saveProfile() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    
    try {
      isLoading.value = true;
      
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Here you would send the updated profile data to your backend
      // Example: await _profileService.updateProfile(...)
      
      Get.snackbar(
        'Success',
        'Profile updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.successColor,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update profile: ${e.toString()}',
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
    addressController.dispose();
    super.onClose();
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Profile',
        showBackButton: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile image section
                  Center(
                    child: Column(
                      children: [
                        Obx(() => _buildProfileImage(controller)),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: controller.pickProfileImage,
                          child: const Text(
                            'Change Profile Picture',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Personal Information Section
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textColor,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Name
                  CustomTextField(
                    label: 'Full Name',
                    hint: 'Enter your full name',
                    controller: controller.nameController,
                    prefixIcon: Icons.person_outline,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Email
                  CustomTextField(
                    label: 'Email',
                    hint: 'Enter your email',
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email_outlined,
                    textInputAction: TextInputAction.next,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Phone
                  CustomTextField(
                    label: 'Phone Number',
                    hint: 'Enter your phone number',
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icons.phone_outlined,
                    textInputAction: TextInputAction.next,
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Business Information Section
                  const Text(
                    'Business Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textColor,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Shop Name
                  CustomTextField(
                    label: 'Shop Name',
                    hint: 'Enter your shop name',
                    controller: controller.shopNameController,
                    prefixIcon: Icons.store_outlined,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Address
                  CustomTextField(
                    label: 'Address',
                    hint: 'Enter your shop address',
                    controller: controller.addressController,
                    prefixIcon: Icons.location_on_outlined,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 3,
                    textInputAction: TextInputAction.done,
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Save Button
                  Obx(
                    () => CustomButton(
                      text: 'Save Changes',
                      onPressed: controller.saveProfile,
                      isLoading: controller.isLoading.value,
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildProfileImage(ProfileController controller) {
    return GestureDetector(
      onTap: controller.pickProfileImage,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.primaryColor.withOpacity(0.1),
          border: Border.all(
            color: AppTheme.primaryColor,
            width: 2,
          ),
          image: controller.profileImage.value != null
              ? DecorationImage(
                  image: FileImage(controller.profileImage.value!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: controller.profileImage.value == null
            ? const Icon(
                Icons.person,
                color: AppTheme.primaryColor,
                size: 50,
              )
            : null,
      ),
    );
  }
}