import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/apiservices.dart';
import 'package:kbti_ceritainaja/models/Comment.dart';

class InputComment extends StatefulWidget {
  InputComment({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _InputCommentState createState() => _InputCommentState();
}
class _InputCommentState extends State<InputComment>{
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  Comment comment = new Comment();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Form(
                  key: _formState,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: "Name",
                            hintText: "Ex: Johny Doe",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        onSaved: (String value) {
                          this.comment.name = value;
                        },
                      ),
                      SizedBox(height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.comment),
                            labelText: "Comment",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                        ),
                        onSaved: (String value) {
                          this.comment.comment = value;
                        },
                        maxLines: 5,
                      ),
                      SizedBox(height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.lightBlue[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Add Comment"),
                                content: Text("Do you want to add this comment?"),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () async {
                                        _formState.currentState.save();
                                        setState(() => isLoading = true);
                                        ApiServices().createComment(this.comment).then((isSuccess) {
                                          setState(() => isLoading = false);
                                          if (isSuccess) {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          } else {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }
                                        });
                                        // print(this.comment);
                                      },
                                      child: Text("Yes")
                                  ),
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("No")
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          "Post",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      )
    );
  }
}