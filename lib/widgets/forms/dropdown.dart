import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final Color backgroundColor;
  final List<dynamic> payload;
  final String defaultValue;

  const Dropdown({Key key, this.backgroundColor, this.payload, this.defaultValue}) : super(key: key);

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String value;

  @override
  void initState() {
    super.initState();
    value = (widget.defaultValue == null)
        ? "${widget.payload[0]['id']}"
        : widget.defaultValue;

  }

  String getValue(){
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.only(
              top: 16.0,
              bottom: 16.0,
            ),
            margin: const EdgeInsets.only(right: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            child: Icon(
              Icons.score,
              color: widget.backgroundColor,
            ),
          ),
        ),
        Expanded(
          flex: 14,
          child: DropdownButton<String>(
            value: value,
            icon: Icon(
              Icons.arrow_downward,
              color: Colors.white,
            ),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.white),
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: (String newValue) {
              setState(() {
                value = newValue;
              });
            },
            dropdownColor: widget.backgroundColor,
            items:
                widget.payload.map<DropdownMenuItem<String>>((dynamic value) {
              return DropdownMenuItem<String>(
                value: "${value['id']}",
                child: Text(value['nome']),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
