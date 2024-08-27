import 'package:chattapp/models/mseeage.dart';
import 'package:chattapp/screens/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:chattapp/Components/chat_bubble.dart';
import 'package:chattapp/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key, this.chatPartner});

  final ScrollController _controller = ScrollController();

  static const String id = 'ChatPage';
  final TextEditingController _textController = TextEditingController();
  final String? chatPartner;

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED), // Light gray background
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/scholar.png"),
            ),
            SizedBox(width: 10),
            Text(
              'Scholar Chat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                List<Message1> messagesList =
                    BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    final message = messagesList[index];
                    final isSentByCurrentUser = message.id == email;

                    // Adjust bubble color based on whether the current user sent the message
                    final bubbleColor = isSentByCurrentUser
                        ? Theme.of(context).primaryColor.withOpacity(0.6)
                        : Theme.of(context).primaryColor.withOpacity(0.2);

                    return Align(
                      alignment: isSentByCurrentUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        child: ChatBubble(
                          borderRadius: BorderRadius.only(
                            topLeft: isSentByCurrentUser
                                ? const Radius.circular(16)
                                : const Radius.circular(0),
                            topRight: isSentByCurrentUser
                                ? const Radius.circular(0)
                                : const Radius.circular(16),
                            bottomLeft: const Radius.circular(16),
                            bottomRight: const Radius.circular(16),
                          ),
                          alignment: isSentByCurrentUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          message: message.message,
                          sender: message.id,
                          color1: bubbleColor,
                          // Set this to true for group chat behavior
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    onSubmitted: (data) {
                      if (_textController.text.trim().isEmpty) return;

                      BlocProvider.of<ChatCubit>(context).sendMessage(
                        email: email,
                        messages: _textController.text,
                      );
                      _textController.clear();
                      _controller.animateTo(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                      );
                    },
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        color: kPrimaryColor,
                        onPressed: () {
                          if (_textController.text.trim().isEmpty) return;

                          BlocProvider.of<ChatCubit>(context).sendMessage(
                            email: email,
                            messages: _textController.text,
                          );
                          _textController.clear();
                          _controller.animateTo(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: IconButton(
                    icon: const Icon(Icons.mic),
                    color: Colors.white,
                    onPressed: () {
                      // Handle voice message functionality here
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
