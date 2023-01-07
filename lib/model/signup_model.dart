// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

SignupModel productsFromJson(String str) => SignupModel.fromJson(json.decode(str));

String productsToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    SignupModel({
        this.name,
        this.hint,
        this.controller,
    });

    String? name;
    String? hint;
    String? controller;

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        name: json["name"],
        hint: json["hint"],
        controller: json["controller"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "hint": hint,
        "controller": controller,
    };
}
