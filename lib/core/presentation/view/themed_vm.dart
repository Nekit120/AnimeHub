import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:flutter/material.dart';

mixin ThemeProvider on ViewModel {
  ThemeData get theme => Theme.of(context);
}
