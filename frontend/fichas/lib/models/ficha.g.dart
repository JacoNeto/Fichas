// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ficha.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ficha _$FichaFromJson(Map<String, dynamic> json) => Ficha(
      id: json['_links']["self"]["href"] as String?,
      nome: json['nome'] as String?,
      cpf: json['cpf'] as String?,
      telefone: json['telefone'] as String?,
      endereco: json['endereco'] as String?,
      bairro: json['bairro'] as String?,
      comunidade: json['comunidade'] as String?,
      obs: json['obs'] as String?,
      createdDate: json['createdDate'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as String?,
    );

Map<String, dynamic> _$FichaToJson(Ficha instance) => <String, dynamic>{
      'nome': instance.nome,
      'cpf': instance.cpf,
      'telefone': instance.telefone,
      'endereco': instance.endereco,
      'bairro': instance.bairro,
      'comunidade': instance.comunidade,
      'obs': instance.obs,
      'createdDate': instance.createdDate,
      'lastModifiedDate': instance.lastModifiedDate,
    };
