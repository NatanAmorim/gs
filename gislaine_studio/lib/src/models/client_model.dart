import 'dart:convert';

ClientModel ClientModelFromJson(String str) =>
    ClientModel.fromJson(json.decode(str));

String ClientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
  ClientModel({
    this.nome,
    this.dataNascimento,
    this.celular,
    this.cep,
    this.endereco,
    this.cpf,
    this.nomeResponsavel,
    this.cpfResponsavel,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        nome: json["nome"],
        dataNascimento: json["data_nascimento"],
        celular: json["celular"],
        cep: json["cep"],
        endereco: json["endereco"],
        cpf: json["cpf"],
        nomeResponsavel: json["nome_responsavel"],
        cpfResponsavel: json["cpf_responsavel"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "data_nascimento": dataNascimento,
        "celular": celular,
        "cep": cep,
        "endereco": endereco,
        "cpf": cpf,
        "nome_responsavel": nomeResponsavel,
        "cpf_responsavel": cpfResponsavel,
      };

  String? nome;
  String? dataNascimento;
  String? celular;
  String? cep;
  String? endereco;
  String? cpf;
  String? nomeResponsavel;
  String? cpfResponsavel;
}
