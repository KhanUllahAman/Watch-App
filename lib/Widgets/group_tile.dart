// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:insomnia_app/Screens/Doctor/components/user_chat.dart';

import '../Constants/app_styles.dart';
import '../Screens/Admin/chat_page.dart';
import 'navigation.dart';

class GroupTile extends StatefulWidget {
  final String userName;
  final String groupId;
  final String groupName;
  final bool isAdmin;
  const GroupTile({
    Key? key,
    required this.groupId,
    required this.groupName,
    required this.userName,
    required this.isAdmin,
  }) : super(key: key);

  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.isAdmin
            ? nextScreen(
                context,
                ChatPage(
                  groupId: widget.groupId,
                  groupName: widget.groupName,
                  userName: widget.userName,
                ))
            : nextScreen(
                context,
                UserChat(
                  groupId: widget.groupId,
                  groupName: widget.groupName,
                  userName: widget.userName,
                ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: AppStyles.primaryColor,
            child: Text(
              widget.groupName.substring(0, 1).toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          title: Text(
            widget.groupName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Join the conversation as ${widget.userName}",
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ),
    );
  }
}
