// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'patient_adress_model.g.dart';

@JsonSerializable()
class PatientAddressModel {

  // ATTENTION
  // precisa rodar isso para funcionar
  // -> dart pub run build_runner watch -d

  final String cep;
  @JsonKey(name: 'street-address')
  final String streetAdress;
  final String state;
  final String city;
  final String district;

  PatientAddressModel({
    required this.cep,
    required this.streetAdress,
    required this.state,
    required this.city,
    required this.district,
  });

  factory PatientAddressModel.fromJson(Map<String, dynamic> json) => _$PatientAddressModelFromJson(json);

  Map<String,dynamic> toJson() => _$PatientAddressModelToJson(this);
}
