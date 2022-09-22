import 'package:flutter/material.dart';
import 'package:parcialperiodo2/json/datos.dart';

class Principal extends StatefulWidget {
  Principal({Key ?key}) : super(key: key);

  @override
  _PrincipalState createState() {
    return _PrincipalState();
  }
}

class _PrincipalState extends State<Principal> {
  int menu = 0;
  int menu_combo = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromRGBO(144, 255, 132, 100),
      body: Cuerpo(),
    );
  }

  Widget Cuerpo() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Parte superior
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.fill
                  ),
                  borderRadius: BorderRadius.circular(100)
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Center(
              child: Text("Tortas el Zarco", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black
              )),
            ),
            const Center(
              child: const Text("Calidad y sabor siempre dando lo mejor", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black
              ),),
            ),

            //TextField
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
              ),
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: "Busca tu combo",
                  ),
                ),
              ),
            ),

            //Menu de ventas
            const SizedBox(height: 25,),
            const Text("Tipos de comida", textAlign: TextAlign.left, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),),
            const SizedBox(height: 25,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 10),
                child: Row(
                  children: List.generate(comidas.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            menu = index;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: menu==index?Colors.red:Color.fromRGBO(125, 125, 125, 100),
                                  width: 2.0
                                )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Icon(
                                      iconos[index],
                                      size: 25,
                                      color: menu==index?Colors.red:Color.fromRGBO(125, 125, 125, 100),
                                    ),
                                  ),
                                  Text(
                                    comidas[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: menu==index?Colors.red:Color.fromRGBO(125, 125, 125, 100),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            //Menu de combos
            const SizedBox(height: 25,),
            const Text("Menu de combos", textAlign: TextAlign.left, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),),
            const SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: List.generate(combos.length, (index) {
                    return Padding(padding: EdgeInsets.only(right: 30),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            menu_combo = index;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 160,
                              height: 240,
                              decoration: BoxDecoration(
                                color: menu_combo==index?Colors.red:Colors.white,
                                borderRadius: BorderRadius.circular(35)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(combos[index]['img']),
                                          fit: BoxFit.fill
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(combos[index]['title'],
                                    style: TextStyle(
                                      color: menu_combo==index?Colors.white:Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(combos[index]["price"],
                                    style: TextStyle(
                                      color: menu_combo==index?Colors.yellow:Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}