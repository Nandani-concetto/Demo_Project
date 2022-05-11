// import 'package:demo_project/socket_demo/presentation/view/firebase/messaging.dart';
import 'package:demo_project/socket_demo/presentation/view/models/messages_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class Chat extends StatefulWidget {
  final String? user;

  const Chat({Key? key, this.user}) : super(key: key);

  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  late TextEditingController _messageController;
  late ScrollController _controller;
  late IO.Socket socket;

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    _messageController.text = '';
    print("Test: $messageText");
    if (messageText != '') {
      var messagePost =  {
        "id":socket.id,
        "chatID": 0,
        "sender":widget.user,
        "receiverChatID": 0,
        "senderChatID": 0,
        "message": messageText, // Message to be sent
        "timestamp": DateTime.now().second,
      };
      socket.emit('send_message', messagePost);
    }
  }

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _controller = ScrollController();
    initSocket();
    WidgetsBinding.instance!.addPostFrameCallback((_) => {
      _controller.animateTo(
        0.0,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      )
    });
  }

  Future<void> initSocket() async {
    print('Connecting to chat service');
    String? registrationToken = "";  //await Messaging.getToken()
    socket = IO.io('http://172.16.0.8:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'query': {
        'userName': widget.user,
        'registrationToken': registrationToken
      }
    });
    socket.connect();
    socket.onConnect((_) {
      print('connected to websocket');
    });
    socket.on('send_message', (message) {
      print("Message:- $message");
      setState(() {
        MessagesModel.messages.add(message);
      });
    });
    // socket.on('send_message', (messages) {
    //   print(messages);
    //   setState(() {
    //     MessagesModel.messages.addAll(messages);
    //   });
    // });
  }

  @override
  void dispose() {
    _messageController.dispose();
    socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.maybeOf(context)!.size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black38,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.60,
              child: Container(
                child: Text(
                  'Chat',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 60,
            width: size.width,
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              reverse: true,
              cacheExtent: 1000,
              itemCount: MessagesModel.messages.length,
              itemBuilder: (BuildContext context, int index) {
                var message = MessagesModel.messages[MessagesModel.messages.length - index - 1];
                return (message['sender'] == widget.user)
                    ? ChatBubble(
                  clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  backGroundColor: Colors.yellow[100],
                  child: Container(
                    constraints: BoxConstraints(maxWidth: size.width * 0.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Me', style: TextStyle(color: Colors.grey, fontSize: 10)),
                        //Text('Me@${message['time']}', style: TextStyle(color: Colors.grey, fontSize: 10)),
                        Text('${message['message']}', style: TextStyle(color: Colors.black, fontSize: 16))
                      ],
                    ),
                  ),
                )
                    : ChatBubble(
                  clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  backGroundColor: Colors.grey[100],
                  child: Container(
                    constraints: BoxConstraints(maxWidth: size.width * 0.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${message['sender']}  ', style: TextStyle(color: Colors.grey, fontSize: 10)),
                        //Text('${message['sender']} @${message['time']}', style: TextStyle(color: Colors.grey, fontSize: 10)),
                        Text('${message['message']}', style: TextStyle(color: Colors.black, fontSize: 16))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 60,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.80,
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: TextField(
                      controller: _messageController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Message",
                        labelStyle: TextStyle(fontSize: 15, color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        counterText: '',
                      ),
                      style: TextStyle(fontSize: 15),
                      keyboardType: TextInputType.text,
                      maxLength: 500,
                    ),
                  ),
                  Container(
                    width: size.width * 0.20,
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.black38),
                      onPressed: () {
                        _sendMessage();
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}