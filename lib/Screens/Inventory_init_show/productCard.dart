import 'package:flutter/material.dart';

class productCard extends StatefulWidget {
  productCard({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.fct,
    this.icon,
    required this.bgColor,
    required this.txtColor,
    required this.shadow,
    required this.add_remove,
    required int quantity,
  }) : super(key: key);

  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final IconData? icon;
  final VoidCallback fct;
  final Color bgColor;
  final Color txtColor;
  final bool shadow;
  final bool add_remove;

  @override
  _productCardState createState() => _productCardState();
}

class _productCardState extends State<productCard> {
  int quantity = 0;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.fct,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: widget.shadow
                  ? Color.fromARGB(70, 0, 0, 0)
                  : Color.fromARGB(0, 0, 0, 0),
              blurRadius: 6,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 190,
              child: Row(
                children: [
                  if (widget.icon != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Image.asset(
                        'assets/images/blackLogo.png',
                        height: 42,
                        width: 42,
                      ),
                    )
                  else
                    SizedBox(),
                  Text(
                    widget.text1,
                    style: TextStyle(
                      fontSize: 17,
                      color: widget.txtColor,
                      fontFamily: 'Lato',
                    ),
                  ),
                ],
              ),
            ),
            Container(width: 8),
            Container(
              width: 80,
              child: Text(
                widget.text2,
                style: TextStyle(
                  fontSize: 17,
                  color: widget.txtColor,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  if (widget.add_remove == true)
                    InkWell(
                      onTap: decrementQuantity,
                      child: Icon(
                        Icons.remove,
                        color: widget.txtColor,
                        size: 20,
                      ),
                    )
                  else
                    SizedBox(width: 20),
                  Text(
                    quantity.toString(),
                    style: TextStyle(
                      fontSize: 17,
                      color: widget.txtColor,
                      fontFamily: 'Lato',
                    ),
                  ),
                  if (widget.add_remove == true)
                    InkWell(
                      onTap: incrementQuantity,
                      child: Icon(
                        Icons.add,
                        color: widget.txtColor,
                        size: 20,
                      ),
                    )
                  else
                    SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
