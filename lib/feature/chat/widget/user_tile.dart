import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String email;
  final void Function()? onTap;
  const UserTile({super.key, required this.email, this.onTap});

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(24)
          ),
          child: ListTile(
            title: Text(email),
            // subtitle:const Text("secret") ,
            leading: const Icon(Icons.person) ,
          ),

          //   child:  Row(
          //     children: [
          //       const Icon(Icons.person),
          //       Text(email)
          //     ],
          //   ),
        ),
      );
  }
}
