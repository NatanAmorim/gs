import 'dart:convert';

StudentModel StudentModelFromJson(String str) =>
    StudentModel.fromJson(json.decode(str));

String StudentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  StudentModel({
    this.nome,
    this.dataNascimento,
    this.celular,
    this.cpf,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
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
