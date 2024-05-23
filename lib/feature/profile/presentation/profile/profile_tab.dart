import 'package:anime_hub/core/domain/router/router.gr.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AppBar get _profileAppBar => AppBar(
        title: const Text("Профиль"),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.create_outlined,
              ),
              onPressed: () {
                AutoRouter.of(context).push(EditingProfileRoute());
              }),
        ],
      );

  get _personalProfileBody => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 116,
                height: 116,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                          "https://www.wild-pro.ru/wp-content/uploads/2023/04/no-profile-min.png"),
                ),
              ),
            ),
            Center(
              child: Text("Мануша Никита",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: double.infinity,
              child: Divider(),
            ),
            const SizedBox(height: 16),
            Text("E-mail", style: Theme.of(context).textTheme.labelMedium!),
            Text("g.vasilkov@yandex.ru", style: Theme.of(context).textTheme.bodyLarge!),
            const SizedBox(height: 16),
            Text("Телефон", style: Theme.of(context).textTheme.labelMedium!),
            Text("+373 775 00 205",
                style: Theme.of(context).textTheme.bodyLarge!),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _profileAppBar,
      body: _personalProfileBody,
    );
  }
}
