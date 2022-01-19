import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plant_b/core/url.dart';
import 'package:plant_b/models/activity.model.dart';
import 'package:plant_b/models/discount.model.dart';
import 'package:plant_b/models/ticket.model.dart';

Future getAllUsers() async {
  final response = await http.get(Uri.parse(url+'/users'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable l = json.decode(response.body);
    return List<User>.from(l.map((model)=> User.fromJson(model)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load tickets');
  }
}

Future getAllUserActivities() {
  // For now
  return getAllActivities();
}

Future getAllUserDiscounts() {
  // For now
  return getAllDiscounts();
}

Future getAllUserTickets() {
  // For now
  return getAllTickets();
}

Future getUser(int cc) {
  print(url+'/users/$cc');
  return http.get(Uri.parse(url+'/users/$cc'));
}

Future<void> fakeLogin() async {
  final response = await getUser(11111111);

  if (response.statusCode == 200) {
     loggedUser = User.fromJson(json.decode(response.body)[0]);
  } else {
    throw Exception('Failed to load user');
  }
}

User loggedUser = User(cc: 1, name: 'name', token_amount: 0, email: 'email', password: 'password');

class User {
  int cc;
  String name;
  int token_amount;
  String email;
  String password;
  //String imageUrl;

  User({
    required this.cc,
    required this.name,
    required this.token_amount,
    required this.email,
    required this.password,
  });


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        cc: json['cc'],
        name: json['name'],
        token_amount: json['token_amount'],
        email: json['email'],
        password: json['password']
    );
  }
}
