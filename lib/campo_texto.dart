
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

TextEditingController _controllerAlcool = TextEditingController();
TextEditingController _controllerGasolina = TextEditingController();
String _result = "";

void _calcule_result (){

  var value_gasoline = double.tryParse(_controllerGasolina.text) ;
  var value_alcool = double.tryParse(_controllerAlcool.text);




  if (value_alcool == null || value_gasoline == null){
    setState(() {
      _result = "Por favor digite um número maior do que 0 e use (.)";
    });
  }else{

      //to calculate
      var final_result = (value_alcool / value_gasoline);

      if(final_result >= 0.7) {
        setState(() {
          _result = "Compensa mais comprar gasolina";
        });
      }else{
        setState(() {
          _result = "Compensa mais comprar alcool";
        });
      }

    _clear_all();
  }



}

void _clear_all(){
   _controllerAlcool.text = "";
   _controllerGasolina.text = "";
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Gasolina ou Álcool"),
      ),
      body: Center(

          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:  [
                  Image.asset("images/logo.png"),
                  const Padding(
                    padding: EdgeInsets.only(top:30, bottom:10),
                    child: Text(
                      "Saiba qual a melhor opção para abastecimento do seu carro",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only( bottom:10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Preço do Álcool ex: 1.59",
                        focusColor: Colors.indigo,
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      controller: _controllerAlcool,

                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only( bottom:15),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Preço da Gasolina ex: 6.59",
                        focusColor: Colors.indigo,
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      controller: _controllerGasolina,

                    ),
                  ),
                  ElevatedButton(
                    onPressed: _calcule_result,

                    child: const Text(
                      "Calcular",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.all(15)) ,
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:15),
                    child: Text(
                        _result,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  )
                ],
              ),
            ),
          ),

      ),
    );
  }
}
