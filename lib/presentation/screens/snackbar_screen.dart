import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const String routeName = 'snackbar';
  
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: (){
        }
      ),
      duration: const Duration( seconds: 2 ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      snackbar
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: const _SnackbarView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showCustomSnackbar(context);
        },
        icon: const Icon( Icons.remove_red_eye_outlined ),
        label: const Text('Mostrar Snackbar')
      ),
    );
  }

}

class _SnackbarView extends StatelessWidget {

  const _SnackbarView();

  void openDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('¿Estás seguro?', textAlign: TextAlign.center),
          content: const Text('Elit anim consectetur velit dolor dolore proident irure cillum cupidatat commodo. Do eiusmod nisi elit dolor reprehenderit sint exercitation officia dolore magna est. Anim sunt qui deserunt ad proident reprehenderit velit irure Lorem ullamco ad deserunt cillum. Voluptate cupidatat in qui pariatur labore eu qui sint amet quis. Occaecat veniam cupidatat aliqua veniam amet nisi amet nostrud ea mollit non. Ut commodo id voluptate culpa aliquip nulla est in sit.', textAlign: TextAlign.justify),
          actions: [
            TextButton(
              onPressed: (){
                context.pop();
              },
              child: const Text('Cancelar')
            ),
            FilledButton(
              onPressed: (){
                context.pop();
              },
              child: const Text('Aceptar')
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: (){
              showAboutDialog(
                context: context,
                children: [
                  const Text('Nisi laboris esse officia magna. Qui cillum id quis nulla. Anim aliqua eiusmod ex tempor nisi labore mollit cupidatat nostrud do ad adipisicing anim cillum. Ut veniam occaecat labore incididunt irure quis nostrud qui adipisicing aliqua.', textAlign: TextAlign.justify)
                ]
              );
            },
            child: const Text('Licencias usadas')
          ),
          FilledButton.tonal(
            onPressed: (){
              openDialog(context);
            },
            child: const Text('Mostrar diálogo')
          ),
        ],
      ),
    );
  }

}