class ChatModel {
  final String? avatar;
  final String? userName;
  final String? messageText;
  final DateTime? time;
  final int id;

  ChatModel({
    this.avatar,
    this.userName,
     this.messageText,
    this.time,
    required this.id,
  });
}
