// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'patient_adress_model.g.dart';

@JsonSerializable()
class PatientAddressModel {

  // ATTENTION
  // precisa rodar isso para funcionar
  // -> dart pub run build_runner watch -d

  PatientAddressModel({
    required this.cep,
    required this.streetAdress,
    required this.number,
    required this.addressComplement,
    required this.state,
    required this.city,
    required this.district,
  });

  final String cep;
  @JsonKey(name: 'street-address')
  final String streetAdress;
  final String number;
  @JsonKey(name: 'address-complement', defaultValue: '')
  final String addressComplement;
  final String state;
  final String city;
  final String district;



  factory PatientAddressModel.fromJson(Map<String, dynamic> json) => _$PatientAddressModelFromJson(json);

  Map<String,dynamic> toJson() => _$PatientAddressModelToJson(this);



  PatientAddressModel copyWith({
    String? cep,
    String? streetAdress,
    String? number,
    String? addressComplement,
    String? state,
    String? city,
    String? district,
  }) {
    return PatientAddressModel(
      cep: cep ?? this.cep,
      streetAdress: streetAdress ?? this.streetAdress,
      number: number ?? this.number,
      addressComplement: addressComplement ?? this.addressComplement,
      state: state ?? this.state,
      city: city ?? this.city,
      district: district ?? this.district,
    );
  }
}
