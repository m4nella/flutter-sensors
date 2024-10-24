import 'package:flutter/material.dart';

main() {
  runApp(const Projeto01App());
}

class Projeto01App extends StatefulWidget {
  const Projeto01App({super.key});
  @override
  Projeto01AppState createState() => Projeto01AppState();
}

class Projeto01AppState extends State<Projeto01App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Desativa a tarja DEBUG
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App da Turma A',
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 132, 132, 136),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Construindo App da Turma',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {}, //Adicionaremos uma função do botão aqui
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('Clique Aqui'),
              )
            ],
          ),
        ),
        //Acrescentando o rodapé
        bottomNavigationBar: const BottomAppBar(
          color:
              Color.fromARGB(255, 53, 52, 52), // Cor de fundo cinza claro
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Aqui é o rodapé', textAlign: TextAlign.center)),
        ),
      ),
    );
  }
}
