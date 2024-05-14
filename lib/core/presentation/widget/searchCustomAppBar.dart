import 'package:flutter/material.dart';

class SearchCustomAppBar extends AppBar {
  final String titleAppBar;
  final BuildContext context;
  final VoidCallback onPressesCallBack;

  @override
  final Widget? leading;

  SearchCustomAppBar(
      {super.key,
      required this.titleAppBar,
      required this.context,
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
          title: Text(titleAppBar, style: Theme.of(context).textTheme.titleLarge),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.settings,
                ),
                onPressed: () {onPressesCallBack();}),
          ],
        );
}
