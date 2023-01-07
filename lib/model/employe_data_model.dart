// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

EmployeDataModel? productsFromJson(String str) => EmployeDataModel.fromJson(json.decode(str));

String productsToJson(EmployeDataModel? data) => json.encode(data!.toJson());

class EmployeDataModel {
    EmployeDataModel({
        this.age,
        this.name,
        this.experience,
        this.position,
    });

    int? age;
    String? name;
    String? experience;
    String? position;

    factory EmployeDataModel.fromJson(Map<String, dynamic> json) => EmployeDataModel(
        age: json["age"],
        name: json["name"],
        experience: json["experience"],
        position: json["position"],
    );

    Map<String, dynamic> toJson() => {
        "age": age,
        "name": name,
        "experience": experience,
        "position": position,
    };

    factory EmployeDataModel.getModelFromJson({required Map<String, dynamic> json}) {
    return EmployeDataModel(
        age: json["age"],
        name: json["name"],
        experience: json["experience"],
        position: json["position"],
        );
  }
}


