import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'sensor_model.dart';
import 'main_15.dart'; // Importe a primeira tela

class Segunda_Tela_App extends StatefulWidget {
  const Segunda_Tela_App({Key? key}) : super(key: key);

  @override
  _Segunda_Tela_AppState createState() => _Segunda_Tela_AppState();
}

class _Segunda_Tela_AppState extends State<Segunda_Tela_App> {
  late Future<List<Sensor>> _sensorList;

  @override
  void initState() {
    super.initState();
    _sensorList = _fetchSensors();
  }

  Future<List<Sensor>> _fetchSensors() async {
    return await DatabaseHelper().getAllSensors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Tela'),
        backgroundColor: const Color.fromARGB(255, 240, 214, 185), // Cor de fundo cinza claro
      ),
      body: FutureBuilder<List<Sensor>>(
        future: _sensorList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar os dados.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum sensor encontrado.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Sensor sensor = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 247, 224, 182), // Fundo cinza
                      borderRadius: BorderRadius.circular(12), // Bordas arredondadas
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID: ${sensor.id}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text('Tipo: ${sensor.tipo ?? 'N/A'}'),
                          Text('MAC Address: ${sensor.mac_address ?? 'N/A'}'),
                          Text('Localização: ${sensor.localizacao}'),
                          Text('Latitude: ${sensor.latitude != null ? sensor.latitude!.toString() : 'N/A'}'),
                          Text('Longitude: ${sensor.longitude != null ? sensor.longitude!.toString() : 'N/A'}'),
                          Text('Responsável: ${sensor.responsavel ?? 'N/A'}'),
                          Text('Status Operacional: ${sensor.status_operacional ?? 'N/A'}'),
                          Text('Observação: ${sensor.observacao ?? 'N/A'}'),
                          ElevatedButton(
                            onPressed: () {
                              // Navegar para a tela de cadastro com os dados do sensor
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyAppScreen(
                                    sensor: {
                                      'id': sensor.id,
                                      'tipo': sensor.tipo,
                                      'mac_address': sensor.mac_address,
                                      'localizacao': sensor.localizacao,
                                      'latitude': sensor.latitude,
                                      'longitude': sensor.longitude,
                                      'responsavel': sensor.responsavel,
                                      'unidade_medida': sensor.unidade_medida,
                                      'status_operacional': sensor.status_operacional,
                                      'observacao': sensor.observacao,
                                    },
                                  ),
                                ),
                              );
                            },
                            child: Text('Editar dados do Sensor'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 228, 206, 174), // Cor de fundo cinza claro
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'GitHub: m4nella',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
