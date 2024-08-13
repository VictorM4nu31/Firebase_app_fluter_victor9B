import 'package:flutter/material.dart';
import 'package:fire_app/firebase_metodos.dart';

class EditNombre extends StatefulWidget {
  final String nombre;
  final String id;

  const EditNombre({super.key, required this.nombre, required this.id});

  @override
  State<EditNombre> createState() => _EditNombreState();
}

class _EditNombreState extends State<EditNombre> {
  late TextEditingController nombreControlador;

  @override
  void initState() {
    super.initState();
    nombreControlador = TextEditingController(text: widget.nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Nombre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: nombreControlador,
              decoration: const InputDecoration(
                hintText: 'Edita el nombre',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await actualizarNombre(widget.id, nombreControlador.text);
                Navigator.pop(context);
              },
              child: const Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}
