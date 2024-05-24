import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String email;
  final String? photoUrl;
  final void Function()? onTap;

  const UserTile(
      {super.key, required this.email, required this.photoUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(24)),
        child: ListTile(
          title: Text(email),
          // subtitle:const Text("secret") ,
          leading: photoUrl == null
              ?  ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                height: 36,
                width: 36,
                child: Image.network(
                  "https://www.wild-pro.ru/wp-content/uploads/2023/04/no-profile-min.png",
                  fit: BoxFit.cover,
                ),
              ))
              : ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    height: 36,
                    width: 36,
                    child: Image.network(
                      photoUrl!,
                      fit: BoxFit.cover,
                    ),
                  )),
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
