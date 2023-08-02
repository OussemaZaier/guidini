import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/material.dart';
import 'package:guidini/Screens/SignIn/signinScreen.dart';
import 'package:guidini/Screens/SignUp/signupScreen.dart';
import 'package:guidini/Screens/Inventory_init_show/main.dart';
import 'package:guidini/Screens/Welcome/welcomeScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/utils/constants.dart';
import 'package:image_picker/image_picker.dart';

import '../CameraActivity.dart';
import 'ImageScreen.dart';

class Inventory_init_choice extends StatefulWidget {
  Inventory_init_choice({Key? key}) : super(key: key);
  final ImagePicker _imagePicker = ImagePicker();

  static const int REQUEST_CAMERA = 1;

  @override
  State<Inventory_init_choice> createState() => _SignUpState();
}

class _SignUpState extends State<Inventory_init_choice> {
  File? capturedImage;

  @override
  Widget build(BuildContext context) {
    return Welcome(
      child: Column(
        children: [
          Column(
            children: [
              welcomeButton(
                text: "Scan my last receipt",
                fct: () => openCamera(),
                bgColor: Colors.white,
                txtColor: kMainGreen,
                icon: Icons.receipt_long_outlined,
              ),
              welcomeButton(
                text: "Enter manually",
                fct: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Inventory_init_show(),
                    ),
                  )
                },
                bgColor: Colors.white,
                txtColor: kMainGreen,
                icon: Icons.keyboard,
              ),
            ],
          ),
          kSizedBox1,
          InkWell(
            child: Text(
              'Skip for now',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 209, 209, 209),
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Inventory_init_show(),
                ),
              );
            },
          ),
        ],
      ),
      title: 'What do you \n have at home?',
    );
  }
void _navigateToImageScreen(File? capturedImage) {
  if (capturedImage != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageScreen(capturedImage: capturedImage),
      ),
    );
  }
}
  void openCamera() async {
    if (await _requestCameraPermission()) {
      final XFile? image = await widget._imagePicker.pickImage(
        source: ImageSource.camera,
      );

      if (image != null) {
        // Get the external storage directory of the application
        final Directory? appDir = await getExternalStorageDirectory();
        // Create a new folder "captured_images" under the application directory
        final Directory imagesDir = Directory('${appDir!.path}/guidini/images');
        if (!await imagesDir.exists()) {
          try {
            await imagesDir.create(recursive: true);
            print('Folder created successfully.');
          } catch (e) {
            print('Error creating folder: $e');
          }
        }

        // Get the name of the captured image file
        String fileName = image.path.split('/').last;
        // Copy the captured image to the "guidini/images" directory
        File newImage = await File(image.path).copy('${imagesDir.path}/$fileName');
          

        setState(() {
          capturedImage = newImage; // Update the variable with the new file
        });
        _navigateToImageScreen(capturedImage);
       
       
      }
    } else {
      // Handle the case where the user has denied camera permission.
      // You may request permission again or display a message.
    }
  }

  Future<bool> _requestCameraPermission() async {
    final PermissionStatus cameraPermissionStatus = await Permission.camera.request();
    return cameraPermissionStatus.isGranted;
  }
}
