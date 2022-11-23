import 'package:chats/models/chat_model.dart';
import 'package:chats/styles/color_styles.dart';
import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final VoidCallback? onPressed;
  final ChatModel chatModels;

  const PersonCard({
    Key? key,
    this.onPressed,
    required this.chatModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero, primary: Colors.white12),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (chatModels.avatar != null)
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(chatModels.avatar!),
              ),
            if (chatModels.avatar != null) const SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (chatModels.userName != null)
                    Text(
                      chatModels.userName!,
                      style: const TextStyle(
                        color: ColorStyles.primaryTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  if (chatModels.userName != null) const SizedBox(height: 6),
                  if (chatModels.messageText != null)
                    Text(
                      chatModels.messageText!,
                      style: TextStyle(
                        color: ColorStyles.primaryTextColor.withOpacity(0.5),
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
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
