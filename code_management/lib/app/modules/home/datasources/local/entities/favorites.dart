import 'package:drift/drift.dart';

class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get movieId =>
      integer().customConstraint('REFERENCES movies(id)')();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(true))();
}
