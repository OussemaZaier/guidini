import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';
import 'package:guidini/Screens/Inventory_show_recommendation/main.dart';
import 'package:guidini/Screens/SignUp/config.dart';
import 'package:jwt_decode/jwt_decode.dart';
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
import 'package:guidini/Screens/globals.dart' as globals;

class Budget extends StatefulWidget {
  Budget({Key? key}) : super(key: key);
  final ImagePicker _imagePicker = ImagePicker();

  static const int REQUEST_CAMERA = 1;
  File? capturedImage;

  @override
  State<Budget> createState() => _SignUpState();
}

TextEditingController myController = TextEditingController();

Future<List> recommendItems() async {
  var token = globals.token;
  var userId = Jwt.parseJwt(token)['id'];
  print(userId);
  print('-----------------');
  final response = await http.get(Uri.parse(findInv(userId)));
  print(response);
  final List<dynamic> responseData = json.decode(response.body);
  print(responseData);
  List<String> products = [];
  for (var item in responseData) {
    print("----");
    print(item['productname']);
    products.add(item['productname']);
  }
  print("PRODUCTS = ");
  print(products);

  var product_request = {"history ": products};

  print("SENDING REQUEST:");

  var responseServer = await http.post(Uri.parse('http://10.217.8.139:8000'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode({"history": products}));

  var jsonResponse = jsonDecode(responseServer.body);
  print("*******STATUS= " + jsonResponse.toString());

  var jsonResponseItems = jsonResponse['recommendations'];
  print(jsonResponseItems);
  // var responseQuantity;
  // for (var item in jsonResponseItems) {
  //   print(item);
  //   responseQuantity = await http.post(
  //       Uri.parse('http://10.217.8.139:8003/predict'),
  //       headers: {
  //         "Accept": "application/json",
  //         "Content-Type": "application/json"
  //       },
  //       body: jsonEncode({
  //         "month_cons": Random().nextInt(10) * 2.5,
  //         "inventory": Random().nextInt(10),
  //         "product": item
  //       }));

  //   jsonResponse = jsonDecode(responseQuantity.body);
  //   print("*******QUANTITY= ");
  //   print(jsonResponse['predicted_rec_qte'].round());
  //   if (jsonResponse['predicted_rec_qte'].round() > 0)
  //     ITEMS.items.add([item, jsonResponse['predicted_rec_qte'].round()]);
  // }
  // print("ITEMS:::::::::::::::::::::::::::::::");
  // print(ITEMS.items);

  return jsonResponseItems;
}

class _SignUpState extends State<Budget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              title(
                  text: 'New cart',
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

                    // Field(
                    //   text: 'Enter Your Budget',
                    //   pwd: false,
                    //   placeholder: '170 TND ',
                    //   myController: myController,
                    // ),

                    // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    //   welcomeButton(
                    //       text: "   25DT   ",
                    //       fct: () => {
                    //             setState(() {
                    //               myController.text = '20 TND';
                    //             })
                    //           },
                    //       bgColor: Colors.white,
                    //       txtColor: Colors.black),
                    //   welcomeButton(
                    //       text: "   50DT   ",
                    //       fct: () => {
                    //             setState(() {
                    //               myController.text = '50 TND';
                    //             })
                    //           },
                    //       bgColor: Colors.white,
                    //       txtColor: Colors.black),
                    //   welcomeButton(
                    //     text: "   100DT   ",
                    //     fct: () => {
                    //       setState(() {
                    //         myController.text = '100 TND';
                    //       })
                    //     },
                    //     bgColor: Colors.white,
                    //     txtColor: Colors.black,
                    //   )
                    // ]),

                    welcomeButton(
                      text: 'Get Your Recommendations',
                      fct: () async {
                        ITEMS.items = await recommendItems();

                        print("ITEMS.items BEFORE NAV PUSH = ");
                        print(ITEMS.items);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Inventory_show_recommendation(
                                items: ITEMS.items),
                          ),
                        );
                      },
                      bgColor: kMainGreen,
                      txtColor: Colors.white,
                      icon: Icons.arrow_forward_ios,
                    ),
                    const SizedBox(height: 40.0),
                    const Align(
                        alignment: Alignment.center,
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
                        onPressed: () async {
                          // Appeler la fonction pour envoyer l'image en tant que requête HTTP
                          ITEMS.items = await sendImageToServer();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Newcart(items: ITEMS.items),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kMainGreen,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 40, right: 40, top: 12, bottom: 12),
                          child: Text('Send image',
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

  Future<List> sendImageToServer() async {
    Uri url = Uri.parse(
        'http://10.217.8.139:8005/'); // Remplacez <adresse_du_serveur> par l'adresse réelle du serveur

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
      num sum = 0;
      for (var item in jsonDecode(respStr)) {
        print(item[1]);
        sum = sum + double.parse(item[1]);
      }
      print("SUM == ");
      print(respStr + ", [\"Total\", \"$sum\"]");
      return [respStr, sum];
    } else {
      // Gestion de l'erreur
      print("Erreur lors de l'envoi de l'image*******************************");
      print(respStr);
      return ["ERR", "ERR"];
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
  static List<dynamic> items = [];
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
