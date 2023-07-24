import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Newcart/main.dart';




  class ImageScreen extends StatelessWidget {
    final File? capturedImage;

    ImageScreen({required this.capturedImage});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Capturée'),
      ),
      body: Center(
        child: capturedImage == null
            ? Text('Aucune image capturée')
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.file(capturedImage!),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      List items = await sendImageToServer();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Newcart(items: items),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Envoyer l\'image',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  
  Future<List> sendImageToServer() async {
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






  

 
}


