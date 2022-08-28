import 'dart:convert';

PersonModel personModelFromJson(String str) =>
    PersonModel.fromJson(json.decode(str));

String personModelToJson(PersonModel data) => json.encode(data.toJson());

class PersonModel {
  PersonModel({
    this.nome,
    this.dataNascimento,
    this.celular,
    this.cpf,
  });

  String? nome;
  String? dataNascimento;
  String? celular;
  String? cpf;

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
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
}
