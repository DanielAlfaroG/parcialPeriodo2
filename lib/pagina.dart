import 'package:flutter/material.dart';
import 'package:parcialperiodo2/principal.dart';

class Pagina extends StatefulWidget {
  Pagina({Key ?key}) : super(key: key);

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Principal(),
    );
  }
}