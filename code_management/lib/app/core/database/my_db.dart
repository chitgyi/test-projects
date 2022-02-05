import 'package:code_management/app/modules/home/datasources/local/doas/movie_dao.dart';
import 'package:code_management/app/modules/home/datasources/local/entities/favorites.dart';
import 'package:code_management/app/modules/home/datasources/local/entities/movies.dart';
import 'package:drift/drift.dart';

part 'my_db.g.dart';

@DriftDatabase(tables: [Movies, Favorites], daos: [MoviesDao])
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
    );
  }
}
