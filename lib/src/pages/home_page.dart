import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/shared/preferencias_usuario.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final preferencias = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    preferencias.ultimaPagina = routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de usuario"),
        backgroundColor:
            preferencias.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color secundario: ${preferencias.colorSecundario} "),
          Divider(),
          Text("Genero: ${preferencias.genero}"),
          Divider(),
          Text("Nombre de usuario: ${preferencias.nombreUsuario}"),
          Divider(),
        ],
      ),
    );
  }
}
