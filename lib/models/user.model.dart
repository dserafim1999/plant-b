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

Future getUserFriends() async {
  final response = await http.get(Uri.parse(url+'/users/${loggedUser.cc}/friends'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable l = json.decode(response.body);
    return List<User>.from(l.map((model)=> User.fromJson(model)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user friends');
  }
}


Future getLeaderboard(bool isGlobal) async {
  final response = isGlobal ?
    await http.get(Uri.parse(url+'/users/${loggedUser.cc}/leaderboard')) :
    await http.get(Uri.parse(url+'/users/${loggedUser.cc}/friendleaderboard'));


  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable l = json.decode(response.body);
    return List<User>.from(l.map((model)=> User.fromJson(model)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load leaderboard');
  }
}

Future getLeaderboardPosition(bool isGlobal, int position) async {
  final response = isGlobal ?
    await http.get(Uri.parse(url+'/users/${loggedUser.cc}/leaderboard')) :
    await http.get(Uri.parse(url+'/users/${loggedUser.cc}/friendleaderboard'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable l = json.decode(response.body);
    List<User> leaderboard = List<User>.from(l.map((model)=> User.fromJson(model)));

    return leaderboard.length >= position ? leaderboard[position - 1].img_url : 'https://www.ihep.org/wp-content/themes/ihep-theme/assets/images/user-profile.jpg';
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load leaderboard position');
  }
}

Future<void> fakeLogin() async {
  final response = await getUser(11111111);

  if (response.statusCode == 200) {
     loggedUser = User.fromJson(json.decode(response.body)[0]);
  } else {
    throw Exception('Failed to load user');
  }
}

User loggedUser = User(cc: 11111111, name: 'name', token_amount: 0, token_total: 0, email: 'email', password: 'password', img_url: 'img_url');

class User {
  int cc;
  String name;
  int token_amount;
  int token_total;
  String email;
  String password;
  String img_url;

  User({
    required this.cc,
    required this.name,
    required this.token_amount,
    required this.token_total,
    required this.email,
    required this.password,
    required this.img_url
  });


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        cc: json['cc'],
        name: json['name'],
        token_amount: json['token_amount'],
        token_total: json['token_total'],
        email: json['email'],
        password: json['password'],
        img_url: json['img_url']
    );
  }
}
