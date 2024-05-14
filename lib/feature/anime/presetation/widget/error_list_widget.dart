import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../theme/theme_colors.dart';

class ErrorListWidget extends StatelessWidget {
  final String titleError ;
  final String descriptionError ;
  const ErrorListWidget({super.key,required this.titleError,required this.descriptionError});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const SizedBox(
                  width: 120.0,
                  height: 120.0,
                  child: Icon(Icons.error,
                      color:
                      LightThemeColors.mdThemeLightError,
                      size: 120)),
              const SizedBox(height: 16),
              Text(titleError,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              Text(descriptionError,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
        ),
      ),
    );
  }
}
