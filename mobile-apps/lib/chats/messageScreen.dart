import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/apiservices.dart';
import 'package:kbti_ceritainaja/chats/messageBody.dart';
import 'package:kbti_ceritainaja/constant.dart';
import 'package:kbti_ceritainaja/models/ChatMessage.dart';

class MessageScreen extends StatelessWidget {

  ApiServices apiService;

  List<Message> listMessage;
  Message message = new Message();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/user.png"),
            ),
            SizedBox(width: kDefaultPadding * 0.75),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jenny Wilson",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Active 3m ago",
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
      // body: MessageBody(),
      // body: Column(
      //   children: [
      //     FutureBuilder(
      //       future: ApiServices().getMessage(),
      //       builder: (BuildContext context, AsyncSnapshot<List<Message>> snapshot) {
      //         if (snapshot.hasError){
      //           return Center(
      //             child: Text(
      //                 "Something wrong with message: ${snapshot.error.toString()}"
      //             ),
      //           );
      //         } else if (snapshot.connectionState == ConnectionState.done) {
      //           listMessage = snapshot.data;
      //
      //           return ListView.builder(
      //             scrollDirection: Axis.vertical,
      //             shrinkWrap: true,
      //             itemBuilder: (context, position) {
      //               return Padding(
      //                 padding: const EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
      //                 child: Row(
      //                   mainAxisAlignment: listMessage[position].isSender == "1" ? MainAxisAlignment.end : MainAxisAlignment.start,
      //                   children: [
      //                     if(listMessage[position].isSender == "0") ...[
      //                       CircleAvatar(
      //                         radius: 12,
      //                         backgroundImage: AssetImage("assets/images/user.png"),
      //                       ),
      //                       SizedBox(width: kDefaultPadding / 2)
      //                     ],
      //                     Container(
      //                       padding: EdgeInsets.symmetric(
      //                           horizontal: kDefaultPadding * 0.75,
      //                           vertical: kDefaultPadding / 2
      //                       ),
      //                       decoration: BoxDecoration(
      //                           color: listMessage[position].isSender == "1" ? kPrimaryColor : kSecondaryColor,
      //                           borderRadius: BorderRadius.circular((30))
      //                       ),
      //                       child: Text(
      //                         listMessage[position].text,
      //                         style: TextStyle(color: Colors.black),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               );
      //             },
      //             itemCount: listMessage.length,
      //           );
      //         } else {
      //           return Center(
      //             child: CircularProgressIndicator(),
      //           );
      //         }
      //       },
      //     ),
      //     // Container(
      //     //   padding: const EdgeInsets.only(bottom: kDefaultPadding),
      //     //   decoration: BoxDecoration(
      //     //       color: Theme.of(context).scaffoldBackgroundColor
      //     //   ),
      //     //   // child: SafeArea(
      //     //   //   child: Row(
      //     //   //     children: [
      //     //   //       Expanded(
      //     //   //           child: Container(
      //     //   //             padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      //     //   //             decoration: BoxDecoration(
      //     //   //                 color: kPrimaryColor.withOpacity(0.05),
      //     //   //                 borderRadius: BorderRadius.circular(40)
      //     //   //             ),
      //     //   //             child: Row(
      //     //   //               children: [
      //     //   //                 Expanded(
      //     //   //                     child: TextField(
      //     //   //                       decoration: InputDecoration(
      //     //   //                           hintText: "Type message",
      //     //   //                           border: InputBorder.none
      //     //   //                       ),
      //     //   //                     )
      //     //   //                 ),
      //     //   //                 FlatButton(
      //     //   //                   onPressed: () {
      //     //   //                     ApiServices().createMessage(this.message);
      //     //   //                   },
      //     //   //                   child: Icon(
      //     //   //                     Icons.send,
      //     //   //                     color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.65),
      //     //   //                   ),
      //     //   //
      //     //   //                 )
      //     //   //               ],
      //     //   //             ),
      //     //   //           )
      //     //   //       )
      //     //   //     ],
      //     //   //   ),
      //     //   // ),
      //     //   child: Stack(
      //     //     children: [
      //     //       new Positioned(
      //     //           child: Align(
      //     //             alignment: FractionalOffset.bottomCenter,
      //     //             child: Row(
      //     //                             children: [
      //     //                               Expanded(
      //     //                                   child: TextField(
      //     //                                     decoration: InputDecoration(
      //     //                                         hintText: "Type message",
      //     //                                         border: InputBorder.none
      //     //                                     ),
      //     //                                   )
      //     //                               ),
      //     //                               FlatButton(
      //     //                                 onPressed: () {
      //     //                                   ApiServices().createMessage(this.message);
      //     //                                 },
      //     //                                 child: Icon(
      //     //                                   Icons.send,
      //     //                                   color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.65),
      //     //                                 ),
      //     //
      //     //                               )
      //     //                             ],
      //     //             ),
      //     //           )
      //     //       )
      //     //     ],
      //     //   ),
      //     // )
      //   ],
      // )
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: TextFormField(

                  )
              ),
              MaterialButton(onPressed: null, child: Text("send"),)
            ],
          ),
        ]
      ),
    );
  }
}
