import 'package:http/http.dart' as http;
import 'package:plant_b/core/url.dart';
import 'dart:convert';

Future getAllActivities() async {
  final response = await http.get(Uri.parse(url + '/activities'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable l = json.decode(response.body);
    print(response.body);
    return List<Activity>.from(l.map((model)=> Activity.fromJson(model)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load activities');
  }
}

Future getActivity(String code) {
  return http.get(Uri.parse(url+'/activities/$code'));
}

class Activity {
  String qr_code;
  int token_reward;
  String name;
  double location_x;
  double location_y;
  int maxNumParticipants;
  String date;
  String status;
  int hours_to_repeat;
  String description;
  String img_url;

  Activity({
    required this.qr_code,
    required this.token_reward,
    required this.name,
    required this.location_x,
    required this.location_y,
    required this.maxNumParticipants,
    required this.date,
    required this.status,
    required this.hours_to_repeat,
    required this.description,
    required this.img_url,
  });

  String getLabel() {
    return name;
  }

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
        qr_code: json['qr_code'],
        token_reward: json['token_reward'],
        name: json['name'],
        location_x: json['location_x'],
        location_y: json['location_y'],
        maxNumParticipants: json['maxNumParticipants'],
        date: json['date'],
        status: json['status'],
        hours_to_repeat: json['hours_to_repeat'],
        description: json['description'],
        img_url: json['img_url']
    );
  }
}