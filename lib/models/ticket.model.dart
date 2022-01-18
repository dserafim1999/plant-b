import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plant_b/core/url.dart';

Future getAllTickets() async {
  final response = await http.get(Uri.parse(url+'/transportation'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable l = json.decode(response.body);
    return List<Ticket>.from(l.map((model)=> Ticket.fromJson(model)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load tickets');
  }
}

Future getTicket(String code) {
  return http.get(Uri.parse(url+'/transportation/$code'));
}

class Ticket {
  int token_cost;
  int amount;
  String qr_code;
  //String imageUrl;

  Ticket({
    required this.token_cost,
    required this.amount,
    required this.qr_code,
    //required this.imageUrl,
  });

  String getLabel() {
    return qr_code;
  }

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
        qr_code: json['qr_code'],
        amount: json['amount'],
        token_cost: json['token_cost'],
    );
  }
}
