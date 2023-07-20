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
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;



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
  Image.file(File(capturedImage!.path)),
SizedBox(height: 20),
if (isImageCaptured) // Affiche le bouton d'envoi uniquement si une image est capturée
  ElevatedButton(
    onPressed: () {
      // Appeler la fonction pour envoyer l'image en tant que requête HTTP
      sendImageToServer(XFile(capturedImage!.path));
    },
    child: Text('Envoyer l\'image'),
  ),

          

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
 Future<void> sendImageToServer(XFile imageFile) async {
    // Construire l'URL du serveur Flask
    final String serverUrl = 'http://192.168.1.194:8000/';

    try {
      // Lire le fichier de l'image en tant que bytes
      List<int> imageBytes = await imageFile.readAsBytes();
       img.Image? originalImage = img.decodeImage(imageBytes);
      img.Image resizedImage = img.copyResize(originalImage!, width: 400);
      List<int> resizedImageBytes = img.encodeJpg(resizedImage, quality: 80);

      // Créer une requête HTTP POST avec l'image
      var request = http.MultipartRequest('POST', Uri.parse(serverUrl));
      request.files.add(http.MultipartFile.fromBytes('image', resizedImageBytes, filename: 'image.jpg'));
      

      // Envoyer la requête au serveur
      var response = await request.send();
      print(response);

      
      // Vérifier la réponse du serveur
      if (response.statusCode == 200) {
        print("Image envoyée avec succès !");
        // Vous pouvez traiter la réponse du serveur ici si nécessaire
        // Par exemple, si le serveur renvoie des données au format JSON
        // vous pouvez les analyser à l'aide de la classe 'http.Response'
        // et 'dart:convert'.
      } else {
        print("Échec de l'envoi de l'image. Code de statut : ${response.statusCode}");
      }
    } catch (e) {
      print("Erreur lors de l'envoi de l'image : $e");
    }
  }








  Future<String> getImagesDirectoryPath() async {
  final Directory appDir = await getApplicationDocumentsDirectory();
  final String imagesDirPath = path.join(appDir.path, 'my_images');

  return imagesDirPath;
}
  final ImagePicker _imagePicker = ImagePicker();
  File? capturedImage;
 Future<Directory> createDirectory() async {
  final String imagesDirPath = await getImagesDirectoryPath();
  final Directory appDir = Directory(imagesDirPath);
  
  if (!await appDir.exists()) {
    return await appDir.create(recursive: true);
  } else {
    return appDir;
  }
}

 bool isImageCaptured = false;
void openCamera() async {
  if (await _requestCameraPermission()) {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      final Directory appDir = await createDirectory();
      String fileName = path.basename(image.path);
      File newImage = await File(image.path).copy(path.join(appDir.path, fileName));

      setState(() {
        capturedImage = newImage;
        isImageCaptured = true;
      });
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

