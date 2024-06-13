import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedMachine;
  String? _selectedCoffeeOrigin;
  String? _selectedCoffeeType;
  String? _selectedProcess;
  String _coffeeDescription = '';
  double _coffeeWeight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee App'),
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Seleccione la maquina a usar en el proceso'),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  int machineNumber = index + 1;
                  return ElevatedButton(
                    onPressed: () => setState(() => _selectedMachine = 'Machine $machineNumber'),
                    child: Text('$machineNumber'),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: _selectedMachine == 'Machine $machineNumber' ? Colors.lightBlue : null,
                    ),
                  );
                }),
              ),
              SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Procedencia del cafe'),
                  DropdownButtonFormField<String>(
                    value: _selectedCoffeeOrigin,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCoffeeOrigin = newValue;
                      });
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Colombia',
                        child: Text('Colombia'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Brazil',
                        child: Text('Brazil'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tipo de cafe'),
                  DropdownButtonFormField<String>(
                    value: _selectedCoffeeType,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCoffeeType = newValue;
                      });
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Arabica',
                        child: Text('Arabica'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Robusta',
                        child: Text('Robusta'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Seleccione proceso a realizar'),
                  DropdownButtonFormField<String>(
                    value: _selectedProcess,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                      hintText: 'Seleccione',
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedProcess = newValue;
                      });
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Lavado',
                        child: Text('Lavado'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Natural',
                        child: Text('Natural'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text('Descripción'),
              SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Descripcion: no necesario',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0), // Espacio más grande para la descripción
                ),
                onChanged: (String value) {
                  setState(() {
                    _coffeeDescription = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Peso del cafe en la maquina (Kg)',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        setState(() {
                          _coffeeWeight = double.tryParse(value) ?? 0;
                        });
                      },
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
}
