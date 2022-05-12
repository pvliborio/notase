import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:notase/models/Aluno.dart';
import 'package:notase/widgets/notas.dart';
import 'package:flutter/material.dart';
import 'package:notase/models/AlunoNota.dart';
import 'package:notase/res/custom_colors.dart';
import 'package:notase/widgets/appbar.dart';

import 'package:http/http.dart' as http;
import 'package:notase/widgets/ranking.dart';
import 'package:notase/widgets/redacao.dart';
import 'package:notase/widgets/simulador.dart';

class SimuladosRoute extends StatefulWidget {
  final String id;
  final String title;

  SimuladosRoute({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  _SimuladosRouteState createState() => _SimuladosRouteState();
}

class SimuladosArguments {
  final String id;
  final String title;

  SimuladosArguments(this.id, this.title);
}

Future<Aluno> fetchSimulados(String id) async {
  User? user = FirebaseAuth.instance.currentUser;
  String token = "";
  if (user != null) {
    token = await user.getIdToken();
  }

  final response = await http.get(
      Uri.parse("http://10.0.2.2:8080/me/simulados/${id}"),
      headers: {'AuthToken': token});

  if (response.statusCode == 200) {
    //print(jsonDecode(response.body)['notas']);
    try {
      return Aluno.fromJson(jsonDecode(response.body));
    } catch(error) {
      throw Exception(error);
    }
  } else {
    throw Exception('Erro ao buscar simulados');
  }
}

class _SimuladosRouteState extends State<SimuladosRoute> {

  int _selectedIndex = 0;

  late Future<Aluno> aluno;

  @override
  void initState() {
    super.initState();
    aluno = fetchSimulados(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey,
      appBar: CustomAppBar(widget.title),
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
            child: FutureBuilder<Aluno>(
              future: aluno,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch(_selectedIndex) {
                    case 0:
                      return NotasWidget(notas: snapshot.data!.notas);
                    case 1:
                      return RedacaoWidget(notas: snapshot.data!.notas);
                    case 2:
                      return const SimuladorWidget();
                    case 3:
                      return RankingWidget(ranking: snapshot.data!.ranking);
                  }
                  throw UnimplementedError();
                } else if (snapshot.hasError) {
                  return Text('Erro: ${snapshot.error}');
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: CustomColors.orange,
                    ),
                  );
                }
            })
          ),
      ),
    );
  }
}
