import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:guidini/Components/field.dart';
import 'package:guidini/Screens/Newcart/main.dart';

import 'package:guidini/Screens/Inventory_init/main.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/counter/ProductItemState.dart';
import 'package:guidini/Screens/CameraActivity.dart';
import 'package:guidini/Screens/title.dart';
import 'package:guidini/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class Budget extends StatefulWidget {
   Budget({Key? key}) : super(key: key);
   final ImagePicker _imagePicker = ImagePicker();

  static const int REQUEST_CAMERA = 1;
   File? capturedImage;

  @override
  State<Budget> createState() => _SignUpState();
}

TextEditingController myController = TextEditingController();

class _SignUpState extends State<Budget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              title(
                  text: 'Budget',
                  txtColor: Colors.white,
                  bgColor1: kMainGreen,
                  bgColor2: Colors.green),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    kSizedBox1,
                    kSizedBox1,

                    SizedBox(
                        height:
                            5.0), // Utilise SizedBox ici au lieu de kSizedBox1

                    Field(
                      text: 'Enter Your Budget',
                      pwd: false,
                      placeholder: '170 TND ',
                      myController: myController,
                    ),

                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      welcomeButton(
                          text: "   25DT   ",
                          fct: () => {
                                setState(() {
                                  myController.text = '20 TND';
                                })
                              },
                          bgColor: Colors.white,
                          txtColor: Colors.black),
                      welcomeButton(
                          text: "   50DT   ",
                          fct: () => {
                                setState(() {
                                  myController.text = '50 TND';
                                })
                              },
                          bgColor: Colors.white,
                          txtColor: Colors.black),
                      welcomeButton(
                        text: "   100DT   ",
                        fct: () => {
                          setState(() {
                            myController.text = '100 TND';
                          })
                        },
                        bgColor: Colors.white,
                        txtColor: Colors.black,
                      )
                    ]),

                    welcomeButton(
                      text: 'Get Your Cart',
                      fct: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Newcart(),
                          ),
                        );
                      },
                      bgColor: kMainGreen,
                      txtColor: Colors.white,
                      icon: Icons.arrow_forward_ios,
                    ),
                    SizedBox(height: 40.0),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Already Shopped?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Lato',
                          ),
                        )),
                    welcomeButton(
                      text: 'Scan your Receipt',
                     fct: () => openCamera(),
                      bgColor: Colors.grey,
                      txtColor: Colors.white,
                      icon: Icons.arrow_forward_ios,
                    ),
                     if (capturedImage != null) // Afficher l'image si elle est disponible
              Image.file(capturedImage!),  SizedBox(height: 20),
          

                    // Utilise SizedBox ici au lieu de kSizedBox1
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  final ImagePicker _imagePicker = ImagePicker();
  File? capturedImage;
 
void openCamera() async {
    if (await _requestCameraPermission()) {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
      );

      if (image != null) {
        // Get the directory to store the captured images
        final Directory appDir = await getApplicationDocumentsDirectory();
        print(appDir.path);
        // Create a new directory "captured_images" under the app's writable directory
        final Directory imagesDir = Directory('${appDir.path}/captured_images');
        if (!await imagesDir.exists()) {
          await imagesDir.create(recursive: true);
        }

        // Get the name of the file from the captured image path
        String fileName = image.path.split('/').last;
        // Copy the captured image to the "captured_images" directory
        File newImage = await File(image.path).copy('${imagesDir.path}/$fileName');
     
        setState(() {
          capturedImage = newImage; // Mettre à jour la variable avec le nouveau fichier
        });
      }
    }
   else {
      // Gérez le cas où l'utilisateur a refusé l'autorisation de la caméra.
      // Vous pouvez demander l'autorisation à nouveau ou afficher un message.
    }
  }
 

  Future<bool> _requestCameraPermission() async {
    final PermissionStatus cameraPermissionStatus = await Permission.camera.request();
    return cameraPermissionStatus.isGranted;
  }

}

 
class signUpWithCard extends StatelessWidget {
  signUpWithCard({
    Key? key, // Ajoutez Key? ici pour corriger l'erreur
    required this.title,
    required this.icon,
  });

  String title;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black54,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black87,
              size: 50,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Lato',
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

