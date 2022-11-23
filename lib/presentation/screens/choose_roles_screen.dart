import 'package:auto_route/auto_route.dart';
import 'package:chats/app_router.gr.dart';
import 'package:chats/models/chat_model.dart';
import 'package:chats/presentation/widgets/person_card.dart';
import 'package:chats/styles/color_styles.dart';
import 'package:flutter/material.dart';

class ChooseRolesScreen extends StatefulWidget {
  static const String routeName = '/choose-screen';

  const ChooseRolesScreen({Key? key}) : super(key: key);

  @override
  State<ChooseRolesScreen> createState() => _ChooseRolesScreenState();
}

class _ChooseRolesScreenState extends State<ChooseRolesScreen> {
  late ChatModel sourceChat;
  final List<ChatModel> chatModels = [
    ChatModel(
      avatar:
          'https://sites.google.com/site/finesifferb/_/rsrc/1466576938937/personazi-multseriala/27r5rv1s7Ok.jpg?height=320&width=243',
      userName: 'Maxim',
      messageText: 'Hello!',
      id: 1,
    ),
    ChatModel(
      avatar:
          'https://www.seekpng.com/png/small/73-734028_nickelodeon-the-explorer-delta-doras-3d-world-of.png',
      userName: 'Darya',
      messageText: 'Hello!',
      id: 2,
    ),
    ChatModel(
      avatar:
          'https://w7.pngwing.com/pngs/824/1014/png-transparent-ferb-fletcher-phineas-flynn-drawing-phineas-and-ferb-season-3-child-hand-human.png',
      userName: 'Danil',
      messageText: 'Hello!',
      id: 3,
    ),
    ChatModel(
      avatar:
          'https://memax.club/wp-content/uploads/2019/06/milye_kartinki_1_03072146.jpg',
      userName: 'Liza',
      messageText: 'Hello!',
      id: 4,
    ),
  ];

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
          title: const Text('Choose yourself'),
        ),
        body: ListView.builder(
          itemCount: chatModels.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              sourceChat = chatModels.removeAt(index);
              AutoRouter.of(context).root.replace(
                    HomeScreenRoute(
                        chatModels: chatModels, sourceChat: sourceChat),
                  );
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (builder) => HomeScreen(
              //       chatModels: chatModels,
              //       sourceChat: sourceChat,
              //     ),
              //   ),
              // );
            },
            child: PersonCard(
              chatModels: chatModels[index],
            ),
          ),
        ),
      ),
    );
  }
}
