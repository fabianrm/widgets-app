import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = "snackbar_screen";

  const SnackbarScreen({Key? key}) : super(key: key);

//Metodo para mostrar un snackbar
  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackback = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(
        label: '🆗',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackback);
  }

//Método diálogo personalizado
  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
            'Exercitation qui irure Lorem cupidatat eu qui consequat. Ipsum ipsum Lorem nulla irure est culpa laborum laborum. Qui ullamco exercitation occaecat et sunt id duis fugiat tempor et cillum.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                        'In excepteur nisi minim ipsum irure amet ut ad non et pariatur exercitation. Do quis enim nulla culpa ut laboris tempor qui velit nisi. Ullamco sint officia in in laborum consequat incididunt excepteur sint proident laborum est. Exercitation exercitation ex amet est sit pariatur nulla quis et tempor officia deserunt velit. Id dolor velit dolore pariatur mollit pariatur eiusmod veniam aliqua labore.')
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () {
          showCustomSnackbar(context);
        },
      ),
    );
  }
}
