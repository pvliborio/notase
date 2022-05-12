// ignore_for_file: file_names

class Simulado {
  final String id;
  final String title;
  final String date;

  const Simulado({
    required this.id,
    required this.title,
    required this.date,
  });

  factory Simulado.fromJson(Map<String, dynamic> json) {
    return Simulado(
      id: json['id'],
      title: json['title'],
      date: json['date']
    );
  }
}