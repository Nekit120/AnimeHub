import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

abstract class Locality {
  final String name;

  const Locality(this.name);
}

enum LocalityList implements Locality {
  romance("Романтика"),
  adventures("Приключения"),
  fantastic("Фантастика"),
  comedy("Комедия"),
  school("Школа"),
  melodrama("Мелодрама"),
  fantasy("Фэнтези"),
  combatMovie("Боевик"),
  action("Экшен"),
  ;

  const LocalityList(this.name);

  @override
  final String name;
}
