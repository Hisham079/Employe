// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

UserDetails productsFromJson(String str) => UserDetails.fromJson(json.decode(str));

String productsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
    UserDetails({
        this.id,
        this.name,
        this.email,
        this.mobileno,
    });

    String? id;
    String? name;
    String? email;
    String? mobileno;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobileno: json["mobileno"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobileno": mobileno,
    };
}
