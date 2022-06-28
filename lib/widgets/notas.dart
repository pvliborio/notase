import 'package:flutter/material.dart';
import 'package:notase/models/AlunoNota.dart';
import 'package:notase/res/custom_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotasWidget extends StatelessWidget {
  const NotasWidget({Key? key, required this.notas}) : super(key: key);

  final AlunoNota notas;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              AppLocalizations.of(context)!.suasNotas,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 30,
                  color: CustomColors.navy,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              AppLocalizations.of(context)!.tri,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  color: CustomColors.navy,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.linguagens,
                style: TextStyle(color: CustomColors.navy),
              ),
              const Spacer(),
              Text(
                notas.linguagens.tri,
                style: const TextStyle(color: CustomColors.navy),
              ),
            ],
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.cienciasHumanas,
                style: const TextStyle(color: CustomColors.navy),
              ),
              const Spacer(),
              Text(
                notas.humanas.tri,
                style: const TextStyle(color: CustomColors.navy),
              ),
            ],
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.cienciasNatureza,
                style: const TextStyle(color: CustomColors.navy),
              ),
              const Spacer(),
              Text(
                notas.natureza.tri,
                style: const TextStyle(color: CustomColors.navy),
              ),
            ],
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.matematica,
                style: const TextStyle(color: CustomColors.navy),
              ),
              const Spacer(),
              Text(
                notas.matematica.tri,
                style: const TextStyle(color: CustomColors.navy),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              AppLocalizations.of(context)!.questoesCorretas,
              style: TextStyle(
                  fontSize: 25,
                  color: CustomColors.navy,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.linguagens,
                style: TextStyle(color: CustomColors.navy),
              ),
              const Spacer(),
              Text(
                notas.linguagens.total,
                style: const TextStyle(color: CustomColors.navy),
              ),
            ],
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.cienciasHumanas,
                style: TextStyle(color: CustomColors.navy),
              ),
              const Spacer(),
              Text(
                notas.humanas.total,
                style: const TextStyle(color: CustomColors.navy),
              ),
            ],
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.cienciasNatureza,
                style: const TextStyle(color: CustomColors.navy),
              ),
              const Spacer(),
              Text(
                notas.natureza.total,
                style: const TextStyle(color: CustomColors.navy),
              ),
            ],
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.matematica,
                style: const TextStyle(color: CustomColors.navy),
              ),
              const Spacer(),
              Text(
                notas.matematica.total,
                style: const TextStyle(color: CustomColors.navy),
              ),
            ],
          ),
        ]);
  }
}
