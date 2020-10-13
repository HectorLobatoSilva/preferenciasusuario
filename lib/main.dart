import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/pages/home_page.dart';
import 'package:preferenciasusuario/src/pages/settings_page.dart';
import 'package:preferenciasusuario/src/shared/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = new PreferenciasUsuario();
  await preferences.initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final preferences = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Preferencias',
        debugShowCheckedModeBanner: false,
        initialRoute: preferences.ultimaPagina,
        routes: {
          HomePage.routeName: (BuildContext context) => HomePage(),
          SettingsPage.routeName: (BuildContext context) => SettingsPage()
        });
  }
}
