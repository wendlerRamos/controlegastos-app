import 'package:mobx/mobx.dart';
part 'goal.g.dart';

class Goal = _GoalBase with _$Goal;

abstract class _GoalBase with Store {
    String name;
    String description;
    double priority;
    double expectedValue;
    DateTime limitDate;
    String urlPhoto;
    bool status;
    double currentValue;
    BigInt id;

  @observable
  _GoalBase.fromJson(Map<String, dynamic> json)
      : priority = double.parse(json['prioridade']),
        name =json['nome'],
        description = json['descricao'],
        expectedValue =  double.parse(json['valor_total']),
        limitDate = DateTime.parse(json['data_limite']),
        urlPhoto = json['url_foto'],
        status = json['status'],
        currentValue = double.parse(json['valor_atual']),
        id = BigInt.parse(json['id']);

  toJson() => {
        'prioridade': priority,
        'nome': name,
        'descricao': description,
        'valor_total': expectedValue,
        'data_limite': limitDate,
        'url_foto': urlPhoto,
        'status': status,
        'valor_atual': id,
        'id': id,
      };
}