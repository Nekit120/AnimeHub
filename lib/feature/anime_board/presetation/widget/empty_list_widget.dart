import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../theme/theme_colors.dart';

class EmptyListWidget extends StatelessWidget {
  final IconData iconData;
  final String titleEmptyList ;
  final String descriptionEmptyList ;
  const EmptyListWidget({super.key,
    required this.iconData, required this.titleEmptyList, required this.descriptionEmptyList
  });

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
               SizedBox(
                  width: 120.0,
                  height: 120.0,
                  child: Icon(iconData,
                      color: LightThemeColors.mdThemeLightSecondaryTwoContainer,
                      size: 120)),
              const SizedBox(height: 16),
              Text(titleEmptyList,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              Text(descriptionEmptyList,
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
