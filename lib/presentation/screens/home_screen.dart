import 'package:auto_route/auto_route.dart';
import 'package:chats/app_router.gr.dart';
import 'package:chats/models/chat_model.dart';
import 'package:chats/presentation/widgets/person_card.dart';
import 'package:chats/styles/color_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  final List<ChatModel> chatModels;
  final ChatModel sourceChat;

  const HomeScreen({
    Key? key,
    required this.chatModels,
    required this.sourceChat,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorStyles.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorStyles.backgroundColor,
          elevation: 1,
          title: const Text('Chat'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            PopupMenuButton<String>(
              color: ColorStyles.elementsColor,
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: "Change account",
                    child: const Text("Change account"),
                    onTap: () {
                      AutoRouter.of(context).root.replace(const ChooseRolesScreenRoute());
                    },
                  ),
                ];
              },
            )
          ],
        ),
        body: ListView.separated(
          itemCount: widget.chatModels.length,
          itemBuilder: (context, index) => PersonCard(
            chatModels: widget.chatModels[index],
            onPressed: () {
              AutoRouter.of(context).root.push(
                    IndividualChatPageRoute(
                      chatModel: widget.chatModels[index],
                      sourceChat: widget.sourceChat,
                    ),
                  );
            },
          ),
          separatorBuilder: (context, index) => Container(
            width: double.maxFinite,
            height: 0.5,
            color: Colors.white12,
          ),
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
