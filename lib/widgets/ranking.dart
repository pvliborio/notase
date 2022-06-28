import 'package:flutter/material.dart';
import 'package:notase/models/AlunoRanking.dart';
import 'package:notase/res/custom_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RankingWidget extends StatelessWidget {
  const RankingWidget({Key? key, required this.ranking}) : super(key: key);

  final AlunoRanking ranking;

  Color getColorByRanking(String ranking, String max) {
    double rank = double.parse(ranking);
    double maxRank = double.parse(max);
    if (rank <= 5) {
      return Colors.green.shade900;
    } else if (rank <= (maxRank / 4)) {
      return Colors.green.shade700;
    } else if (rank <= (maxRank / 2)) {
      return Colors.yellow.shade800;
    } else if (rank >= maxRank - 5) {
      return Colors.red.shade900;
    } else {
      return Colors.orange.shade800;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              AppLocalizations.of(context)!.ranking,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 30,
                  color: CustomColors.navy,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Expanded(
              child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(0),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Card(
                  color: getColorByRanking(
                      ranking.linguagens.posicao, ranking.linguagens.total),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ranking.linguagens.posicao,
                        style: const TextStyle(fontSize: 40),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            AppLocalizations.of(context)!
                                .de(ranking.linguagens.total),
                            style: const TextStyle(fontSize: 20),
                          )),
                      Text(
                        AppLocalizations.of(context)!.linguagens,
                        style: TextStyle(color: Colors.white70),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ))),
              Card(
                  color: getColorByRanking(
                      ranking.humanas.posicao, ranking.humanas.total),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ranking.humanas.posicao,
                        style: const TextStyle(fontSize: 40),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            AppLocalizations.of(context)!
                                .de(ranking.humanas.total),
                            style: const TextStyle(fontSize: 20),
                          )),
                      Text(
                        AppLocalizations.of(context)!.cienciasHumanas,
                        style: TextStyle(color: Colors.white70),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ))),
              Card(
                  color: getColorByRanking(
                      ranking.natureza.posicao, ranking.natureza.total),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ranking.natureza.posicao,
                        style: const TextStyle(fontSize: 40),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            AppLocalizations.of(context)!
                                .de(ranking.natureza.total),
                            style: const TextStyle(fontSize: 20),
                          )),
                      Text(
                        AppLocalizations.of(context)!.cienciasNatureza,
                        style: TextStyle(color: Colors.white70),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ))),
              Card(
                  color: getColorByRanking(
                      ranking.matematica.posicao, ranking.matematica.total),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ranking.matematica.posicao,
                        style: const TextStyle(fontSize: 40),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            AppLocalizations.of(context)!
                                .de(ranking.matematica.total),
                            style: const TextStyle(fontSize: 20),
                          )),
                      Text(
                        AppLocalizations.of(context)!.matematica,
                        style: TextStyle(color: Colors.white70),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ))),
              Card(
                  color: getColorByRanking(
                      ranking.redacao.posicao, ranking.redacao.total),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ranking.redacao.posicao,
                        style: const TextStyle(fontSize: 40),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            AppLocalizations.of(context)!
                                .de(ranking.redacao.total),
                            style: const TextStyle(fontSize: 20),
                          )),
                      Text(
                        AppLocalizations.of(context)!.redacao,
                        style: TextStyle(color: Colors.white70),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ))),
            ],
          ))
        ]);
  }
}
