import 'package:controlegastos/controllers/util.dart';
import 'package:controlegastos/widgets/date_picker_input.dart';
import 'package:flutter/material.dart';

class SearchPeriodOfInvestmentsTile extends StatefulWidget {
  final fromDate;
  final untilDate;

  const SearchPeriodOfInvestmentsTile({Key key, this.fromDate, this.untilDate})
      : super(key: key);

  @override
  _SearchPeriodOfInvestmentsTileState createState() =>
      _SearchPeriodOfInvestmentsTileState();
}

class _SearchPeriodOfInvestmentsTileState
    extends State<SearchPeriodOfInvestmentsTile> {
  final _formKey = GlobalKey<FormState>();
  var collorPallete;
  @override
  void initState() {
    collorPallete = getThemeColors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> formResult = new Map();
    final from = TextEditingController();
    final until = TextEditingController();
    return AlertDialog(
      backgroundColor: getColors(colorName: "blue"),
      content: Container(
        height: 250.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "Selecione o Período",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: getColors(colorName: "soft_white"),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: getColors(colorName: "soft_white"),
              ),
              Expanded(
                child: BasicDateField(
                  label: "De",
                  backgroundColor: getColors(colorName: "blue"),
                  defaultValue: widget.fromDate,
                  hasPrefix: false,
                  controller: from,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: BasicDateField(
                  label: "Até",
                  backgroundColor: getColors(colorName: "blue"),
                  controller: until,
                  defaultValue: widget.untilDate,
                ),
              ),
              Divider(
                color: Colors.transparent,
              ),
              RaisedButton(
                padding: EdgeInsets.all(10.0),
                color: Colors.orange,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    formResult['from'] = from.text;
                    formResult['until'] = until.text;
                    Navigator.pop(context, formResult);
                  }
                },
                child: Icon(
                  Icons.search,
                  size: 20.0,
                  color: getColors(colorName: "soft_white"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
