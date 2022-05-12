// ignore_for_file: file_names

class AlunoRanking {
  final Ranking natureza;
  final Ranking linguagens;
  final Ranking humanas;
  final Ranking matematica;
  final Ranking redacao;

  const AlunoRanking({
    required this.natureza,
    required this.linguagens,
    required this.humanas,
    required this.matematica,
    required this.redacao,
  });

  factory AlunoRanking.fromJson(Map<String, dynamic> json) {
    return AlunoRanking(
      natureza: Ranking.fromJson(json['natureza']),
      linguagens: Ranking.fromJson(json['linguagens']),
      humanas: Ranking.fromJson(json['humanas']),
      matematica: Ranking.fromJson(json['matematica']),
      redacao: Ranking.fromJson(json['redacao']),
    );
  }
}

class Ranking {
  final String posicao;
  final String total;

  const Ranking({
    required this.posicao,
    required this.total
  });

  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
      posicao: json['posicao'],
      total: json['total']
    );
  }
}