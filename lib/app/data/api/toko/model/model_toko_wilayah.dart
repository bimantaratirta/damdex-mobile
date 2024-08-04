import 'dart:convert';

class ModelTokoWilayah {
  int? totalAllData;
  List<Payload>? payload;

  ModelTokoWilayah({
    this.totalAllData,
    this.payload,
  });

  ModelTokoWilayah copyWith({
    int? totalAllData,
    List<Payload>? payload,
  }) =>
      ModelTokoWilayah(
        totalAllData: totalAllData ?? this.totalAllData,
        payload: payload ?? this.payload,
      );

  factory ModelTokoWilayah.fromRawJson(String str) => ModelTokoWilayah.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelTokoWilayah.fromJson(Map<String, dynamic> json) => ModelTokoWilayah(
        totalAllData: json["totalAllData"],
        payload: json["payload"] == null ? [] : List<Payload>.from(json["payload"]!.map((x) => Payload.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalAllData": totalAllData,
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}

class Payload {
  int? id;
  int? idProvinsi;
  String? tipe;
  String? nama;

  Payload({
    this.id,
    this.idProvinsi,
    this.tipe,
    this.nama,
  });

  Payload copyWith({
    int? id,
    int? idProvinsi,
    String? tipe,
    String? nama,
  }) =>
      Payload(
        id: id ?? this.id,
        idProvinsi: idProvinsi ?? this.idProvinsi,
        tipe: tipe ?? this.tipe,
        nama: nama ?? this.nama,
      );

  factory Payload.fromRawJson(String str) => Payload.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        idProvinsi: json["idProvinsi"],
        tipe: json["tipe"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idProvinsi": idProvinsi,
        "tipe": tipe,
        "nama": nama,
      };
}
