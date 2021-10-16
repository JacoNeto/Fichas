part 'ficha.g.dart';

class Ficha {
  String? id;
  String? nome;
  String? cpf;
  String? telefone;
  String? endereco;
  String? bairro;
  String? comunidade;
  String? obs;
  String? urlLink;
  String? createdDate;
  String? lastModifiedDate;

  Ficha(
      {this.id,
      this.nome,
      this.cpf,
      this.telefone,
      this.endereco,
      this.bairro,
      this.comunidade,
      this.obs,
      this.urlLink,
      this.createdDate,
      this.lastModifiedDate});

  factory Ficha.fromJson(Map<String, dynamic> json) => _$FichaFromJson(json);
  Map<String, dynamic> toJson() => _$FichaToJson(this);
}
