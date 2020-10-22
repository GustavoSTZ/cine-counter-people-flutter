import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode Entrar!";
  Image _image = Image.asset(
    "images/cine.jpg",
    fit: BoxFit.cover,
  );
  Image _imageInverted = Image.asset(
    "images/cine_inverted.jpg",
    fit: BoxFit.cover,
  );
  bool _mundoInvertido = false;

  void _changePeople(int delta){
    setState(() {
      _people += delta;

      if(_people < 0){
        _infoText = "Mundo Invertido?";
        _mundoInvertido = true;
      } else if(_people < 10){
        _infoText = "Pode Entrar!";
        _mundoInvertido = false;
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: _mundoInvertido ? Alignment.bottomCenter : Alignment.topCenter,
      children: [
        _mundoInvertido ? Transform(alignment: Alignment.center, transform: Matrix4.rotationX(180), child: _imageInverted) : _image,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pessoas: $_people",
                style:
                _mundoInvertido
                    ? TextStyle(color: Colors.indigoAccent, fontWeight: FontWeight.bold)
                : TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      onPressed: () {
                        _changePeople(1);
                        },
                      child: Text(
                        "+1",
                        style: _mundoInvertido
                            ? TextStyle(fontSize: 40.0, color: Colors.red)
                        : TextStyle(fontSize: 40.0, color: Colors.white),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      onPressed: () {
                        _changePeople(-1);
                      },
                      child: Text(
                        "-1",
                        style: _mundoInvertido
                            ?  TextStyle(fontSize: 40.0, color: Colors.blueAccent)
                        :  TextStyle(fontSize: 40.0, color: Colors.white),
                      )),
                )
              ],
            ),
            Text(
              _infoText,
              style: _mundoInvertido
                  ? TextStyle(color: Colors.indigoAccent, fontStyle: FontStyle.italic, fontSize: 30.0)
              : TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}

