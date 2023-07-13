import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItem extends StatefulWidget {
  ProductItem({required this.title, required this.price});

  final String title;
  final int price;

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  ProductController _productController = Get.put(ProductController());
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Item'),
      ),
      body: ListTile(
        tileColor: Theme.of(context).primaryColor,
        title: Text(widget.title),
        trailing: SizedBox(
          width: 200,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Row(
                children: <Widget>[
                  counter != 0
                      ? IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              counter--;
                              _productController.decrement(widget.price);
                            });
                          },
                        )
                      : Container(),
                  Text("tomate: $counter"),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        counter++;
                        _productController.increment(widget.price);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductController {
  RxInt counter = 0.obs;

  void increment(int price) {
    counter.value++;
    // Perform any other logic you need when incrementing
  }

  void decrement(int price) {
    if (counter.value > 0) {
      counter.value--;
      // Perform any other logic you need when decrementing
    }
  }
}
