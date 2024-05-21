import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: CupertinoColors.inactiveGray,
            borderRadius: BorderRadius.circular(12)
          ),
            child: const Row(
              children: [
                Icon(Icons.person),
                Text("text")
              ],
            ),
        ),
      );
  }
}
