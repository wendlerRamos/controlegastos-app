import 'package:controlegastos/controllers/request.dart';
import 'package:flutter/material.dart';
import 'package:controlegastos/controllers/routes.dart' as Routes;

class InvestmentsDashboardResumeBlockTile extends StatefulWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;

  const InvestmentsDashboardResumeBlockTile(
      {Key key, this.textColor, this.backgroundColor, this.borderColor})
      : super(key: key);

  @override
  _InvestmentsDashboardResumeBlockTileState createState() =>
      _InvestmentsDashboardResumeBlockTileState();
}

class _InvestmentsDashboardResumeBlockTileState
    extends State<InvestmentsDashboardResumeBlockTile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataFromAPI(Routes.getRoute('teste')),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return _buildProgressIndicator();
            break;
          default:
            if (snapshot.hasError ||
                !snapshot.hasData ||
                snapshot.data.containsKey("error")) {
              return _buildErrorContent();
            } else {
              return _buildSuccessContent(context, snapshot.data);
            }
        }
      },
    );
  }

  Widget _buildSuccessContent(BuildContext context, Map data) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, left: 8.0, right: 8.0, bottom: 5.0),
      padding: const EdgeInsets.all(
        8.0,
      ),
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: widget.borderColor,
        ),
        color: widget.backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Total Guardado',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.textColor,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Total de Rendimentos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.textColor,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'R\$ 10.000,00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'R\$ 100,00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: widget.textColor,
            thickness: 2.0,
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Guardado este mês',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.textColor,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Média por mês',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.textColor,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'R\$ 1.000,00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'R\$ 1050,00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      margin: EdgeInsets.all(4.0),
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: widget.backgroundColor,
        border: Border.all(
          color: widget.borderColor,
          width: 2.0,
        ),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            widget.textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildErrorContent() {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        height: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: widget.backgroundColor,
          border: Border.all(
            color: widget.borderColor,
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 40,
              color: widget.textColor,
            ),
            Text(
              'Erro de conexão',
              style: TextStyle(
                color: widget.textColor,
              ),
            ),
            Text(
              'Toque para tentar novamente',
              style: TextStyle(
                color: widget.textColor,
                fontSize: 12,
              ),
            ),
            Divider(
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
