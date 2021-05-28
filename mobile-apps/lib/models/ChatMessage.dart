import 'dart:convert';

import 'package:flutter/material.dart';

// enum ChatMessageType { text, audio, image, video }
// enum MessageStatus { not_sent, not_view, viewed }
//
// class ChatMessage {
//   final String text;
//   final ChatMessageType messageType;
//   final MessageStatus messageStatus;
//   final bool isSender;
//
//   ChatMessage({
//     this.text = '',
//     @required this.messageType,
//     @required this.messageStatus,
//     @required this.isSender,
//   });
// }
//
// List demeChatMessages = [
//   ChatMessage(
//     text: "Hi Sajol,",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.viewed,
//     isSender: false,
//   ),
//   ChatMessage(
//     text: "Hello, How are you?",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.viewed,
//     isSender: true,
//   ),
//   ChatMessage(
//     text: "Fine",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.viewed,
//     isSender: false,
//   ),
//   ChatMessage(
//     text: "That's good then",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.viewed,
//     isSender: true,
//   ),
//   ChatMessage(
//     text: "What do you think about this day?",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.not_sent,
//     isSender: true,
//   ),
//   ChatMessage(
//     text: "This looks great man!!",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.viewed,
//     isSender: false,
//   ),
//   ChatMessage(
//     text: "Glad you like it",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.not_view,
//     isSender: true,
//   ),
// ];

class Message{
  String idMessage;
  String text;
  String messageType;
  String isSender;

  Message({
    this.idMessage, this.text, this.messageType, this.isSender
  });

  factory Message.fromJson(Map<String, dynamic> map) {
    return Message(idMessage: map["idMessage"].toString(), text: map["text"], messageType: map["messageType"], isSender: map["isSender"]);
  }

  Map<String, dynamic> toJson() {
    return {"idMessage": idMessage, "text": text, "messageType": messageType, "isSender": isSender};
  }

  @override
  String toString() {
    return 'Message{idMessage: $idMessage, text: $text, messageType: $messageType, isSender: $isSender}';
  }
}

List<Message> messageFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Message>.from(data.map((item) => Message.fromJson(item)));
}

String messageToJson(Message data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}