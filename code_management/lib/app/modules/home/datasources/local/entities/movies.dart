import 'package:drift/drift.dart';

class Movies extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get overview => text()();
  @JsonKey('release_date')
  TextColumn get releaseDate => text()();
  @JsonKey('poster_path')
  TextColumn get posterPath => text()();
  @JsonKey('backdrop_path')
  TextColumn get backdropPath => text()();
  @JsonKey('vote_average')
  RealColumn get voteAverage => real()();
  @JsonKey('vote_count')
  IntColumn get vouteCount => integer()();
  RealColumn get popularity => real()();
  IntColumn get page => integer()();
  TextColumn get type => text().nullable()();
}
