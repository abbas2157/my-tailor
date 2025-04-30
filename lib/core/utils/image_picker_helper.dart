import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../config/app_theme.dart';

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  /// Pick image from gallery or camera
  static Future<File?> pickImage({
    ImageSource? source,
    int imageQuality = 80,
  }) async {
    try {
      // If source is provided, directly pick from that source
      if (source != null) {
        final XFile? pickedFile = await _picker.pickImage(
          source: source,
          imageQuality: imageQuality,
        );
        
        if (pickedFile != null) {
          return File(pickedFile.path);
        }
        return null;
      }
      
      // Otherwise, show selection dialog
      final ImageSource? selectedSource = await showImageSourceDialog();
      if (selectedSource == null) return null;
      
      final XFile? pickedFile = await _picker.pickImage(
        source: selectedSource,
        imageQuality: imageQuality,
      );
      
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.errorColor,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
      );
      return null;
    }
  }

  /// Show dialog to select image source
  static Future<ImageSource?> showImageSourceDialog() async {
    return await Get.dialog<ImageSource>(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Image Source',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSourceOption(
                    context: Get.context!,
                    icon: Icons.camera_alt,
                    title: 'Camera',
                    onTap: () => Get.back(result: ImageSource.camera),
                  ),
                  _buildSourceOption(
                    context: Get.context!,
                    icon: Icons.image,
                    title: 'Gallery',
                    onTap: () => Get.back(result: ImageSource.gallery),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Get.back(),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build image source option widget
  static Widget _buildSourceOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppTheme.primaryColor,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// Pick multiple images from gallery
  static Future<List<File>> pickMultipleImages({
    int imageQuality = 80,
    int maxImages = 5,
  }) async {
    try {
      final List<XFile> pickedFiles = await _picker.pickMultiImage(
        imageQuality: imageQuality,
        maxWidth: 1200,
      );
      
      // Limit number of images if needed
      final limitedFiles = pickedFiles.length > maxImages
          ? pickedFiles.sublist(0, maxImages)
          : pickedFiles;
      
      // Convert XFile to File
      return limitedFiles.map((xFile) => File(xFile.path)).toList();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick images: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.errorColor,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
      );
      return [];
    }
  }
}