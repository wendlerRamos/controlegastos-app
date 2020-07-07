const host = "http://192.168.0.12:8000";
//const host = "https://controledegastos.herokuapp.com";
const ROUTES = {
  "main_dash_data": "$host/teste",
};

String getRoute(String routeName){
  print(ROUTES);
  return ROUTES[routeName];
}