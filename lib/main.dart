import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(title: 'SodaMachine', home: SodaMachine(),),);

class SodaMachine extends StatefulWidget {
  @override
  _SodaMachineState createState() => _SodaMachineState();
}

class _SodaMachineState extends State<SodaMachine> {

  final controller = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  final focus2 = FocusNode();
  final focus3 = FocusNode();

  String infoText = "Insira até três moedas";

  void Calculate(){
    setState(() {
      double _calc = double.parse(controller.text);
      double _calc2 = double.parse(controller2.text);
      double _calc3 = double.parse(controller3.text);
      double _resul;

      _resul = _calc + _calc2 + _calc3;

      if(_calc != 0.10 && _calc != 0.25) infoText = "Coloque apenas moedas dos valores de 0.10 e 0.25";
      else if(_calc2 != 0.10 && _calc2 != 0.25) infoText = "Coloque apenas moedas dos valores de 0.10 e 0.25";
      else if(_calc3 != 0.10 && _calc3 != 0.25) infoText = "Coloque apenas moedas dos valores de 0.10 e 0.25";
      else if(_resul != 0.45) infoText="O valor inserido é maior ou menor do que o necessario para a Coca - Cola";
      else if (_resul == 0.45) infoText = "Vc conseguiu comprar a Coca-Cola";

    });
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    controller3.dispose();
    focus2.dispose();
    focus3.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Maquina De Refrigerente"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){
              controller.clear();
              controller2.clear();
              controller3.clear();
              setState(() {
                infoText = "Vc conseguiu comprar a Coca-Cola";
              });
            },
          ),
        ),
        body:SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 80.0, 10.0, 30.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text( infoText,
                  style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
            ),
          ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     TextFormField(
                          controller:controller,
                          onFieldSubmitted: (_){
                            FocusScope.of(context).requestFocus(focus2);
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            labelText: "Insira o valor em centavos ex: 0.10",
                          ),
                        ),
                            const SizedBox(height: 20.0),
                              TextFormField(
                                controller:controller2,
                                focusNode: focus2,
                                onFieldSubmitted: (_){
                                  FocusScope.of(context).requestFocus(focus3);
                                },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            labelText: "Insira o valor em centavos ex: 0.10",
                          ),
                        ),
                           const SizedBox(height: 20.0),
                             TextFormField(
                          controller: controller3,
                          focusNode: focus3,
                          onFieldSubmitted: (_){
                            FocusScope.of(context).unfocus();
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            labelText: "Insira o valor em centavos ex: 0.10",
                          ),
                        ),
                            const SizedBox(height: 30.0),
                            FlatButton(
                              onPressed:(){
                                Calculate();
                              },
                          child: Container(
                            color: Colors.blue,
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 60.0),
                            child: Text("Finalizar Compra",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}