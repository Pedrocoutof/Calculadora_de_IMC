import 'package:flutter/material.dart';
import 'package:imc/QuestionPage.dart';
import 'AppColors.dart';

bool darkMode = false;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controllerAltura = TextEditingController();
  TextEditingController _controllerPeso = TextEditingController();

  double calculateIMC() {
    if (_controllerAltura.text.isEmpty || _controllerPeso.text.isEmpty) {
      return 0;
    }

    if (_controllerAltura.text.contains(",") ||
        _controllerPeso.text.contains(",")) {
      print(_controllerAltura.text);
      _controllerAltura.text = _controllerAltura.text.replaceAll(",", ".");
      _controllerPeso.text = _controllerPeso.text.replaceAll(",", ".");
      print(_controllerAltura.text);
    }

    return (double.parse(_controllerPeso.text) /
        (double.parse(_controllerAltura.text) *
            double.parse(_controllerAltura.text)));
  }

  Color changeBackgroundColor() {
    double imc = calculateIMC();
    if (darkMode) {
      if (imc < 18.5) {
        return AppColors.dark_pesoBaixo;
      } else if (imc < 24.9) {
        return AppColors.dark_pesoNormal;
      } else if (imc < 29.9) {
        return AppColors.dark_obesidade1;
      }
      return AppColors.dark_obesidade2;
    }

      if (imc < 18.5) {
        return AppColors.light_pesoBaixo;
      } else if (imc < 24.9) {
        return AppColors.light_pesoNormal;
      } else if (imc < 29.9) {
        return AppColors.light_obesidade1;
      }
      return AppColors.light_obesidade2;
  }

  Color changeTextColor(){
    if(darkMode){
      return Colors.white;
    }
    else{
      return Colors.black;
    }
  }

  String description() {
    double imc = calculateIMC();
    if (imc == 0) {
      return "";
    } else if (imc < 18.5) {
      return "Peso baixo";
    } else if (imc < 24.9) {
      return "Peso normal";
    } else if (imc < 29.9) {
      return "Obesidade";
    }
    return "Obesidade alta";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: changeTextColor(),
        backgroundColor: changeBackgroundColor(),
        title: Text(
          "Calculadora de IMC",
          style: TextStyle(color: changeTextColor()),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionPage(backgroundColor: changeBackgroundColor(), textColor: changeTextColor())));
            },
            icon: Icon(
              Icons.question_mark_rounded,
              color: changeTextColor(),
            )),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  darkMode = !darkMode;
                });
              },
              icon: darkMode
                  ? Icon(
                      Icons.light_mode,
                      color: changeTextColor(),
                    )
                  : Icon(
                      Icons.dark_mode,
                      color: changeTextColor(),
                    )),
        ],
      ),
      backgroundColor: changeBackgroundColor(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(
                width: 75,
              ),
              Expanded(
                child: TextField(
                  style: TextStyle(color: changeTextColor()),
                  decoration: InputDecoration(labelText: "Altura", labelStyle: TextStyle(color: changeTextColor())),
                  keyboardType: TextInputType.number,
                  controller: _controllerAltura,
                ),
              ),
              Container(
                width: 150,
              ),
              Expanded(
                child: TextField(
                  
                  style: TextStyle(color: changeTextColor()),
                  decoration: InputDecoration(labelText: "Peso", labelStyle: TextStyle(color: changeTextColor())),
                  keyboardType: TextInputType.number,
                  controller: _controllerPeso,
                ),
              ),
              Container(
                width: 75,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                calculateIMC().toStringAsFixed(2),
                style: TextStyle(fontSize: 75, color: changeTextColor()),
              ),
              Text(
                description(),
                style: TextStyle(
                    fontSize: 32, color: changeTextColor().withOpacity(0.75)),
              ),
            ],
          ),
          FlatButton(
              onPressed: () {
                setState(() {});
              },
              onLongPress: () {
                setState(() {
                  _controllerAltura = TextEditingController();
                  _controllerPeso = TextEditingController();
                });
              },
              height: 10,
              child: Container(
                width: 300,
                height: 175,
                decoration: BoxDecoration(
                    border: Border.all(color: changeTextColor()),
                    color: changeTextColor().withOpacity(0.05),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100))),
                child: Center(
                  child: Text(
                    "Calcular IMC",
                    style: TextStyle(fontSize: 28, color: changeTextColor()),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
