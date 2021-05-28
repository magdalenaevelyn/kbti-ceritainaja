import 'dart:convert';

class Counselor {
  final String name, status, image;

  Counselor({
    this.name = '',
    this.status = '',
    this.image = '',
    // this.review = '',
    // this.review2 = '',
    // this.review3 = ''
  });
}

List counselorData = [
  Counselor(
      name: "Willy Bross",
      status: "Counselor at ABC Company",
      image: "assets/images/boy1.jpg",
      // review: "Every time I consultation with him, my life become better",
      // review2: "It's nice chatting with him",
      // review3: "Yash, he is super recommended for you"
  ),
  Counselor(
      name: "Maria Yokes",
      image: "assets/images/girl1.jpg",
      status: "Junior Counselor Internship at Ceritain Aja",
      // review: "Although she is a undergraduate studets, her knowledge is really awesome",
      // review2: "She's good at giving solution",
      // review3: "She has a sense of jokes too"
  ),
  Counselor(
      name: "Josh Carrot, M.Psi",
      image: "assets/images/boy2.png",
      status: "Counselor at Samsung Company",
      // review: "He's funny and can make the chat feels good",
      // review2: "I don't like his advice",
      // review3: "He's good and funny"
  ),
  Counselor(
      name: "Ollie Kendal",
      status: "Junior Counselor Internship at Ceritain Aja",
      image: "assets/images/user.png",
      // review: "His knowledge is good",
      // review2: "It's nice to chat with him'",
      // review3: "He cannot do his job perfectly! I don't like it"
  ),
  Counselor(
      name: "Maggie Santoso",
      status: "Counselor at Tokopedia",
      image: "assets/images/girl2.jpg",
      // review: "She is really good when she listen to our problem",
      // review2: "Her advice is super good",
      // review3: "Like her!"
  ),
  Counselor(
      name: "Jamie Andrea",
      status: "Counselor at See You Company",
      image: "assets/images/girl3.jpg",
      // review: "Every time I consultation with him, my life become better",
      // review2: "It's nice chatting with him",
      // review3: "Yash, he is super recommended for you"
  ),
];

class Counselor2{
  String idCounselor;
  String counselorName;
  String status;

  Counselor2({
    this.idCounselor, this.counselorName, this.status
  });

  factory Counselor2.fromJson(Map<String, dynamic> map) {
    return Counselor2(idCounselor: map["idCounselor"].toString(), counselorName: map["counselorName"], status: map["status"]);
  }

  Map<String, dynamic> toJson() {
    return {"idCounselor": idCounselor, "counselorName": counselorName, "status": status};
  }

  @override
  String toString() {
    return 'Counselor2{idCounselor: $idCounselor, counselorName: $counselorName, status: $status}';
  }
}

List<Counselor2> counselorFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Counselor2>.from(data.map((item) => Counselor2.fromJson(item)));
}

String counselorToJson(Counselor2 data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}