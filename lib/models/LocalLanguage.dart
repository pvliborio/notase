// ignore_for_file: file_names

class LocalLanguage {
  final String uid;
  final String actualLocale;

  const LocalLanguage({
    required this.uid,
    required this.actualLocale,
  });

  factory LocalLanguage.fromJson(Map<String, dynamic> json) {
    return LocalLanguage(
      uid: json['uid'],
      actualLocale: json['actualLocale'],
    );
  }

  Map<String, dynamic> toMap() => {"uid": uid, "actualLocale": actualLocale};
}
