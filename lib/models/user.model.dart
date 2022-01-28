import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plant_b/core/url.dart';

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
    throw Exception('Failed to load users');
  }
}

Future getUser(int cc) async {
  final response = await http.get(Uri.parse(url+'/users/$cc'));


  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(json.decode(response.body)[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load activities');
  }
}

Future getUserFriends() async {
  final response = await http.get(Uri.parse(url+'/users/${loggedUser}/friends'));

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

Future addUserFriend(int cc1, int cc2) {
  return http.post(
    Uri.parse(url+'/users/$cc1/friends'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'user1_cc': cc1,
      'user2_cc': cc2
    }),
  );
}

Future deleteUserFriend(int cc1, int cc2) {
  return http.delete(Uri.parse(url+'/users/$cc1/friends/$cc2'));
}



Future getLeaderboard(bool isGlobal) async {
  final response = isGlobal ?
    await http.get(Uri.parse(url+'/users/${loggedUser}/leaderboard')) :
    await http.get(Uri.parse(url+'/users/${loggedUser}/friendleaderboard'));


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
    await http.get(Uri.parse(url+'/users/${loggedUser}/leaderboard')) :
    await http.get(Uri.parse(url+'/users/${loggedUser}/friendleaderboard'));

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

Future login(int cc) async {
  loggedUser = cc;
  return await getUser(cc);
}

int loggedUser = 11111111;

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
