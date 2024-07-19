import 'package:anime_hub/core/data/firebase_services/model/message_model.dart';
import 'package:anime_hub/core/data/firebase_services/model/user_model_with_last_message.dart';
import 'package:anime_hub/theme/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String email;
  final String? photoUrl;
  final UserModelWithLastMessage? lastMessageModel;
  final void Function()? onTap;

  const UserTile(
      {super.key,
      required this.email,
      required this.photoUrl,
      required this.onTap,
      required this.lastMessageModel});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return  InkWell(
          onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
                margin: const EdgeInsets.symmetric(vertical: 1.5,),
                decoration: BoxDecoration(
                    // color: LightThemeColors.lightBlue,
                    borderRadius: BorderRadius.circular(34)),
                child:
                    // ListTile(
                    //   title: Text(email),
                    //   subtitle: Text( lastMessageModel!.lastMessage!.isEmpty ? "-" : lastMessageModel!.lastMessage!) ,
                    //   leading: photoUrl == null
                    //       ?
                    Row( children: [
                      photoUrl == null
                          ? Padding(
                          padding:const EdgeInsets.only(top: 4,bottom: 4),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: SizedBox(
                                  height: 56,
                                  width: 56,
                                  child: Image.network(
                                    "https://w7.pngwing.com/pngs/455/105/png-transparent-anonymity-computer-icons-anonymous-user-anonymous-purple-violet-logo.png",
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          )
                          : Padding(
                        padding:const EdgeInsets.only(top: 4,bottom: 4),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: SizedBox(
                                  height: 56,
                                  width: 56,
                                  child: Image.network(
                                    photoUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                      const SizedBox(width: 10,),
                   SizedBox(
                          child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const SizedBox(height: 2,),
                             Row(
                               children: [
                                 Text(email,style: Theme.of(context).textTheme.displaySmall),
                               ],

                             ),
                             SizedBox(
                               width: screenWidth- screenWidth*0.3,
                               child: Text( lastMessageModel!.lastMessage!.isEmpty ? "-" : lastMessageModel!.lastMessage!,style: Theme.of(context).textTheme.titleSmall!.apply(
                                 color: Colors.grey[600]
                               ),maxLines: 1,),
                             ),

                           ],
                            ),
                      )
                                    ],
                                  ),


                // ),

                //   child:  Row(
                //     children: [
                //       const Icon(Icons.person),
                //       Text(email)
                //     ],
                //   ),
                // ),
        ),
      )
    );
  }
}
