import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BasicDateField extends StatelessWidget {
  final Color backgroundColor;
  final DateTime defaultValue;
  final String label;
  final bool hasPrefix;
  final TextEditingController controller;
  final bool isRequired;
  final TextStyle errorStyle;
  const BasicDateField({
    Key key,
    this.backgroundColor,
    this.defaultValue,
    this.label,
    this.hasPrefix = true,
    this.controller,
    this.isRequired = false,
    this.errorStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd/MM/yyyy");

    return Column(children: <Widget>[
      DateTimeField(
        initialValue: defaultValue,
        format: format,
        controller: controller,
        validator: (value) {
          if(isRequired && controller.text.isEmpty){
            return "Campo obrigatório";
          }
          return null;
        },
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          errorStyle: errorStyle,
          contentPadding: const EdgeInsets.all(16.0),
          prefixIcon: Container(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
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
              Icons.calendar_today,
              color: backgroundColor,
            ),
          ),
          labelText: (label != null) ? label : "Data",
          labelStyle: TextStyle(color: Colors.white54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
        ),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic time field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic date & time field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    ]);
  }
}
