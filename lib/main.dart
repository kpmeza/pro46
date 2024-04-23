import 'package:flutter/material.dart';
import 'package:pro46/api/consualbum.dart';
import 'package:pro46/api/consulta.dart';

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
        child: ListView(
          children: [
            DrawerHeader(
                child: UserAccountsDrawerHeader(
                    accountName: Text('VitalSave'),
                    accountEmail: Text('Asistencia inmediata'))),
            ListTile(
              title: Text('Inicio'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Medicamentos'),
              leading: Icon(Icons.medical_information_rounded),
              onTap: () {
                Buscapost().then((r) {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: Text("API Post"),
                          ),
                          body: ListView.builder(
                            itemCount: r.length,
                            itemBuilder: (BuildContext context, int i) {
                              return ListTile(
                                title: Text(r[i].title),
                                leading: Text(r[i].id.toString()),
                              );
                            },
                          ),
                        );
                      });
                });
              },
            ),
            Divider(),
            ListTile(
              title: Text('Salud'),
              leading: Icon(Icons.home),
              onTap: () {
                Buscalbum().then((t) {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: Text("API Albums"),
                          ),
                          body: ListView.builder(
                            itemCount: t.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(t[index].title),
                                trailing: Text(t[index].id.toString()),
                              );
                            },
                          ),
                        );
                      });
                });
              },
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
