import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';


class HomeScreen extends StatelessWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index){
        
        final item = appMenuItems[index];

        return _CustomListTile(item: item);
      },
    );
  }

}

class _CustomListTile extends StatelessWidget {
  
  final MenuItems item;

  const _CustomListTile({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {

    final colorTheme = Theme.of(context).colorScheme;

    return ListTile(
      onTap: (){
        // TODO: Navegar a otra pantalla
      },
      title: Text( item.title ),
      subtitle: Text( item.subtitle ),
      leading: Icon( item.icon, color: colorTheme.primary ),
      trailing: Icon( Icons.arrow_forward_ios_rounded, color: colorTheme.primary ),
      titleTextStyle: const TextStyle( 
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontSize: 16
      ),
    );
  }
}