import 'dart:convert';

class Schedule{
  String idSchedule;
  String name;
  String age;
  String problem;
  String date;
  String counselor;
  String fixSchedule;
  String isAccept;

  Schedule({
    this.idSchedule, this.name, this.age, this.problem, this.date, this.counselor, this.fixSchedule, this.isAccept
  });

  factory Schedule.fromJson(Map<String, dynamic> map) {
    return Schedule(idSchedule: map["idSchedule"].toString(), name: map["name"], age: map["age"], problem: map["problem"], date: map["date"],
      counselor: map["counselor"], fixSchedule: map["fixSchedule"], isAccept: map["isAccept"]);
  }

  Map<String, dynamic> toJson() {
    return {"idSchedule": idSchedule, "name": name, "age": age, "problem": problem, "date": date,
        "counselor": counselor, "fixSchedule": fixSchedule, "isAccept": isAccept};
  }

  @override
  String toString() {
    return 'Schedule{idSchedule: $idSchedule, name: $name, age: $age, problem: $problem, date: $date, counselor: $counselor, '
        'fixSchedule: $fixSchedule, isAccept: $isAccept}';
  }
}

List<Schedule> scheduleFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Schedule>.from(data.map((item) => Schedule.fromJson(item)));
}

String scheduleToJson(Schedule data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}