import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _preferenciasUsuario =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _preferenciasUsuario;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _preferences;

  initPreferences() async {
    this._preferences = await SharedPreferences.getInstance();
    // this._preferences.clear();
  }

  get genero => _preferences.getInt("genero") ?? 1;
  get colorSecundario => _preferences.getBool("color") ?? false;
  get nombreUsuario => _preferences.getString("nombre") ?? "";
  get ultimaPagina => _preferences.getString("pagina") ?? "home";

  set genero(int value) => _preferences.setInt("genero", value);
  set colorSecundario(bool value) => _preferences.setBool("color", value);
  set nombreUsuario(String value) => _preferences.setString("nombre", value);
  set ultimaPagina(String value) => _preferences.setString("pagina", value);
}
