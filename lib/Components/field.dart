import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  Field(
      {Key? key,
      required this.text,
      required this.pwd,
      required this.placeholder})
      : super(key: key);
  String text;
  bool pwd;
  String placeholder;
  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontFamily: 'Lato',
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: widget.placeholder,
              fillColor: Colors.white70,
              suffixIcon: widget.pwd
                  ? _visible
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _visible = false;
                            });
                          },
                          icon: Icon(Icons.visibility),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              _visible = true;
                            });
                          },
                          icon: Icon(Icons.visibility_off),
                        )
                  : SizedBox(),
            ),
            obscureText: widget.pwd ? !_visible : false,
          ),
        ],
      ),
    );
  }
}
