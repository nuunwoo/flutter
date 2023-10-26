import 'dart:convert';

class FirebaseRepostory {
  static String version = '';

  void initFireBase(String str) {
    print(
        'initFireBaseversion ${FirebaseModel.fromJson(jsonDecode(str)).version}');
    version = FirebaseModel.fromJson(jsonDecode(str)).version;
  }
}

class FirebaseModel {
  final String version;

  FirebaseModel(this.version);

  FirebaseModel.fromJson(Map<String, dynamic> json) : version = json['version'];

  Map<String, dynamic> toJson() => {
        'version': version,
      };

  @override
  String toString() => 'FirebaseModel<version: $version}>';
}
