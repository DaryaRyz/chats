import 'package:chats/models/chat_model.dart';
import 'package:chats/models/message_model.dart';
import 'package:chats/presentation/widgets/custom_input.dart';
import 'package:chats/presentation/widgets/own_message_card.dart';
import 'package:chats/presentation/widgets/reply_card.dart';
import 'package:chats/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualChatPage extends StatefulWidget {
  static const String routeName = '/individual-chat';

  final ChatModel chatModel;
  final ChatModel sourceChat;

  const IndividualChatPage({
    Key? key,
    required this.chatModel,
    required this.sourceChat,
  }) : super(key: key);

  @override
  State<IndividualChatPage> createState() => _IndividualChatPageState();
}

class _IndividualChatPageState extends State<IndividualChatPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late IO.Socket _socket;
  bool sendButton = false;
  List<MessageModel> messages = [];

  @override
  void initState() {
    super.initState();
    _connectSocket();
  }

  _connectSocket() {
    _socket = IO.io(
      'https://my-chats-demo.herokuapp.com/',
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );
    _socket.connect();
    _socket.emit("signin", widget.sourceChat.id);
    _socket.onConnect((data) {
      print("Connection established");
      _socket.on("message", (msg) {
        print(msg);
        _setMessage("destination", msg["message"]);
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
    _socket.onConnectError((data) => print('Connect error: $data'));
    _socket.onDisconnect((data) => print('Socket.IO server disconnect'));
  }

  void _sendMessage(String message, int sourceId, int targetId) {
    _setMessage("source", message);
    _socket.emit("message", {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
    });
  }

  void _setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(
      type: type,
      message: message,
      time: DateTime.now().toString().substring(10, 16),
    );
    setState(() {
      setState(() {
        messages.add(messageModel);
      });
    });
  }

  @override
  void dispose() {
    _socket.disconnect();
    _socket.dispose();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorStyles.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorStyles.backgroundColor,
          elevation: 1,
          leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              primary: Colors.white12,
              padding: EdgeInsets.zero,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: ColorStyles.primaryTextColor,
            ),
          ),
          title: Row(
            children: [
              if (widget.chatModel.avatar != null)
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(widget.chatModel.avatar!),
                ),
              if (widget.chatModel.avatar != null) const SizedBox(width: 20),
              if (widget.chatModel.userName != null)
                Text(widget.chatModel.userName!),
            ],
          ),
        ),
        body: Stack(
          children: [
            AnimatedContainer(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/backgroundChatImage.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              duration: const Duration(milliseconds: 2000),
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      if (messages[index].type == "source") {
                        return OwnMessageCard(
                          message: messages[index].message,
                          time: messages[index].time,
                        );
                      } else {
                        return ReplyCard(
                          message: messages[index].message,
                          time: messages[index].time,
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomInput(
                            width: double.maxFinite,
                            hintText: 'Type your massage',
                            controller: _controller,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  sendButton = true;
                                });
                              } else {
                                setState(() {
                                  sendButton = false;
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        sendButton
                            ? Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: ColorStyles.elementsColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if (sendButton) {
                                      _scrollController.animateTo(
                                        _scrollController
                                            .position.maxScrollExtent,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeOut,
                                      );
                                      _sendMessage(
                                        _controller.text,
                                        widget.sourceChat.id,
                                        widget.chatModel.id,
                                      );
                                      _controller.clear();
                                      setState(() {
                                        sendButton = false;
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    primary: Colors.white12,
                                    padding: const EdgeInsets.only(left: 5),
                                  ),
                                  child: const Icon(
                                    Icons.send,
                                    color: ColorStyles.primaryTextColor,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
