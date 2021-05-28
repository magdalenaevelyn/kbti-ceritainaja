import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/apiservices.dart';
import 'package:kbti_ceritainaja/constant.dart';
import 'package:kbti_ceritainaja/models/ChatMessage.dart';

class MessageBody extends StatefulWidget {
  MessageBody({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MessageBodyState createState() => _MessageBodyState();
}

class _MessageBodyState extends State<MessageBody>{
  final _formKey = GlobalKey<FormState>();
  // ApiServices apiService;

  List<Message> listMessage = new List();
  Message message = new Message();
  var refreshkey = GlobalKey<RefreshIndicatorState>();

  // Refresh kembali halaman dashboard
  // FutureOr onGoBack(dynamic value) {
  //   // Refresh state
  //   setState(() {
  //
  //   });
  // }

  // Future<Null> refreshlist() async {
  //   await Future.delayed(Duration(seconds: 2)); //wait here for 2 second
  //   setState(() {
  //     ApiServices().getMessage();
  //   });
  // }
  //
  @override
  void initState() {
    super.initState();
    // apiService = ApiServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          FutureBuilder(
            future: ApiServices().getMessage(),
            builder: (BuildContext context, AsyncSnapshot<List<Message>> snapshot) {
              if (snapshot.hasError){
                return Center(
                  child: Text(
                      "Something wrong with message: ${snapshot.error.toString()}"
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                listMessage = snapshot.data;

                return ListView.builder(
                  itemBuilder: (context, position) {
                    return Padding(
                      padding: const EdgeInsets.only(top: kDefaultPadding),
                      child: Row(
                        mainAxisAlignment: listMessage[position].isSender == "0" ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          if(listMessage[position].isSender == "1") ...[
                            CircleAvatar(
                              radius: 12,
                              backgroundImage: AssetImage("assets/images/user.png"),
                            ),
                            SizedBox(width: kDefaultPadding / 2)
                          ],
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: kDefaultPadding * 0.75,
                                vertical: kDefaultPadding / 2
                            ),
                            decoration: BoxDecoration(
                                color: listMessage[position].isSender == "1" ? kPrimaryColor : kSecondaryColor,
                                borderRadius: BorderRadius.circular((30))
                            ),
                            child: Text(
                              listMessage[position].text,
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: listMessage.length,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        //   Container(
        //       padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
        //       alignment: Alignment.bottomCenter,
        //       decoration: BoxDecoration(
        //         color: Theme.of(context).scaffoldBackgroundColor
        //       ),
        //       child: SafeArea(
        //           child: Row(
        //             children: [
        //                 Expanded(
        //                     child: Container(
        //                       padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        //                       decoration: BoxDecoration(
        //                         color: kPrimaryColor.withOpacity(0.05),
        //                         borderRadius: BorderRadius.circular(40)
        //                       ),
        //                       child: Row(
        //                         children: [
        //                           Expanded(
        //                               child: TextField(
        //                                 decoration: InputDecoration(
        //                                     hintText: "Type message",
        //                                   border: InputBorder.none
        //                                 ),
        //                               )
        //                           ),
        //                           FlatButton(
        //                             onPressed: () {
        //                               ApiServices().createMessage(this.message);
        //                             },
        //                             child: Icon(
        //                               Icons.send,
        //                               color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.65),
        //                             ),
        //
        //                           )
        //                         ],
        //                       ),
        //                     )
        //                 )
        //       ],
        //     ),
        //   ),
        // )
        ],
      )
      );
  }
}
// class MessageBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // chat visible
//         // ChatMain(),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//               child: ListView.builder(
//                   itemCount: demeChatMessages.length,
//                   itemBuilder: (context, index) => ChatMain(message: demeChatMessages[index],))
//           )
//         ),
//         // type message
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
//           decoration: BoxDecoration(
//             color: Theme.of(context).scaffoldBackgroundColor
//           ),
//           child: SafeArea(
//             child: Row(
//               children: [
//                 Expanded(
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                       decoration: BoxDecoration(
//                         color: kPrimaryColor.withOpacity(0.05),
//                         borderRadius: BorderRadius.circular(40)
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(
//                               child: TextField(
//                                 decoration: InputDecoration(
//                                     hintText: "Type message",
//                                   border: InputBorder.none
//                                 ),
//                               )
//                           ),
//                           Icon(
//                             Icons.send,
//                             color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.65),
//                           )
//                         ],
//                       ),
//                     )
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
//
// class ChatMain extends StatelessWidget {
//   const ChatMain({
//     Key key,
//     @required this.message
//   }) : super(key: key);
//
//   final ChatMessage message;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding (
//       padding: const EdgeInsets.only(top: kDefaultPadding),
//         child: Row(
//           mainAxisAlignment: message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
//           children: [
//             if(!message.isSender) ...[
//               CircleAvatar(
//                 radius: 12,
//                 backgroundImage: AssetImage("assets/images/user.png"),
//               ),
//               SizedBox(width: kDefaultPadding / 2),
//             ],
//             Container(
//               padding: EdgeInsets.symmetric(
//                   horizontal: kDefaultPadding * 0.75,
//                   vertical: kDefaultPadding / 2
//               ),
//               decoration: BoxDecoration(
//                   color: message.isSender ? kPrimaryColor : kSecondaryColor,
//                   borderRadius: BorderRadius.circular((30))
//               ),
//               child: Text(
//                 message.text,
//                 style: TextStyle(color: Colors.black),
//               ),
//             )
//           ],
//         )
//     );
//   }
// }

