import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = "ui_controls_screen";
  const UiControlsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

//Enumeracion
enum Transportation { car, plane, train, ship }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      //physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Habilita las opciones de desarrollador'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
          title: const Text('Vehiculos de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            _customRadioListTile(
                'By Car', 'Viajar por carro', Transportation.car),
            _customRadioListTile(
                'By Plane', 'Viajar por avión', Transportation.plane),
            _customRadioListTile(
                'By Train', 'Viajar por tren', Transportation.train),
            RadioListTile(
              title: const Text('By Ship'),
              subtitle: const Text('Viajar por Barco'),
              value: Transportation.ship,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.ship;
              }),
            ),
          ],
        ),
      
      CheckboxListTile(
        title: const Text('¿Quiere desayuno?'),
        subtitle: const Text('El desayuno es americano'),
        value: wantsBreakfast, onChanged: (value) => setState(() {
        wantsBreakfast = !wantsBreakfast;
      })),
      CheckboxListTile(
        title: const Text('¿Quiere almuerzo?'),
        subtitle: const Text('Se ofrecen 3 tipos de almuerzo'),
        value: wantsLunch, onChanged: (value) => setState(() {
        wantsLunch = !wantsLunch;
      })),
      CheckboxListTile(
        title: const Text('¿Quiere cena?'),
        subtitle: const Text('La cena es pan con mantequilla y té'),
        value: wantsDinner, onChanged: (value) => setState(() {
        wantsDinner = !wantsDinner;
      })),
      ],
    );
  }

  RadioListTile<Transportation> _customRadioListTile(final String title,
      final String subtitle, final Transportation transportation) {
    return RadioListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: transportation,
      groupValue: selectedTransportation,
      onChanged: (value) => setState(() {
        selectedTransportation = transportation;
      }),
    );
  }
}
