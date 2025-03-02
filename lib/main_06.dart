import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart'; // classes que compoem os componentes da tela


main(){
  runApp(const Projeto01App());
}

class Projeto01App extends StatefulWidget{
  const Projeto01App ({super.key});
  @override
  Projeto01AppState createState() => Projeto01AppState();
}

class Projeto01AppState extends State<Projeto01App>{ // extendes pq e a classe pai

  //constrtuor da claase , sempre vai estanciar aqui ou seja , sempre vai execuatr esse metodo primeiro
  //seta como esses parametros em que se comportar e mapear os vaores

//criando outro metodo , para construir a home
//para criar a classe e carregar os componentes cria o widget
String texto = "Cnstruindo App da Turma";
  @override
  Widget build(BuildContext context)  {
    return  MaterialApp(
      debugShowCheckedModeBanner: false, //Desativa a tarja de DEBUG
      home: Scaffold(
        appBar:AppBar(
        title: const Text("App da Turma A", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255,64,60,134),
      ) ,
      body: Center (
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text(
            texto,
          style: const TextStyle(fontSize: 24)
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                texto = 'Voce clicou no Botão!!'; //Atualiza o texto ao clicar no botao
              });
            },//Adicionaremos uma funcao de botao aqui
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200,50),
            ),
            child: const Text('Clique aqui'),
             )
        ],
      )
      ),

    //acrescentar o rodape
    bottomNavigationBar: const BottomAppBar(
      color: Color.fromARGB(255,64,60,134),//Cor de fundo cinza claro
      child:  Padding(
      padding: EdgeInsets.all(16.0),
      child:Text(
        'Aqui é o Rodapé',
        textAlign: TextAlign.center,
        

      ),

      ),
    ),
    ),
    );
}
}
