import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/apiservices.dart';
import 'package:kbti_ceritainaja/constant.dart';
import 'package:kbti_ceritainaja/models/ChatMessage.dart';

class MessageForm extends StatefulWidget {
  MessageForm({Key key}) : super(key: key);

  @override
  _MessageFormState createState() => _MessageFormState();
}
class _MessageFormState extends State<MessageForm>{
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  String _message;
  final _textController = TextEditingController();

  List<Message> listMessage;
  Message message = new Message();

  void onPressed() {
    print(_message);
    _message = '';
    _textController.clear();

    // if text form field is empty, it will not send any words
    setState(() {});
  }

  void initState() {
    super.initState();

  }

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container(
            child: FutureBuilder<List<dynamic>>(
              future: ApiServices().getMessage(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.hasError) {
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
                        padding: const EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
                        child: Row(
                          mainAxisAlignment: listMessage[position].isSender == "1" ? MainAxisAlignment.end : MainAxisAlignment.start,
                          children: [
                            if(listMessage[position].isSender == "0") ... [
                              CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage("assets/images/user.png"),
                              ),
                              SizedBox(width: 5,)
                            ],
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2),
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
                    // child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 3, 0, 3),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.5),
            ),
            child: Form(
              key: _formState,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(
                          hintText: "type a message",
                          border: InputBorder.none,
                      ),
                      minLines: 1,
                      maxLines: 10,
                      onChanged: (value) {
                        setState(() {
                          _message = value;
                        });
                        },
                      onSaved: (String value) {
                        this.message.text = value;
                        // this.message.text = "test";
                      },
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      _formState.currentState.save();
                      _message == null || _message.isEmpty
                          ? null
                          : ApiServices().createMessage(this.message);
                            _message = '';
                            _textController.clear();
                            setState(() {
                              ApiServices().getMessage();
                            });
                      // : print(_message);
                      // print(this.message);
                    },
                    // onPressed: _message == null || _message.isEmpty ? null : onPressed, // disable button send if not typing message
                    child: Icon(
                      Icons.send,
                      color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.65),
                    ),
                  )
                ],
              ),

            ),
          )
        ],
      )
    );
  }
}
