import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String? textoRetorno;
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: list.length,
        separatorBuilder: (context, index) => const Divider(thickness: 2),
        itemBuilder: (context, index) {
          final item = list[index];
          return Dismissible(
            key: Key(item),
            background: Container(
              color: Colors.red,
              child: const Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.delete,
                ),
              ),
            ),
            onDismissed: (direction) {
              if (list.isNotEmpty) {
                list.removeAt(index);
              }
              setState(() {
                index;
                if (list.isNotEmpty) {
                  list[index];
                }
              });
            },
            child: Container(
              alignment: Alignment.centerLeft,
              height: 50,
              child: Text(
                '${index + 1} - ${list[index]}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _routeProximaTela(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _routeProximaTela(BuildContext context) async {
    var retorno = await Navigator.of(context).pushNamed(
      '/segunda',
    );

    if (retorno.toString() != '' && retorno.toString() != 'null') {
      setState(() {
        list.add(retorno.toString());
      });
    }
  }
}
