import 'package:code_management/app/core/database/my_db.dart';

class MovieWithFavorite {
  final Movie movie;
  Favorite? favorite;

  MovieWithFavorite({required this.movie, required this.favorite});
}
