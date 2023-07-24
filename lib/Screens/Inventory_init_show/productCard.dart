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
    required this.quantity,
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
  int quantity;

  @override
  _productCardState createState() => _productCardState();
}

class _productCardState extends State<productCard> {
  void incrementQuantity() {
    setState(() {
      widget.quantity++;
    });
  }

  void decrementQuantity() {
    if (widget.quantity > 0) {
      setState(() {
        widget.quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.fct,
      child: Container(
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,

              // width: widget.quantity == -1 ? 250 : 220,
              // width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [
                  if (widget.icon != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Image.asset(
                        'assets/images/blackLogo.png',
                        width: 50,
                        height: 50,
                      ),
                    )
                  else
                    SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Container(
                      color: Colors.red,
                      constraints: BoxConstraints(maxWidth: 135),

                      // width: MediaQuery.of(context).size.width * 0.32,
                      // width: widget.quantity == -1 ? 150 : 100,

                      child: Text(
                        widget.text1,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: widget.txtColor,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (widget.quantity != -1)
              Container(
                color: Colors.yellow,
                // width: 50,
                height: 5,
                child: Text(
                  widget.text2,
                  style: TextStyle(
                    fontSize: 17,
                    color: widget.txtColor,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
            Expanded(
              flex: 1,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                        Container(width: 20, height: 20),
                      if (widget.quantity == -1)
                        Text(
                          widget.text2,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: widget.txtColor,
                            fontFamily: 'Lato',
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            widget.quantity.toString(),
                            style: TextStyle(
                              fontSize: 17,
                              color: widget.txtColor,
                              fontFamily: 'Lato',
                            ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
