import 'package:flutter/material.dart';
//import 'main_11_segunda_tela.dart'; // Importe a Segunda_Tela_App

void main() {
  runApp(const Projeto01App());
}

class Projeto01App extends StatefulWidget {
  const Projeto01App({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<Projeto01App> {
  // Variáveis para armazenar o texto digitado e exibir o texto abaixo do botão
  String texto = 'Cadastrando Sensores';
  String localizacao = ''; // Armazena o texto do sensor
  String tipo = '';
  String macAddress = '';
  //double? indica que a variável pode ser nula
  double? latitude;
  double? longitude;
  String responsavel = '';
  String observacao = '';
  String unidadeMedida = '';
  bool statusOperacional = true;
  
  //Alterar a linha abaixo poi na versão anterior a localização do sensor era apenas _controller
  final TextEditingController _localizacaoController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _macAddressController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _responsavelController = TextEditingController();
  final TextEditingController _unidadeMedidaController =
      TextEditingController();
  final TextEditingController _observacaoController = TextEditingController();


  @override
  void dispose() {
    _localizacaoController.dispose();
    _tipoController.dispose();
    _macAddressController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _responsavelController.dispose();
    _observacaoController.dispose();
    _unidadeMedidaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Desativa a tarja DEBUG
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Smart City Roberto Mange'),
          backgroundColor: Colors.grey[300], // Cor de fundo cinza claro
        ),
        body: SingleChildScrollView(
          // Adicionado para permitir rolagem
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // O bloco abaixo será comentado pois não precisaremos mais exibir este texto.
              // Text(
              //   texto,
              //   style: TextStyle(fontSize: 24),
              // ),
              const SizedBox(height: 20), // Espaçamento entre o texto e o botão
// Campo Tipo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _tipoController,
                  decoration: const InputDecoration(
                    labelText: 'Tipo',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 20,
                  onChanged: (value) {
                    tipo = value;
                  },
                ),
              ),
              const SizedBox(height: 10), // Espaçamento entre os campos
              
              // Campo Mac Address
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _macAddressController,
                  decoration: const InputDecoration(
                    labelText: 'Mac Address',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 14,
                  onChanged: (value) {
                    macAddress = value;
                  },
                ),
              ),
              const SizedBox(height: 10), // Espaçamento entre os campos

              // Campo Latitude
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _latitudeController,
                  keyboardType: TextInputType.text, // Alterado para texto
                  decoration: const InputDecoration(
                    labelText: 'Latitude',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    //alterar para que o valor digitado seja convertido para double?
                    latitude = double.tryParse(value);
                  },
                ),
              ),
              const SizedBox(height: 10), // Espaçamento entre os campos

              // Campo Longitude
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _longitudeController,
                  keyboardType: TextInputType.text, // Alterado para texto
                  decoration: const InputDecoration(
                    labelText: 'Longitude',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    //alterar para que o valor digitado seja convertido para double?
                    longitude = double.tryParse(value);
                  },
                ),
              ),
              const SizedBox(height: 10), // Espaçamento entre os campos

              // Campo Local do Sensor
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _localizacaoController,
                  decoration: const InputDecoration(
                    labelText: 'Local do Sensor',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 20,
                  onChanged: (value) {
                    localizacao = value; // Atualiza a variável ao digitar
                  },
                ),
              ),
              const SizedBox(height: 10), // Espaçamento entre os campos 
              
              // Campo Responsável
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _responsavelController,
                  decoration: const InputDecoration(
                    labelText: 'Responsável',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 20,
                  onChanged: (value) {
                    responsavel = value;
                  },
                ),
              ),
              const SizedBox(height: 10), // Espaçamento entre os campos

              // Campo Observação
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _observacaoController,
                  decoration: const InputDecoration(
                    labelText: 'Observação',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 100,
                  onChanged: (value) {
                    observacao = value;
                  },
                ),
              ),
              const SizedBox(height: 20), // Espaçamento entre os campos

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    //alterar localSensor para localizacao
                    texto = localizacao.isNotEmpty
                        ? 'Local do Sensor: $localizacao\n'
                            'Tipo: $tipo\n'
                            'Mac Address: $macAddress\n'
                            'Latitude: $latitude\n'
                            'Longitude: $longitude\n'
                            'Responsável: $responsavel\n'
                            'Observação: $observacao'
                        : 'Por favor, insira um local do sensor!';
                  });

                  // Limpa os campos após clicar
                  //Alterar a _controller para _localizacaoController
                  _localizacaoController.clear();
                  _tipoController.clear();
                  _macAddressController.clear();
                  _latitudeController.clear();
                  _longitudeController.clear();
                  _responsavelController.clear();
                  _observacaoController.clear();

                  // Reseta as variáveis
                  localizacao = '';
                  tipo = '';
                  macAddress = '';
                  //alterar latitude elongitude para null
                  latitude = null;
                  longitude = null;
                  responsavel = '';
                  observacao = '';
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50), // Largura: 200, Altura: 50
                ),
                child: const Text('Cadastrar Sensor'),
              ),
              const SizedBox(
                  height: 20), // Espaçamento entre o botão e o texto do resumo

              // // Resumo do Cadastro
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Text(
              //     texto,
              //     textAlign: TextAlign.center,
              //     style: TextStyle(fontSize: 16),
              //   ),
              // ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey[300], // Cor de fundo cinza claro
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Aqui é o rodapé',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
