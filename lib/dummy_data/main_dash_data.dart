Map<String, dynamic> getDashDataJson() {
  Future.delayed(Duration(milliseconds: 1000));
  return {
    "updated_at": "01/01/2020",
    "spent_card": {
      "total": 1500,
      "avarage": 1000,
    },
    "profit_card": {
      "total": 900,
      "avarage": 850,
    },
    "categories": {
      "mercado": {"total": 200, "avarage": 250},
      "alimentacao": {"total": 150, "avarage": 80},
      "transporte": {"total": 250, "avarage": 280},
      "conta": {"total": 500, "avarage": 450},
      "educacao": {"total": 50, "avarage": 0},
      "lazer": {"total": 200, "avarage": 120},
      "saude": {"total": 180, "avarage": 60},
      "outro": {"total": 120, "avarage": 150},
      "porcentagem": {"total": 50, "avarage": 65},
    },
  };
}
