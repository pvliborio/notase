// ignore_for_file: file_names

class AlunoNota {
  final Nota natureza;
  final Nota linguagens;
  final Nota humanas;
  final Nota matematica;
  final NotaRedacao redacao;

  const AlunoNota({
    required this.natureza,
    required this.linguagens,
    required this.humanas,
    required this.matematica,
    required this.redacao,
  });

  factory AlunoNota.fromJson(Map<String, dynamic> json) {
    return AlunoNota(
      natureza: Nota.fromJson(json['natureza']),
      linguagens: Nota.fromJson(json['linguagens']),
      humanas: Nota.fromJson(json['humanas']),
      matematica: Nota.fromJson(json['matematica']),
      redacao: NotaRedacao.fromJson(json['redacao']),
    );
  }
}

class Nota {
  final String tri;
  final String total;

  const Nota({
    required this.tri,
    required this.total
  });

  factory Nota.fromJson(Map<String, dynamic> json) {
    return Nota(
      tri: json['tri'],
      total: json['total']
    );
  }
}

class NotaRedacao {
  final CompetenciasRedacao competencias;
  final String total;

  const NotaRedacao({
    required this.competencias,
    required this.total
  });

  factory NotaRedacao.fromJson(Map<String, dynamic> json) {
    return NotaRedacao(
      competencias: CompetenciasRedacao.fromJson(json['competencias']),
      total: json['total']
    );
  }
}

class CompetenciasRedacao {
  final String c1;
  final String c2;
  final String c3;
  final String c4;
  final String c5;

  const CompetenciasRedacao({
    required this.c1,
    required this.c2,
    required this.c3,
    required this.c4,
    required this.c5
  });

  factory CompetenciasRedacao.fromJson(Map<String, dynamic> json) {
    return CompetenciasRedacao(
      c1: json['c1'],
      c2: json['c2'],
      c3: json['c3'],
      c4: json['c4'],
      c5: json['c5'],
    );
  }
}