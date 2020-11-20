import 'package:mobx/mobx.dart';

part 'investment.g.dart';

class Investment = _InvestmentBase with _$Investment;

abstract class _InvestmentBase with Store {
  BigInt id;
  BigInt idGoal;
  BigInt idInvestmentPlace;
  DateTime aplicationDate;
  DateTime aplicationDueDate;
  double aplicatedValue;
  double yieldValue;
  bool isActive;

  @observable
  _InvestmentBase.fromJson(Map<String, dynamic> json)
      : aplicatedValue = double.parse(json['valor_original']),
        yieldValue = double.parse(json['valor_rendimento']),
        aplicationDueDate = DateTime.parse(json['vencimento']),
        aplicationDate = DateTime.parse(json['data']),
        idGoal = BigInt.parse(json['id_meta']),
        idInvestmentPlace = BigInt.parse(json['id_local']),
        isActive = json['status'],
        id = json['id'];
        

  toJson() => {
        'valor_original': aplicatedValue,
        'valor_rendimento': yieldValue,
        'vencimento': aplicationDueDate,
        'data': aplicationDate,
        'id_meta': idGoal,
        'id_local': idInvestmentPlace,
        'status': isActive,
        'id': id,
      };
}