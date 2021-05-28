import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:kbti_ceritainaja/models/ChatMessage.dart';
import 'package:kbti_ceritainaja/models/Comment.dart';
import 'package:kbti_ceritainaja/models/Schedule.dart';
import 'package:kbti_ceritainaja/models/Counselor.dart';

class ApiServices {
  final String baseUrl = "http://192.168.100.13/kbti-ceritainaja-backend";

  Client client = Client();

  // ---------- Message -------------------
  Future<List<Message>> getMessage() async {
    final response = await client.get("$baseUrl/api/message/getMessage");
    if (response.statusCode == 200) {
      return messageFromJson(response.body);
      // print(jsonDecode(response.body));
    } else {
      return null;
    }
    // print(response.body);
  }

  Future<bool> createMessage(Message data) async {
    final response = await client.post(
        "$baseUrl/api/message/createMessage",
        headers: {"content-type": "application/json"},
        body: messageToJson(data)
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // ---------- Comment -------------------
  Future<List<Comment>> getComment() async {
    final response = await client.get("$baseUrl/api/comment/getComment");
    if (response.statusCode == 200) {
      return commentFromJson(response.body);
      // print(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createComment (Comment data) async {
    final response = await client.post(
        "$baseUrl/api/comment/createComment",
        headers: {"content-type": "application/json"},
        body: commentToJson(data)
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteComment(String idComment) async {
    final response = await client.post(
        "$baseUrl/api/comment/deleteComment/$idComment",
        headers: {"content-type": "application/json"},
    );

    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // ---------- Schedule -------------------
  // Future<List<Schedule>> getSchedule() async {
  //   final response = await client.get("$baseUrl/api/schedule/getSchedule");
  //   // final response = await http.get(Uri.http('$baseUrl', '/api/schedule/getSchedule'));
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     // return scheduleFromJson(response.body);
  //     // print(scheduleFromJson(response.body));
  //     print(Schedule.fromJson(jsonDecode(response.body)));
  //     // return List<Schedule>.from(jsonDecode(response.body));
  //   } else {
  //     return null;
  //   }
  // }
  Future<List<Schedule>> getSchedule() async {
    final response = await client.get("$baseUrl/api/schedule/getSchedule");
    if (response.statusCode == 200) {
      // print(response.body);
      // print(jsonDecode(response.body));
      return scheduleFromJson(response.body);
      // print(scheduleFromJson(response.body));
      // print(Schedule.fromJson(jsonDecode(response.body)));
;      // return List<Schedule>.from(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<Schedule> getScheduleById(String idSchedule) async {
    final response = await client.get("$baseUrl/api/schedule/getScheduleById/$idSchedule");
    if (response.statusCode == 200) {
      // return scheduleFromJson(response.body);
      final data = Schedule.fromJson(json.decode(response.body));
      return data;
    } else {
      return null;
    }
  }

  Future<bool> createSchedule (Schedule data) async {
    final response = await client.post(
        "$baseUrl/api/schedule/createSchedule",
        headers: {"content-type": "application/json"},
        body: scheduleToJson(data)
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> acceptSchedule (String idSchedule, String isAccept) async {
    final response = await client.post(
      "$baseUrl/api/schedule/acceptSchedule/$idSchedule/$isAccept",
      headers: {"content-type": "application/json"},
    );

    if (response.statusCode == 200) {
      return true;
      // print(response.body);
    } else {
      return false;
    }
  }

  // ---------- Counselor -------------------
  Future<List<Counselor2>> getCounselor() async {
    final response = await client.get("$baseUrl/api/counselor/getCounselor");
    if (response.statusCode == 200) {
      return counselorFromJson(response.body);
    } else {
      return null;
    }
  }
}