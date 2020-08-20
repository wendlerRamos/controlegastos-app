const host = "http://192.168.0.12:8000";
//const host = "https://controledegastos.herokuapp.com";
const ROUTES = {
  "google": "https://www.google.com",
  "main_dash_data": "$host/teste",
  "movimentations_list": "$host/teste/movs",
};

String getRoute(String routeName){
  //print(ROUTES);
  return ROUTES[routeName];
}