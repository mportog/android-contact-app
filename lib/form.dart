import 'package:flutter/material.dart';

class FormContact extends StatefulWidget {
  @override
  _FormContactState createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  bool isPressed = false;
  String dropdownValue = 'Escolha';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        appBar: _customAppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 100,
                child: Center(
                  child: MaterialButton(
                    onPressed: () {
                      _profilePhoto(context);
                    },
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Icon(
                      Icons.add_a_photo,
                      size: 24,
                    ),
                    padding: EdgeInsets.all(15),
                    shape: CircleBorder(),
                  ),
                ),
              ),
              SliverVisibility(
                sliver: openedForm(),
                maintainState: false,
                replacementSliver: closedForm(),
                maintainSize: false,
                visible: isPressed,
              ),
              _textFieldIconBuilder('Empresa', Icons.business),
              _textFieldIconBuilder('Telefone', Icons.phone),
              dropD,
              _textFieldIconBuilder('E-mail', Icons.mail_outline),
              dropD,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 40,
                  ),
                  FlatButton(
                    textColor: Colors.white,
                    onPressed: () {},
                    child: Text(
                      "Mais campos",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    AlertDialog alerta = AlertDialog(
      content: Text(
        "Alterações não foram salvas.",
        style: TextStyle(color: Colors.black54),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      actions: [
        FlatButton(
          child: Text("Descartar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("Salvar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  AppBar _customAppBar() {
    return AppBar(
      actions: <Widget>[
        FlatButton(
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(
            "Salvar",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
        IconButton(icon: Icon(Icons.more_vert), onPressed: null),
      ],
      centerTitle: false,
      title: Text(
        'Criar contato',
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
      leading: InkWell(
          child: IconButton(
              icon: Icon(Icons.close, color: Colors.black54),
              onPressed: () {
                _onWillPop();
              })),
      backgroundColor: Colors.white,
    );
  }

  _profilePhoto(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alerta = AlertDialog(
      title: Text("Alterar foto"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("Tirar foto"),
          Text("\nEscolher foto"),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  Widget closedForm() {
    return Column(
      children: <Widget>[
        _textFieldIconOptionsBuilder('Nome', Icons.person_outline),
        _textFieldBuilder('Sobrenome'),
      ],
    );
  }

  Widget openedForm() {
    return Column(children: <Widget>[
      _textFieldIconOptionsBuilder('Prefixo do nome', Icons.person_outline),
      _textFieldBuilder('Nome'),
      _textFieldBuilder('Nome do meio'),
      _textFieldBuilder('Sobrenome'),
      _textFieldBuilder('Sufixo do nome'),
    ]);
  }

  Widget _textFieldBuilder(String label) {
    return Padding(
      padding: EdgeInsets.fromLTRB(55, 0, 25, 0),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(0, 5, 30, 5),
        title: TextField(
          obscureText: false,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(3.0),
                ),
              ),
              filled: false,
              labelText: label),
        ),
      ),
    );
  }

  Widget _textFieldIconBuilder(String label, IconData icon) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Icon(
            icon,
            color: Colors.black54,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                labelText: label,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3.0),
                  ),
                ),
                filled: false,
              ),
            ),
          ),
          SizedBox(
            width: 55,
          ),
        ],
      ),
    );
  }

  Widget _textFieldIconOptionsBuilder(String label, IconData icon) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Icon(
            icon,
            color: Colors.black54,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                labelText: label,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3.0),
                  ),
                ),
                filled: false,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          IconButton(
              icon: Icon(isPressed
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
              iconSize: 30,
              onPressed: () {
                setState(() {
                  isPressed = !isPressed;
                });
              }),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }

  RoundedBorderDropdown dropD = new RoundedBorderDropdown();
  Widget drop() {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 40,
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.grey,
            ),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.black54),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Escolha', 'Pessoal', 'Comercial', 'Residencial']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class RoundedBorderDropdown extends StatelessWidget {
  final List<String> _dropdownValues = [
    "Nenhum marcador",
    "Residencial",
    "Comercial",
    "Pessoal"
  ]; //The list of values we want on the dropdown

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                border: Border.all(
                    color: Colors.black45,
                    style: BorderStyle.solid,
                    width: 0.80),
              ),
              child: DropdownButton(
                underline: SizedBox(),
                items: _dropdownValues
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black45),
                          ),
                          value: value,
                        ))
                    .toList(),
                onChanged: (String value) {},
                isExpanded: false,
                value: _dropdownValues.first,
              ),
            ),
          ]),
    );
  }
}
