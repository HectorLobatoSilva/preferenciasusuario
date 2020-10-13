import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/shared/preferencias_usuario.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero = 1;
  String _nombre = "Pedro";

  TextEditingController _textController;

  final PreferenciasUsuario preferencias = new PreferenciasUsuario();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    preferencias.ultimaPagina = SettingsPage.routeName;
    _colorSecundario = preferencias.colorSecundario;
    _genero = preferencias.genero;
    _nombre = preferencias.nombreUsuario;
    _textController =
        new TextEditingController(text: preferencias.nombreUsuario);
  }

  _setSelectedRadio(int valor) {
    preferencias.genero = valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Ajustes")),
          backgroundColor:
              preferencias.colorSecundario ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text("Settings",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text("Color secundario"),
              onChanged: (value) => setState(() {
                _colorSecundario = value;
                preferencias.colorSecundario = value;
              }),
            ),
            RadioListTile(
              value: 1,
              title: Text("Masculino"),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              groupValue: _genero,
              value: 2,
              title: Text("Femenino"),
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: "Nombre",
                    helperText: "Nombre de la persona usando el telefono"),
                onChanged: (value) => preferencias.nombreUsuario = value,
              ),
            )
          ],
        ));
  }
}
