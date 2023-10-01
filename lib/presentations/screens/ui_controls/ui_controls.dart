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
        _customRadioListTile('By Car', 'Viajar por carro', Transportation.car),
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
