import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:task_app/models/MessageModel.dart';

class ChatProvider extends ChangeNotifier {
  IO.Socket socket;
  int projectId;
  String username;
  List<Message> _messages = [];

  List<Message> get messages => _messages;
  addMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }

  TextEditingController textEditingController = TextEditingController();

  ChatProvider({@required int projectId, @required String name}) {
    username = name;
    this.projectId = projectId;
    socket = IO.io("https://socketio-chat-h9jt.herokuapp.com",
        IO.OptionBuilder().setTransports(['websocket']).build());
    socket.connect();
    socket.onError((data) => print(data));
    socket.onConnect((data) {
      socket.emit('add user', name);
    });
    socket.on("new message", (data) {
      try {
        final username = data['username'];
        final info = jsonDecode(data['message']);
        Message temp = Message(
            user: username,
            projectId: info['project_id'],
            message: info['message']);
        if (temp.projectId == projectId) {
          addMessage(temp);
        }
      } catch (e) {}
    });
  }

  sendMessage() {
    String message = textEditingController.value.text;
    textEditingController.clear();
    Message temp =
        Message(message: message, projectId: projectId, user: username);
    addMessage(temp);
    socket.emit(
        "new message", '{"project_id":$projectId, "message":"$message"}');
  }
}
