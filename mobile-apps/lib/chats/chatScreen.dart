import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/chats/chatsCard.dart';
import 'package:kbti_ceritainaja/chats/message.dart';
import 'package:kbti_ceritainaja/models/Chat.dart ';
import 'package:kbti_ceritainaja/counselor/counselorList.dart';
import 'package:kbti_ceritainaja/payment/paymentList.dart';
import 'package:kbti_ceritainaja/schedule/scheduleList.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Magdalena Evelyn Halim"),
              accountEmail: Text("@magdalenaevelyn"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "ME",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Make Appointment"),
              trailing: Icon(Icons.event_note_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScheduleList(title: "Your Schedule",))
                );
              },
            ),
            ListTile(
              title: Text("Payment"),
              trailing: Icon(Icons.money),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentList(title: "Your Bill",))
                );
              },
            ),
            ListTile(
              title: Text("Counselor List"),
              trailing: Icon(Icons.supervisor_account_sharp),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CounselorList(title: "Counselor List",))
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: chatsData.length,
                  itemBuilder: (context, index) => ChatCard(
                    chat: chatsData[index],
                    press: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen()));
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MessageForm()));
                      },
                  )
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.lightBlue[200],
          child: Icon(
            Icons.person_add_alt_1,
            color: Colors.white,
        ),
      ),
    );
  }
}