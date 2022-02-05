import 'package:code_management/app/core/database/my_db.dart';
import 'package:code_management/app/core/model/movie_with_fav.dart';
import 'package:code_management/app/core/utils/movie_type.dart';
import 'package:code_management/app/modules/home/datasources/local/entities/favorites.dart';
import 'package:code_management/app/modules/home/datasources/local/entities/movies.dart';
import 'package:drift/drift.dart';

part 'movie_dao.g.dart';

@DriftAccessor(tables: [Movies, Favorites])
class MoviesDao extends DatabaseAccessor<Database> with _$MoviesDaoMixin {
  MoviesDao(Database db) : super(db);

  Future<void> insertAll(List<Movie> _movies) async {
    await (delete(movies)
          ..where((tbl) => tbl.type.equals(_movies.last.type))
          ..where((tbl) => tbl.page.equals(_movies.last.page)))
        .go();
    batch((batch) => batch.insertAll(movies, _movies));
  }

  Future<void> setFavorite(Favorite _favorite) async {
    into(favorites).insert(_favorite, mode: InsertMode.insertOrReplace);
  }

  Future<List<MovieWithFavorite>> getAllMovies(MovieType type,
      {int page = 1}) async {
    final mvs = await (select(movies)
          ..where(
            (tbl) => tbl.type.equals(type.name),
          )
          ..where(
            (tbl) => tbl.page.isSmallerOrEqualValue(page),
          ))
        .join([
      leftOuterJoin(favorites, favorites.movieId.equalsExp(movies.id)),
    ]).get();
    return mvs
        .map(
          (e) => MovieWithFavorite(
            favorite: e.readTableOrNull(favorites),
            movie: e.readTable(movies),
          ),
        )
        .toList();
  }
}
