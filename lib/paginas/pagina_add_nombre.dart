import 'package:fire_app/firebase_metodos.dart';
import 'package:flutter/material.dart';

class AddNombre extends StatefulWidget {
  const AddNombre({super.key});

  @override
  State<AddNombre> createState() => _AddNombreState();
}

class _AddNombreState extends State<AddNombre> {
  TextEditingController nombreControlador = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Nombre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: nombreControlador,
              decoration: const InputDecoration(
                hintText: 'Ingresa un nombre',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await leerNombre(nombreControlador.text).then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text("Guardar"),
            )
          ],
        ),
      ),
    );
  }
}
