// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_adress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientAddressModel _$PatientAddressModelFromJson(Map<String, dynamic> json) =>
    PatientAddressModel(
      cep: json['cep'] as String,
      streetAdress: json['street-address'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
    );

Map<String, dynamic> _$PatientAddressModelToJson(
        PatientAddressModel instance) =>
    <String, dynamic>{
      'cep': instance.cep,
      'street-address': instance.streetAdress,
      'state': instance.state,
      'city': instance.city,
      'district': instance.district,
    };
