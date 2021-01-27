import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/MessageModel.dart';
import 'package:task_app/models/ProjectModel.dart';
import 'package:task_app/provider/ChatProvider.dart';
import 'package:task_app/provider/GlobalProvider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key key, this.projectModel}) : super(key: key);
  final Project projectModel;

  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
        ),
        body: ChangeNotifierProvider(
          create: (context) => ChatProvider(
              name: globalProvider.data.user.username,
              projectId: projectModel.id),
          builder: (context, child) => ChatBuild(),
        ));
  }
}

class ChatBuild extends StatelessWidget {
  const ChatBuild({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    return Center(
        child: Column(
      children: [
        Expanded(
          // height: 200,
          child: ListView.builder(
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                Message message = chatProvider.messages[index];
                return MessageWidget(
                  mensaje: message,
                );
              }),
        ),
        Container(
            color: Colors.white,
            child: TextField(
              controller: chatProvider.textEditingController,
              decoration: InputDecoration(
                hintText: "Escribe tu mensaje",
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () => chatProvider.sendMessage()),
                ),
              ),
            ))
      ],
    ));
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key key,
    this.mensaje,
  }) : super(key: key);
  final Message mensaje;

  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);
    bool isMine = globalProvider.data.user.username == mensaje.user;
    return Column(
      children: [
        Row(
          children: [
            isMine ? Spacer() : Container(),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: isMine
                          ? Color.fromRGBO(96, 195, 255, 1)
                          : Color.fromRGBO(85, 12, 98, 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    mensaje.message,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isMine ? Spacer() : Container(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(mensaje.user),
            ),
          ],
        ),
      ],
    );
  }
}
