import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plant_b/core/url.dart';

Future getAllDiscounts() async {
  final response = await http.get(Uri.parse(url + '/discounts'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable l = json.decode(response.body);
    return List<Discount>.from(l.map((model)=> Discount.fromJson(model)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load discounts');
  }
}

Future getAllUserDiscounts(int cc) async {
  final response = await http.get(Uri.parse(url + '/users/$cc/discounts'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable l = json.decode(response.body);
    List<Discount> discounts = List<Discount>.from(l.map((model)=> Discount.fromJson(model)));
    discounts.sort((a, b) {
      if(b.used) {
          return -1;
      }
          return 1;
      }
    );
    return discounts;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user discounts');
  }
}

Future getDiscount(String code) {
  return http.get(Uri.parse(url+'/discounts/$code'));
}

Future addUserDiscount(int cc, String discount) {
  return http.post(
    Uri.parse(url+'/users/$cc/discounts'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "user_cc" : cc,
      "discounts_qr" : discount,
      "status": "unused"
    }),
  );
}

class Discount {
  String qr_code;
  String name;
  String type;
  int amount;
  int token_cost;
  String shop;
  double location_x;
  double location_y;
  String description;
  String img_url;
  bool used;

  Discount({
    required this.qr_code,
    required this.name,
    required this.type,
    required this.amount,
    required this.token_cost,
    required this.shop,
    required this.location_x,
    required this.location_y,
    required this.description,
    required this.img_url,
    this.used = false
  });

  String getLabel() {
    return name + " - " + shop;
  }

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
        qr_code: json['qr_code'],
        name: json['name'],
        type: json['type'],
        amount: json['amount'],
        token_cost: json['token_cost'],
        shop: json['shop'],
        location_x: json['location_x'],
        location_y: json['location_y'],
        description: json['description'],
        img_url: json['img_url'],
        used: json.containsKey("status") ? json["status"] == "used" : false
    );
  }

}