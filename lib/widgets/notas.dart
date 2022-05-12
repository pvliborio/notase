import 'package:flutter/material.dart';
import 'package:notase/models/AlunoNota.dart';
import 'package:notase/res/custom_colors.dart';

class NotasWidget extends StatelessWidget {
  const NotasWidget({Key? key, required this.notas}) : super(key: key);

  final AlunoNota notas;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
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
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  color: CustomColors.navy,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              const Text(
                "Linguagens e suas Tecnologias",
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
              const Text(
                "Ciências Humanas e suas Tecnologias",
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
              const Text(
                "Ciências da Natureza e suas Tecnologias",
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
              const Text(
                "Matemática e suas Tecnologias",
                style: const TextStyle(color: CustomColors.navy),
              ),
              const Spacer(),
              Text(
                notas.matematica.tri,
                style: const TextStyle(color: CustomColors.navy),
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
            children: [
              const Text(
                "Linguagens e suas Tecnologias",
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
              const Text(
                "Ciências Humanas e suas Tecnologias",
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
              const Text(
                "Ciências da Natureza e suas Tecnologias",
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
              const Text(
                "Matemática e suas Tecnologias",
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
