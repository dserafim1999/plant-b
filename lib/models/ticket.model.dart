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

Future getAllUserTickets(int cc) async {
  final response = await http.get(Uri.parse(url+'/users/$cc/transportation'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable l = json.decode(response.body);
    List<Ticket> tickets = List<Ticket>.from(l.map((model)=> Ticket.fromJson(model)));
    tickets.sort((a, b) {
      if(b.used) {
        return -1;
      }
      return 1;
    }
    );
    return tickets;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user tickets');
  }
}

Future addUserTicket(int cc, String transportation) {
  return http.post(
    Uri.parse(url+'/users/$cc/transportation'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "user_cc" : cc,
      "transportation_qr" : transportation,
      "status": "unused"
    }),
  );
}

Future getTicket(String code) {
  return http.get(Uri.parse(url+'/transportation/$code'));
}

class Ticket {
  int token_cost;
  String name;
  int amount;
  String qr_code;
  String img_url;
  bool used;

  Ticket({
    required this.token_cost,
    required this.name,
    required this.amount,
    required this.qr_code,
    required this.img_url,
    this.used = false
  });

  String getLabel() {
    return name;
  }

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
        qr_code: json['qr_code'],
        name: json['name'],
        amount: json['amount'],
        token_cost: json['token_cost'],
        img_url: json['img_url'],
        used: json.containsKey("status") ? json["status"] == "used" : false
    );
  }
}
