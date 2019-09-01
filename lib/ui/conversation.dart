import 'package:flutter/material.dart';
import 'package:flutter_app/util/data.dart';
import 'dart:math';

import 'package:flutter_app/widgets/chat_bubble.dart';



class Conversation extends StatefulWidget {
  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  static Random random = Random();
  String name = names[random.nextInt(10)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: InkWell(
          child: Row(

            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0.0, right: 10.0),
                child:
                /*
                Icon(
                  Icons.account_circle,
                  color: Colors.black45,
                  size: 40.0,
                ),

                 */

                CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/cm${random.nextInt(10)}.jpeg",
                  ),
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Online",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: Colors.black,

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          onTap: (){},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black45,
            ),
            onPressed: (){},
          ),
        ],
      ),


      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: conversation.length,
                reverse: true,
                itemBuilder: (BuildContext context, int index) {
                  Map msg = conversation[index];
                  return ChatBubble(
                    message: msg['type'] == "text"
                        ?messages[random.nextInt(10)]
                        :"assets/cm${random.nextInt(10)}.jpeg",
                    username: msg["username"],
                    time: msg["time"],
                    type: msg['type'],
                    replyText: msg["replyText"],
                    isMe: msg['isMe'],
                    isGroup: msg['isGroup'],
                    isReply: msg['isReply'],
                    replyName: name,
                  );
                },
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
//                height: 140,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[500],
                      offset: Offset(0.0, 1.5),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                constraints: BoxConstraints(
                  maxHeight: 190,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        color: Colors.white,
                        child: ListTile(
                          leading: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            onPressed: (){},
                          ),

                          contentPadding: EdgeInsets.all(0),
                          title: TextField(
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Theme.of(context).textTheme.title.color,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(color: Colors.white,),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white,),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              hintText: "Write your message...",
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: Theme.of(context).textTheme.title.color,
                              ),
                            ),
                            maxLines: null,
                          ),


                          trailing: IconButton(
                            icon: Icon(
                              Icons.mic,
                              color: Colors.black,
                            ),
                            onPressed: (){},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),

    );
  }
}
