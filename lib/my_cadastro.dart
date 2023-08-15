import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCadastro extends StatefulWidget {
  const MyCadastro({super.key});

  @override
  State<MyCadastro> createState() => _MyCadastroState();
}

class _MyCadastroState extends State<MyCadastro> {
  
  int ra = 0;
  String nome = "";
  TextEditingController campoRa = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Column(children: [
        Form(
          key: formKey,
          child: Column(children: [
          TextFormField(
            controller: campoRa,
            //para deixar digitar somente numeros
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            validator: (value){
              if (value!.isEmpty){
                return("O RA não pode ser vazio!)");
              }
              else{
                if (int.parse(campoRa.text)<10){
                  return ("O RA deve ser maior que 10!");
                }
              }
              return null;
            },
          ),
          TextFormField(
            controller: campoNome,
            validator: (value) {
              if (value!.isEmpty){
                return ("O nome não pode ser vazio!");
              }
              else {
                if (campoNome.text.length<5){
                  return ("O Nome deve ser maior que 5 caracteres!");
                }
              }
              return null;
            },
          )

        ]
        ),
        ),
        ElevatedButton(
          onPressed: (){
            if(formKey.currentState!.validate()){
              ra = int.parse(campoRa.text);
              nome = campoNome.text;
              return mostraMsgSucesso();
              setState(() {
                
              });
            }
          }, child:Text("Cadastrar")),
          Text("Valores digitados: $ra, $nome"),

      ],)) ,
    );
    
  }
  //metodo
  void mostraMsgSucesso ()
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Aluno cadastrardo com sucesso!')));
  }
}