import 'package:flutter/material.dart';
import 'package:notase/models/AlunoNota.dart';
import 'package:notase/res/custom_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RedacaoWidget extends StatelessWidget {
  const RedacaoWidget({Key? key, required this.notas}) : super(key: key);

  final AlunoNota notas;

  String getCompetenciaText(
      BuildContext context, String competencia, String nota) {
    if (competencia == "c1") {
      switch (nota) {
        case "0":
          return AppLocalizations.of(context)!.redacao_c1_0;
        case "40":
          return AppLocalizations.of(context)!.redacao_c1_40;
        case "80":
          return AppLocalizations.of(context)!.redacao_c1_80;
        case "120":
          return AppLocalizations.of(context)!.redacao_c1_120;
        case "160":
          return AppLocalizations.of(context)!.redacao_c1_160;
        case "200":
          return AppLocalizations.of(context)!.redacao_c1_200;
      }
    } else if (competencia == "c2") {
      switch (nota) {
        case "0":
          return AppLocalizations.of(context)!.redacao_c2_0;
        case "40":
          return AppLocalizations.of(context)!.redacao_c2_40;
        case "80":
          return AppLocalizations.of(context)!.redacao_c2_80;
        case "120":
          return AppLocalizations.of(context)!.redacao_c2_120;
        case "160":
          return AppLocalizations.of(context)!.redacao_c2_160;
        case "200":
          return AppLocalizations.of(context)!.redacao_c2_200;
      }
    } else if (competencia == "c3") {
      switch (nota) {
        case "0":
          return AppLocalizations.of(context)!.redacao_c3_0;
        case "40":
          return AppLocalizations.of(context)!.redacao_c3_40;
        case "80":
          return AppLocalizations.of(context)!.redacao_c3_80;
        case "120":
          return AppLocalizations.of(context)!.redacao_c3_120;
        case "160":
          return AppLocalizations.of(context)!.redacao_c3_160;
        case "200":
          return AppLocalizations.of(context)!.redacao_c3_200;
      }
    } else if (competencia == "c4") {
      switch (nota) {
        case "0":
          return AppLocalizations.of(context)!.redacao_c4_0;
        case "40":
          return AppLocalizations.of(context)!.redacao_c4_40;
        case "80":
          return AppLocalizations.of(context)!.redacao_c4_80;
        case "120":
          return AppLocalizations.of(context)!.redacao_c4_120;
        case "160":
          return AppLocalizations.of(context)!.redacao_c4_160;
        case "200":
          return AppLocalizations.of(context)!.redacao_c4_200;
      }
    } else if (competencia == "c5") {
      switch (nota) {
        case "0":
          return AppLocalizations.of(context)!.redacao_c5_0;
        case "40":
          return AppLocalizations.of(context)!.redacao_c5_40;
        case "80":
          return AppLocalizations.of(context)!.redacao_c5_80;
        case "120":
          return AppLocalizations.of(context)!.redacao_c5_120;
        case "160":
          return AppLocalizations.of(context)!.redacao_c5_160;
        case "200":
          return AppLocalizations.of(context)!.redacao_c5_200;
      }
    }
    return "";
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
              AppLocalizations.of(context)!.redacao,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 30,
                  color: CustomColors.navy,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Row(
            children: [
              const Text(
                "Total",
                style: TextStyle(
                    color: CustomColors.navy,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                notas.redacao.total,
                style: const TextStyle(
                    color: CustomColors.navy,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.redacao_c1,
                style: TextStyle(
                    color: CustomColors.navy,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                notas.redacao.competencias.c1,
                style: const TextStyle(
                    color: CustomColors.navy,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            getCompetenciaText(context, "c1", notas.redacao.competencias.c1),
            style: const TextStyle(color: Colors.black87, fontSize: 15),
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.redacao_c2,
                style: TextStyle(
                    color: CustomColors.navy,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                notas.redacao.competencias.c2,
                style: const TextStyle(
                    color: CustomColors.navy,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            getCompetenciaText(context, "c2", notas.redacao.competencias.c2),
            style: const TextStyle(color: Colors.black87, fontSize: 15),
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.redacao_c3,
                style: TextStyle(
                    color: CustomColors.navy,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                notas.redacao.competencias.c3,
                style: const TextStyle(
                    color: CustomColors.navy,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            getCompetenciaText(context, "c3", notas.redacao.competencias.c3),
            style: const TextStyle(color: Colors.black87, fontSize: 15),
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.redacao_c4,
                style: TextStyle(
                    color: CustomColors.navy,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                notas.redacao.competencias.c4,
                style: const TextStyle(
                    color: CustomColors.navy,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            getCompetenciaText(context, "c4", notas.redacao.competencias.c4),
            style: const TextStyle(color: Colors.black87, fontSize: 15),
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.redacao_c5,
                style: TextStyle(
                    color: CustomColors.navy,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                notas.redacao.competencias.c5,
                style: const TextStyle(
                    color: CustomColors.navy,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            getCompetenciaText(context, "c5", notas.redacao.competencias.c5),
            style: const TextStyle(color: Colors.black87, fontSize: 15),
          ),
        ]);
  }
}
