import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(inicio());
}

class inicio extends StatelessWidget {
  const inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: principal(),
    );
  }
}

class principal extends StatefulWidget {
  const principal({super.key});

  @override
  State<principal> createState() => _principalState();
}

class _principalState extends State<principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi app'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: UserAccountsDrawerHeader(
                    accountName: Text('VitalSave'),
                    accountEmail: Text('Asistencia inmediata'))),
            ListTile(
              title: Text('Inicio'),
              leading: Icon(Icons.home),
            ),
            Divider(),
            ListTile(
              title: Text('Medicamentos'),
              leading: Icon(Icons.medical_information_rounded),
            ),
            Divider(),
            ListTile(
              title: Text('Salud'),
              leading: Icon(Icons.home),
            ),
            Divider(),
            ListTile(
              title: Text('Recordatorio'),
              leading: Icon(Icons.home),
            ),
            Divider(),
            ListTile(
              title: Text('Asistente'),
              leading: Icon(Icons.home),
            ),
            Divider(),
            ListTile(
              title: Text('Emergencia'),
              leading: Icon(Icons.home),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 150,
            backgroundImage: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
          ),
          Text('MI app'),
        ],
      ),
    );
  }
}
