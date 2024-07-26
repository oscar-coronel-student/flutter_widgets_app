import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {

  static const String routeName = 'ui_controls';
  
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Otros Tiles'),
      ),
      body: const _UiControlsView(),
    );
  }

}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper = true;

  Transportation selectedTransportation = Transportation.car;

  bool isBreakfast = false;
  bool isLunch = false;
  bool isDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value){
            isDeveloper = value;
            setState(() {});
          }
        ),

        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('Por Carro'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value){
                selectedTransportation = Transportation.car;
                setState(() {});
              }
            ),
            RadioListTile(
              title: const Text('Por Avión'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value){
                selectedTransportation = Transportation.plane;
                setState(() {});
              }
            ),
            RadioListTile(
              title: const Text('Por Bote'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value){
                selectedTransportation = Transportation.boat;
                setState(() {});
              }
            ),
            RadioListTile(
              title: const Text('Por Submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value){
                selectedTransportation = Transportation.submarine;
                setState(() {});
              }
            ),
          ],
        ),
        
        CheckboxListTile(
          title: const Text('¿Desea desayuno?'),
          value: isBreakfast,
          onChanged: (value) => setState(() {
            isBreakfast = !isBreakfast;
          })
        ),
        CheckboxListTile(
          title: const Text('¿Desea almuerzo?'),
          value: isLunch,
          onChanged: (value) => setState(() {
            isLunch = !isLunch;
          })
        ),
        CheckboxListTile(
          title: const Text('¿Desea cena?'),
          value: isDinner,
          onChanged: (value) => setState(() {
            isDinner = !isDinner;
          })
        ),
      ],
    );
  }
}