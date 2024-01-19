import 'package:bookme/constants/constants.dart';
import 'package:bookme/screens/userviews/singlechat.dart';
import 'package:bookme/widgets/customAppbar.dart';
import 'package:bookme/widgets/searchbar.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: "Conversations",
        leading: false,
        textsize: 18.0,
        textweight: FontWeight.w500,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchbarWidget(
                controller: _searchController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Chats',
                color: primaryText,
                size: 18.0,
                weight: FontWeight.w700,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleChatScreen(),
                    ),
                  )
                },
                child: const ChatTile(
                  imagePath:
                      "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                  username: "Sylvan Strosin",
                  message: "It is a long established fact that...",
                  time: "2:30 PM",
                ),
              ),
              const ChatTile(
                imagePath:
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                username: "Sylvan Strosin",
                message: "It is a long established fact that...",
                time: "2:30 PM",
              ),
              const ChatTile(
                imagePath:
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                username: "Sylvan Strosin",
                message: "It is a long established fact that...",
                time: "2:30 PM",
              ),
              const ChatTile(
                imagePath:
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                username: "Sylvan Strosin",
                message: "It is a long established fact that...",
                time: "2:30 PM",
              ),
              const ChatTile(
                imagePath:
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                username: "Sylvan Strosin",
                message: "It is a long established fact that...",
                time: "2:30 PM",
              ),
              const ChatTile(
                imagePath:
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                username: "Sylvan Strosin",
                message: "It is a long established fact that...",
                time: "2:30 PM",
              ),
              const ChatTile(
                imagePath:
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                username: "Sylvan Strosin",
                message: "It is a long established fact that...",
                time: "2:30 PM",
              ),
              const ChatTile(
                imagePath:
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                username: "Sylvan Strosin",
                message: "It is a long established fact that...",
                time: "2:30 PM",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.imagePath,
    required this.username,
    required this.message,
    required this.time,
  });

  final imagePath;
  final username;
  final time;
  final message;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imagePath),
      ),
      title: TextWidget(
        text: username,
        color: primaryText,
        size: 16.0,
        weight: FontWeight.w500,
      ),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.workSans(
          color: secondaryText,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: TextWidget(
        text: time,
        color: secondaryText,
        size: 12.0,
        weight: FontWeight.w400,
      ),
    );
  }
}
