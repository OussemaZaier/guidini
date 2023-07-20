import 'dart:convert';
import 'dart:io';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:guidini/Components/field.dart';
import 'package:guidini/Screens/Newcart/main.dart';

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
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    kSizedBox1,
                    kSizedBox1,

                    const SizedBox(
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
                            builder: (context) => Newcart(items: ITEMS.items),
                          ),
                        );
                      },
                      bgColor: kMainGreen,
                      txtColor: Colors.white,
                      icon: Icons.arrow_forward_ios,
                    ),
                    const SizedBox(height: 40.0),
                    const Align(
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
                    kSizedBox1,
                    kSizedBox1,
                    if (capturedImage !=
                        null) // Afficher l'image si elle est disponible
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Image.file(capturedImage!)),
                    const SizedBox(height: 20),
                    if (isImageCaptured) // Affiche le bouton d'envoi uniquement si une image est capturée
                      ElevatedButton(
                        onPressed: () {
                          // Appeler la fonction pour envoyer l'image en tant que requête HTTP
                          sendImageToServer().then((value) {
                            ITEMS.items = value;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kMainGreen,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 40, right: 40, top: 12, bottom: 12),
                          child: const Text('Envoyer l\'image',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Lato',
                              )),
                        ),
                      ),

                    // Utilise SizedBox ici au lieu de kSizedBox1
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> sendImageToServer() async {
    Uri url = Uri.parse(
        'http://192.168.1.194:8000/'); // Remplacez <adresse_du_serveur> par l'adresse réelle du serveur

    var request = http.MultipartRequest('POST', url);
    print("URL = $url");
    request.files
        .add(await http.MultipartFile.fromPath('image', capturedImage!.path));
    print("Sending request:-----");
    final response = await request.send();
    final respStr = await response.stream.bytesToString();


    if (response.statusCode == 200) {
      // Traitement de la réponse du serveur
      print("Image envoyée avec succès*******************************");
      print(respStr);
      return respStr;
      for (var item in jsonDecode(respStr)) {
        print(item);
        print(item[0]);
        productCard(
          text1: item[0],
          text2: "A",
          text3: "B",
          text4: "C",
          fct: () => {},
          bgColor: Colors.white,
          txtColor: Colors.black,
          shadow: false,
          icon: Icons.arrow_forward_ios,
          add_remove: false,
          quantity: 0,
        );
      }
    } else {
      // Gestion de l'erreur
      print("Erreur lors de l'envoi de l'image*******************************");
      print(respStr);
      return "ERR";
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
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.camera);

      if (image != null) {
        final Directory appDir = await createDirectory();
        String fileName = path.basename(image.path);
        File newImage =
            await File(image.path).copy(path.join(appDir.path, fileName));

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
    final PermissionStatus cameraPermissionStatus =
        await Permission.camera.request();
    return cameraPermissionStatus.isGranted;
  }
}

class ITEMS {
  static String items = "[]";
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
              style: const TextStyle(
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