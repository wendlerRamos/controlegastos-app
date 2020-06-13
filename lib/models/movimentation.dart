import 'package:mobx/mobx.dart';
part 'movimentation.g.dart';

class Movimentation = _MovimentationBase with _$Movimentation;

abstract class _MovimentationBase with Store {
  String kind;
  String category;
  String paymentKind;
  double value;
  DateTime date;
  BigInt id;

  @observable
  _MovimentationBase.fromJson(Map<String, dynamic> json)
      : kind = json['tipo'],
        category = json['descricao'],
        paymentKind = json['tipo_pgto'],
        value = double.parse(json['valor']),
        date = DateTime.parse(json['data']),
        id = BigInt.parse(json['id']);

  toJson() => {
        'tipo': kind,
        'descricao': category,
        'tipo_pgto': paymentKind,
        'valor': value,
        'data': date,
        'id': id,
      };
}
