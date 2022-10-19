// To parse this JSON data, do
//
//     final viacepModel = viacepModelFromJson(jsonString);

import 'dart:convert';

ViacepModel viacepModelFromJson(String str) =>
    ViacepModel.fromJson(json.decode(str));

String viacepModelToJson(ViacepModel data) => json.encode(data.toJson());

class ViacepModel {
  ViacepModel({
    this.erro,
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.ibge,
    this.gia,
    this.ddd,
    this.siafi,
  });

  factory ViacepModel.fromJson(Map<String, dynamic> json) => ViacepModel(
        erro: json["erro"],
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
        ibge: json["ibge"],
        gia: json["gia"],
        ddd: json["ddd"],
        siafi: json["siafi"],
      );

  String? erro;
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  Map<String, dynamic> toJson() => {
        "erro": erro,
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
        "ibge": ibge,
        "gia": gia,
        "ddd": ddd,
        "siafi": siafi,
      };
}
