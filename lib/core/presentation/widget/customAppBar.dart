import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final String titleAppBar;
  final BuildContext context;
  final bool filter;
  final VoidCallback onPressesCallBack;

  @override
  final Widget? leading;

  CustomAppBar(
      {super.key,
      required this.titleAppBar,
      required this.context,
      required this.filter,
      required this.onPressesCallBack,
      this.leading})
      : super(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: leading ??
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_outlined)),
          title:
              Text(titleAppBar, style: Theme.of(context).textTheme.titleLarge),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: () {
                  onPressesCallBack();
                }),
            filter ==true ?
            IconButton(
                icon: const Icon(
                  Icons.menu,
                ),
                onPressed: () {})
                : Container()
          ],
        );
}
