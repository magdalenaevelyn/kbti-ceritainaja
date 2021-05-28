import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/apiservices.dart';
import 'package:kbti_ceritainaja/constant.dart';
import 'package:kbti_ceritainaja/counselor/inputComment.dart';
import 'package:kbti_ceritainaja/models/Comment.dart';

class CounselorDetail extends StatefulWidget {
  CounselorDetail({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CounselorDetailState createState() => _CounselorDetailState();
}
class _CounselorDetailState extends State<CounselorDetail>{
  List<Comment> listComment = new List();
  var refreshkey = GlobalKey<RefreshIndicatorState>();

  Future<Null> refreshlist() async {
    await Future.delayed(Duration(seconds: 2)); //wait here for 2 second
    setState(() {
      ApiServices().getComment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.add_comment),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => InputComment(title: "Add Comment",)));
              }
          )
        ],
      ),
      body: RefreshIndicator(
          onRefresh: refreshlist,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: <Widget>[
                      Text(
                        "Willy Bross",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),
                      ),
                      SizedBox(height: 5,),
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/boy1.jpg"),
                        radius: 80,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Counselor at ABC Company",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Container(
                      child: FutureBuilder<List<dynamic>> (
                        future: ApiServices().getComment(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                "Something wrong with message: ${snapshot.error.toString()}"
                              ),
                            );
                          } else if (snapshot.connectionState == ConnectionState.done) {
                            listComment = snapshot.data;

                            return ListView.builder(
                                itemBuilder: (context, position) {
                                  return Padding(
                                    padding: EdgeInsets.all(1.0),
                                    child: Column(
                                      children: [
                                        // Container(

                                          Card(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                ListTile(
                                                    title: Text(listComment[position].name),
                                                    subtitle: Text(listComment[position].comment),
                                                    trailing: Icon(Icons.menu),
                                                  onTap: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (_) => AlertDialog(
                                                            content: Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: <Widget>[
                                                                FlatButton(
                                                                    onPressed: () async {
                                                                      ApiServices().deleteComment(listComment[position].idComment.toString());
                                                                      Navigator.pop(context);
                                                                      setState(() {

                                                                      });
                                                                    },
                                                                    child: Text("Delete")
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                      );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        // )
                                      ],
                                    ),
                                  );
                                },
                              itemCount: listComment.length,
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 50)
                ],
              ),
            ),
          )
      ),
    );
  }
}