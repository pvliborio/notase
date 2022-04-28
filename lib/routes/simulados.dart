import 'package:flutter/material.dart';
import 'package:notase/res/custom_colors.dart';
import 'package:notase/widgets/appbar.dart';

class SimuladosRoute extends StatefulWidget {
  const SimuladosRoute({Key? key}) : super(key: key);

  @override
  _SimuladosRouteState createState() => _SimuladosRouteState();
}

class _SimuladosRouteState extends State<SimuladosRoute> {
  static final List<Widget> _pages = <Widget>[
    Column(children: [
      const Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Text(
          "Suas Notas",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 30,
              color: CustomColors.navy,
              fontWeight: FontWeight.w900),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
          "TRI",
          style: TextStyle(
              fontSize: 25,
              color: CustomColors.navy,
              fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        children: const [
          Text(
            "Linguagens e suas Tecnologias",
            style: TextStyle(color: CustomColors.navy),
          ),
          Spacer(),
          Text(
            "552,8",
            style: TextStyle(color: CustomColors.navy),
          ),
        ],
      ),
      const Divider(color: CustomColors.navy),
      Row(
        children: const [
          Text(
            "Ciências Humanas e suas Tecnologias",
            style: TextStyle(color: CustomColors.navy),
          ),
          Spacer(),
          Text(
            "552,8",
            style: TextStyle(color: CustomColors.navy),
          ),
        ],
      ),
      const Divider(color: CustomColors.navy),
      Row(
        children: const [
          Text(
            "Ciências da Natureza e suas Tecnologias",
            style: TextStyle(color: CustomColors.navy),
          ),
          Spacer(),
          Text(
            "552,8",
            style: TextStyle(color: CustomColors.navy),
          ),
        ],
      ),
      const Divider(color: CustomColors.navy),
      Row(
        children: const [
          Text(
            "Matemática e suas Tecnologias",
            style: TextStyle(color: CustomColors.navy),
          ),
          Spacer(),
          Text(
            "552,8",
            style: TextStyle(color: CustomColors.navy),
          ),
        ],
      ),
      const Padding(
        padding: EdgeInsets.only(top: 20, bottom: 10),
        child: Text(
          "Acertos por Disciplina",
          style: TextStyle(
              fontSize: 25,
              color: CustomColors.navy,
              fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        children: const [
          Text(
            "Linguagens e suas Tecnologias",
            style: TextStyle(color: CustomColors.navy),
          ),
          Spacer(),
          Text(
            "40",
            style: TextStyle(color: CustomColors.navy),
          ),
        ],
      ),
      const Divider(color: CustomColors.navy),
      Row(
        children: const [
          Text(
            "Ciências Humanas e suas Tecnologias",
            style: TextStyle(color: CustomColors.navy),
          ),
          Spacer(),
          Text(
            "40",
            style: TextStyle(color: CustomColors.navy),
          ),
        ],
      ),
      const Divider(color: CustomColors.navy),
      Row(
        children: const [
          Text(
            "Ciências da Natureza e suas Tecnologias",
            style: TextStyle(color: CustomColors.navy),
          ),
          Spacer(),
          Text(
            "40",
            style: TextStyle(color: CustomColors.navy),
          ),
        ],
      ),
      const Divider(color: CustomColors.navy),
      Row(
        children: const [
          Text(
            "Matemática e suas Tecnologias",
            style: TextStyle(color: CustomColors.navy),
          ),
          Spacer(),
          Text(
            "40",
            style: TextStyle(color: CustomColors.navy),
          ),
        ],
      ),
    ]),
    Column(children: const [
      Text(
        "Redação",
        style: TextStyle(
            fontSize: 30,
            color: CustomColors.navy,
            fontWeight: FontWeight.w900),
      ),
      SizedBox(height: 8),
    ]),
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey,
      appBar: CustomAppBar("Simulado 1"),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          backgroundColor: CustomColors.orange,
          selectedItemColor: CustomColors.grey.withOpacity(0.6),
          unselectedItemColor: CustomColors.grey,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_rounded), label: "Notas"),
            BottomNavigationBarItem(
                icon: Icon(Icons.mode_edit_outline_outlined), label: "Redação"),
            BottomNavigationBarItem(
                icon: Icon(Icons.speed_rounded), label: "Simulador SiSU"),
            BottomNavigationBarItem(icon: Icon(Icons.groups), label: "Ranking"),
          ]),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: _pages.elementAt(_selectedIndex)),
      ),
    );
  }
}
