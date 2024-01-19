import 'package:bookme/constants/constants.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({super.key});

  @override
  State<SingleChatScreen> createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  List<String> _messages = [];
  TextEditingController _messageController = TextEditingController();

  void _sendMessage(String message) {
    setState(() {
      _messages.add(message);
    });
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppbarBg,
        iconTheme: IconThemeData(color: kAppbarText),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
            ),
            SizedBox(width: 10),
            TextWidget(
              text: "Sylvan Strosin",
              color: kAppbarText,
              size: 14.0,
              weight: FontWeight.w400,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.more_vert_outlined,
              color: kAppbarText,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Container(
                  child: MessageBubble(
                    message: _messages[index],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kTextfieldBg,
                      hintText: 'Type your message...',
                      hintStyle: GoogleFonts.workSans(
                        color: kTextfieldPText,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                      //Borders of textfield
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: kTextfieldBorder,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: kTextfieldBorder,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: kTextfieldBorder,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 19),
                Container(
                  decoration: ShapeDecoration(
                    color: kAppbarBg,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: kAppbarText,
                        size: 20,
                      ),
                      onPressed: () {
                        if (_messageController.text.trim().isNotEmpty) {
                          _sendMessage(_messageController.text);
                        }
                      },
                    ),
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

class MessageBubble extends StatelessWidget {
  final String message;

  MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: kAppbarBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: message,
              color: kAppbarText,
              size: 14.0,
              weight: FontWeight.w400,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextWidget(
                text:
                    "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}",
                color: kAppbarText,
                size: 10.0,
                weight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
