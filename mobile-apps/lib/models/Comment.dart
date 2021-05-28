import 'dart:convert';

class Comment{
  String idComment;
  String name;
  String comment;

  Comment({
    this.idComment, this.name, this.comment
  });

  factory Comment.fromJson(Map<String, dynamic> map) {
    return Comment(idComment: map["idComment"], name: map["name"], comment: map["comment"]);
  }

  Map<String, dynamic> toJson() {
    return {"idComment": idComment, "name": name, "comment": comment};
  }

  @override
  String toString() {
    return 'Comment{idComment: $idComment, name: $name, comment: $comment}';
  }
}

List<Comment> commentFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Comment>.from(data.map((item) => Comment.fromJson(item)));
}

String commentToJson(Comment data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}