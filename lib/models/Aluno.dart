// ignore_for_file: file_names

import 'package:notase/models/AlunoNota.dart';
import 'package:notase/models/AlunoRanking.dart';

class Aluno {
  final AlunoNota notas;
  final AlunoRanking ranking;

  const Aluno({
    required this.notas,
    required this.ranking,
  });

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      notas: AlunoNota.fromJson(json['notas']),
      ranking: AlunoRanking.fromJson(json['ranking']),
    );
  }
}