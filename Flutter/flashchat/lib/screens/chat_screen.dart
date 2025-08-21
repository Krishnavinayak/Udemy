import 'package:flashchat/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late User loggedinUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String? messageText;
  final messageTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrent();
  }

  void messageStream() async{
    await for( var snapshot in _firestore.collection('message').snapshots()){
      for (var message in snapshot.docs)
      {
        print(message.data());
      }
    }
  }
  void getCurrent(){
    try{
      final user = _auth.currentUser;
      if (user!= null)
      {
        loggedinUser = user;
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
                messageStream();
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder(
             stream: _firestore.collection('message').snapshots(),
             builder: (context, snapshot){
             if (!snapshot.hasData)
             {
              return Center(
                child: CircularProgressIndicator(),
              );
             }
             final messages = snapshot.data!.docs.reversed;
             List <Bubble> messageWidgets = [];
             for ( var message in messages)
             {
              final messageText = message.data()['text'];
              final messageSender = message.data()['sender'];
              final currentUser = loggedinUser.email;
              final messageWidget = Bubble(messageSender: messageSender, messageText: messageText,isMe: currentUser == messageSender);
              messageWidgets.add(messageWidget);
             }
             return Expanded(
               child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                children: messageWidgets,
               ),
             );
            }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('message').add(
                        {
                          'text' : messageText,
                          'sender' : loggedinUser.email
                        }
                      );
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Bubble extends StatelessWidget {
  const Bubble({super.key, this.messageText, this.messageSender, required this.isMe});
  final String? messageText;
  final String? messageSender;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(messageSender.toString(),
          style: TextStyle(
            fontSize: 12,
            color: Colors.black54
          )
          ),
          Material(
            borderRadius: isMe ? BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
            :BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30), topRight: Radius.circular(30)),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                       '$messageText',
                       style: TextStyle(
                        color: isMe ? Colors.white: Colors.black54,
                        fontSize: 15.0
                       ),
                      ),
            )
          ),
        ],
      ),
    );
  }
}