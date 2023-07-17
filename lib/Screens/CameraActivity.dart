import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraActivity extends StatefulWidget {
  @override
  _CameraActivityState createState() => _CameraActivityState();
}

class _CameraActivityState extends State<CameraActivity> {
  final ImagePicker _imagePicker = ImagePicker();

  static const int REQUEST_CAMERA = 1;

  @override
  void initState() {
    super.initState();
    openCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Activity'),
      ),
      body: Container(
        // Vous pouvez personnaliser l'interface utilisateur ici si nécessaire.
      ),
    );
  }

  void openCamera() async {
    if (await _requestCameraPermission()) {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
      );

      if (image != null) {
        // Do something with the captured image.
        // For example, save it to the galerie, display it, etc.
      }
    } else {
      // Gérez le cas où l'utilisateur a refusé l'autorisation de la caméra.
      // Vous pouvez demander l'autorisation à nouveau ou afficher un message.
    }
  }

  Future<bool> _requestCameraPermission() async {
    final PermissionStatus cameraPermissionStatus = await Permission.camera.request();
    return cameraPermissionStatus.isGranted;
  }
}
