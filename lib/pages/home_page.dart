import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_http/models/especie_model.dart';
import 'package:dropdown_http/models/raza_model.dart';
import 'package:dropdown_http/services/especie_service.dart';
import 'package:dropdown_http/services/raza_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DropDown',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DropDownWidget1(),
              SizedBox(height: 10),
              DropDownWidget2(),
            ],
          ),
        ),
      ),
    );
  }
}

//Primer dropdown especies
class DropDownWidget1 extends StatelessWidget {
  const DropDownWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    final especieService = Provider.of<EspecieService>(context);

    List<Especie> especies =
        especieService.listaEspecies; // obtener la lista de razas del provider

    List<DropdownMenuItem> razasDropdown = especies.map((especie) {
      return DropdownMenuItem(
        value: especie.id,
        child: Text(
          especie.nombre,
          style: const TextStyle(color: Colors.black),
        ),
      );
    }).toList();

    return DropdownButtonFormField2(
      //decoration: _decorationDropDown(),
      isExpanded: true,
      hint: const Text(
        'Seleccione especie',
        style: TextStyle(color: Colors.grey, fontSize: 16.0),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
      style: const TextStyle(color: Colors.grey),
      iconSize: 30,
      buttonHeight: 65,
      buttonPadding: const EdgeInsets.only(right: 20, left: 20),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      dropdownWidth: 250,
      items: razasDropdown,
      validator: (value) {
        if (value == null) {
          return '      Por favor seleccione el tipo';
        }
      },
      onChanged: (value) {
        final razaService = Provider.of<RazaService>(context, listen: false);

        print(value);

        List<Raza> razasFiltradas = razaService.listaRazas
            .where((raza) => raza.especieId == value)
            .toSet()
            .toList();
        ;

        razaService.cambiarListaRazas = razasFiltradas;

        print(razasFiltradas);
      },
    );
  }
}

//Segundo dropdown razas
class DropDownWidget2 extends StatelessWidget {
  const DropDownWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    final razaService = Provider.of<RazaService>(context);

    List<Raza> razas = razaService
        .listaRazasFiltradas; // obtener la lista de razas filtradas del provider

    List<DropdownMenuItem> razasDropdown = razas.map((raza) {
      return DropdownMenuItem(
        value: raza.id,
        child: Text(
          raza.nombre,
          style: const TextStyle(color: Colors.black),
        ),
      );
    }).toList();

    return DropdownButtonFormField2(
      //decoration: _decorationDropDown(),
      isExpanded: true,
      hint: const Text(
        'Seleccione especie',
        style: TextStyle(color: Colors.grey, fontSize: 16.0),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
      style: const TextStyle(color: Colors.grey),
      iconSize: 30,
      buttonHeight: 65,
      buttonPadding: const EdgeInsets.only(right: 20, left: 20),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      dropdownWidth: 250,
      items: razasDropdown,
      validator: (value) {
        if (value == null) {
          return '      Por favor seleccione el tipo';
        }
      },
      onChanged: (value) {
        print(value);
      },
    );
  }
}
