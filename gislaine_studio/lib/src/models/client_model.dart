import 'dart:convert';

ClientModel ClientModelFromJson(String str) =>
    ClientModel.fromJson(json.decode(str));

String ClientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
  ClientModel({
    this.nome,
    this.dataNascimento,
    this.celular,
    this.cpf,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        nome: json["nome"],
        dataNascimento: json["data_nascimento"],
        celular: json["celular"],
        cpf: json["cpf"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "data_nascimento": dataNascimento,
        "celular": celular,
        "cpf": cpf,
      };

  String? nome;
  String? dataNascimento;
  String? celular;
  String? cpf;
}
