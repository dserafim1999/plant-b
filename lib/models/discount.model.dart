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

Future getDiscount(String code) {
  return http.get(Uri.parse(url+'/discounts/$code'));
}

class Discount {
  String qr_code;
  String type;
  int amount;
  int token_cost;
  String shop;
  double location_x;
  double location_y;
  String description;
  //String imageUrl;

  Discount({
    required this.qr_code,
    required this.type,
    required this.amount,
    required this.token_cost,
    required this.shop,
    required this.location_x,
    required this.location_y,
    required this.description,
    //required this.imageUrl,
  });

  String getLabel() {
    return amount.toString() + "% - " + shop;
  }

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
        qr_code: json['qr_code'],
        type: json['type'],
        amount: json['amount'],
        token_cost: json['token_cost'],
        shop: json['shop'],
        location_x: json['location_x'],
        location_y: json['location_y'],
        description: json['description']
    );
  }

}