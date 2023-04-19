import 'package:flutter/material.dart';
import 'package:rastrear_encomenda/components/pacote_tile.dart';
import 'package:rastrear_encomenda/data/dummy_pacotes.dart';
import 'package:rastrear_encomenda/views/form_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const encomendas = {...DUMMY_PACOTES};
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Encomenda"),
        backgroundColor: Colors.amber,
      ),
      drawer: const NavigationDrawer(),
      body: ListView.builder(
          itemCount: encomendas.length,
          itemBuilder: (ctx, i) => PacoteTile(encomendas.values.elementAt(i))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastroForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: Text("Home"),
              onTap: () => Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => HomePage())),
            ),
            ListTile(
              leading: const Icon(Icons.access_alarms_sharp),
              title: Text("Pendentes"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.check_box_outlined),
              title: Text("Entregues"),
              onTap: () {},
            ),
            const Divider(
              color: Colors.black54,
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: Text("Sair"),
              onTap: () {},
            ),
          ],
        ),
      );
}
