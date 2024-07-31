import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

abstract class Locality {
  final String name;

  const Locality(this.name);
}

enum AnimeGenresList implements Locality {
  romance("Романтика"),
  adventures("Приключения"),
  fantastic("Фантастика"),
  comedy("Комедия"),
  school("Школа"),
  melodrama("Мелодрама"),
  detect("Детектив"),
  tril("Триллер"),
  scare("Ужасы"),
  fantasy("Фэнтези"),
  combatMovie("Боевик"),
  action("Экшен"),
  sen("Сёнен"),
  supPower("Супер сила"),
  dram("Драма"),
  dzen("Дзёсей"),
  vamp("Вампиры");

  const AnimeGenresList(this.name);

  @override
  final String name;
}
