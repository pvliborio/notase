import 'package:flutter/material.dart';
import 'package:notase/models/AlunoNota.dart';
import 'package:notase/res/custom_colors.dart';

class RedacaoWidget extends StatelessWidget {
  const RedacaoWidget({Key? key, required this.notas}) : super(key: key);

  final AlunoNota notas;

  String getCompetenciaText(String competencia, String nota) {
    if(competencia == "c1") {
      switch(nota) {
        case "0":
          return "Demonstra desconhecimento da modalidade escrita formal da língua portuguesa.";
        case "40":
          return "Demonstra domínio precário da modalidade escrita formal da língua portuguesa, de forma sistemática, com diversificados e frequentes desvios gramaticais, de escolha de registro e de convenções da escrita.";
        case "80":
          return "Demonstra domínio insuficiente da modalidade escrita formal da língua portuguesa, com muitos desvios gramaticais, de escolha de registro e de convenções da escrita.";
        case "120":
          return "Demonstra domínio mediano da modalidade escrita formal da língua portuguesa e de escolha de registro, com alguns desvios gramaticais e de convenções da escrita.";
        case "160":
          return "Demonstra bom domínio da modalidade escrita formal da língua portuguesa e de escolha de registro, com poucos desvios gramaticais e de convenções da escrita.";
        case "200":
          return "Demonstra excelente domínio da modalidade escrita formal da língua portuguesa e de escolha de registro.";
      }
    }else if(competencia == "c2") {
      switch(nota) {
        case "0":
          return "Fuga ao tema/não atendimento à estrutura dissertativo-argumentativa. Nestes casos a redação recebe nota zero e é anulada.";
        case "40":
          return "Apresenta o assunto, tangenciando o tema, ou demonstra domínio precário do texto dissertativo-argumentativo, com traços constantes de outros tipos textuais.";
        case "80":
          return "Desenvolve o tema recorrendo à cópia de trechos dos textos motivadores ou apresenta domínio insuficiente do texto dissertativo-argumentativo, não atendendo à estrutura com proposição, argumentação e conclusão.";
        case "120":
          return "Desenvolve o tema por meio de argumentação previsível e apresenta domínio mediano do texto dissertativo-argumentativo, com proposição, argumentação e conclusão.";
        case "160":
          return "Desenvolve o tema por meio de argumentação consistente e apresenta bom domínio do texto dissertativo-argumentativo, com proposição, argumentação e conclusão.";
        case "200":
          return "Desenvolve o tema por meio de argumentação consistente, a partir de um repertório sociocultural produtivo, e apresenta excelente domínio do texto dissertativo argumentativo.";
      }
    }else if(competencia == "c3") {
      switch(nota) {
        case "0":
          return "Apresenta informações, fatos e opiniões não relacionados ao tema e sem defesa de um ponto de vista.";
        case "40":
          return "Apresenta informações, fatos e opiniões pouco relacionados ao tema ou incoerentes e sem defesa de um ponto de vista.";
        case "80":
          return "Apresenta informações, fatos e opiniões relacionados ao tema, mas desorganizados ou contraditórios e limitados aos argumentos dos textos motivadores, em defesa de um ponto de vista.";
        case "120":
          return "Apresenta informações, fatos e opiniões relacionados ao tema, limitados aos argumentos dos textos motivadores e pouco organizados, em defesa de um ponto de vista.";
        case "160":
          return "Apresenta informações, fatos e opiniões relacionados ao tema, de forma organizada, com indícios de autoria, em defesa de um ponto de vista.";
        case "200":
          return "Apresenta informações, fatos e opiniões relacionados ao tema proposto, de forma consistente e organizada, configurando autoria, em defesa de um ponto de vista.";
      }
    }else if(competencia == "c4") {
      switch(nota) {
        case "0":
          return "Não articula as informações.";
        case "40":
          return "Articula as partes do texto de forma precária.";
        case "80":
          return "Articula as partes do texto, de forma insuficiente, com muitas inadequações, e apresenta repertório limitado de recursos coesivos.";
        case "120":
          return "Articula as partes do texto, de forma mediana, com inadequações, e apresenta repertório pouco diversificado de recursos coesivos.";
        case "160":
          return "Articula as partes do texto, com poucas inadequações, e apresenta repertório diversificado de recursos coesivos";
        case "200":
          return "Articula bem as partes do texto e apresenta repertório diversificado de recursos coesivos.";
      }
    }else if(competencia == "c5") {
      switch(nota) {
        case "0":
          return "Não apresenta proposta de intervenção ou apresenta proposta não relacionada ao tema ou ao assunto.";
        case "40":
          return "Apresenta proposta de intervenção vaga, precária ou relacionada apenas ao assunto.";
        case "80":
          return "Elabora, de forma insuficiente, proposta de intervenção relacionada ao tema, ou não articulada com a discussão desenvolvida no texto.";
        case "120":
          return "Elabora, de forma mediana, proposta de intervenção relacionada ao tema e articulada à discussão desenvolvida no texto.";
        case "160":
          return "Elabora bem proposta de intervenção relacionada ao tema e articulada à discussão desenvolvida no texto";
        case "200":
          return "Elabora muito bem proposta de intervenção, detalhada, relacionada ao tema e articulada à discussão desenvolvida no texto.";
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
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Redação",
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
              const Text(
                "Competência 1",
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
            getCompetenciaText("c1", notas.redacao.competencias.c1),
            style: const TextStyle(color: Colors.black87, fontSize: 15),
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              const Text(
                "Competência 2",
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
            getCompetenciaText("c2", notas.redacao.competencias.c2),
            style: const TextStyle(color: Colors.black87, fontSize: 15),
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              const Text(
                "Competência 3",
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
            getCompetenciaText("c3", notas.redacao.competencias.c3),
            style: const TextStyle(color: Colors.black87, fontSize: 15),
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              const Text(
                "Competência 4",
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
            getCompetenciaText("c4", notas.redacao.competencias.c4),
            style: const TextStyle(color: Colors.black87, fontSize: 15),
          ),
          const Divider(color: CustomColors.navy),
          Row(
            children: [
              const Text(
                "Competência 5",
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
            getCompetenciaText("c5", notas.redacao.competencias.c5),
            style: const TextStyle(color: Colors.black87, fontSize: 15),
          ),
        ]);
  }
}
