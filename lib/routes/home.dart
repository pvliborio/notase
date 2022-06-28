import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notase/models/Simulados.dart';
import 'package:notase/res/custom_colors.dart';
import 'package:notase/routes/simulados.dart';
import 'package:notase/widgets/appbar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

List<Simulado> parseSimulados(String json) {
  final parsed = jsonDecode(json)['simulados'].cast<Map<String, dynamic>>();

  return parsed
      .map<Simulado>((simulado) => Simulado.fromJson(simulado))
      .toList();
}

Future<List<Simulado>> fetchSimulados() async {
  User? user = FirebaseAuth.instance.currentUser;
  String token = "";
  if (user != null) {
    token = await user.getIdToken();
  }

  final response = await http
      .get(Uri.parse("http://10.0.2.2:8080/me"), headers: {'AuthToken': token});

  if (response.statusCode == 200) {
    return compute(parseSimulados, response.body);
  } else {
    throw Exception('Erro ao buscar simulados');
  }
}

class _HomeRouteState extends State<HomeRoute> {
  late Future<List<Simulado>> simulados;

  @override
  void initState() {
    super.initState();
    simulados = fetchSimulados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey,
      appBar: CustomAppBar(AppLocalizations.of(context)!.seusSimulados),
      body: SafeArea(
        child: FutureBuilder<List<Simulado>>(
          future: simulados,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _SimuladosList(simulados: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: CustomColors.orange,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class _SimuladosList extends StatelessWidget {
  const _SimuladosList({Key? key, required this.simulados}) : super(key: key);

  final List<Simulado> simulados;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: simulados.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
              color: const Color(0xFFFFFFFF),
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        simulados[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.orange,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Divider(color: CustomColors.grey),
                      Text(
                        AppLocalizations.of(context)!
                            .realizadoEm(simulados[index].date),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
            ),
            onTap: () {
              Navigator.of(context).pushNamed("/simulados",
                  arguments: SimuladosArguments(
                      simulados[index].id, simulados[index].title));
            },
          );
        });
  }
}
