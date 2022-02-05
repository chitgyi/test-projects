// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Movie extends DataClass implements Insertable<Movie> {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final int vouteCount;
  final double popularity;
  final int page;
  final String? type;
  Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.posterPath,
      required this.backdropPath,
      required this.voteAverage,
      required this.vouteCount,
      required this.popularity,
      required this.page,
      this.type});
  factory Movie.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Movie(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      overview: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}overview'])!,
      releaseDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date'])!,
      posterPath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_path'])!,
      backdropPath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}backdrop_path'])!,
      voteAverage: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average'])!,
      vouteCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}voute_count'])!,
      popularity: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}popularity'])!,
      page: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}page'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['overview'] = Variable<String>(overview);
    map['release_date'] = Variable<String>(releaseDate);
    map['poster_path'] = Variable<String>(posterPath);
    map['backdrop_path'] = Variable<String>(backdropPath);
    map['vote_average'] = Variable<double>(voteAverage);
    map['voute_count'] = Variable<int>(vouteCount);
    map['popularity'] = Variable<double>(popularity);
    map['page'] = Variable<int>(page);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String?>(type);
    }
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      id: Value(id),
      title: Value(title),
      overview: Value(overview),
      releaseDate: Value(releaseDate),
      posterPath: Value(posterPath),
      backdropPath: Value(backdropPath),
      voteAverage: Value(voteAverage),
      vouteCount: Value(vouteCount),
      popularity: Value(popularity),
      page: Value(page),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Movie(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      overview: serializer.fromJson<String>(json['overview']),
      releaseDate: serializer.fromJson<String>(json['release_date']),
      posterPath: serializer.fromJson<String>(json['poster_path']),
      backdropPath: serializer.fromJson<String>(json['backdrop_path']),
      voteAverage: serializer.fromJson<double>(json['vote_average']),
      vouteCount: serializer.fromJson<int>(json['vote_count']),
      popularity: serializer.fromJson<double>(json['popularity']),
      page: serializer.fromJson<int>(json['page']),
      type: serializer.fromJson<String?>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'overview': serializer.toJson<String>(overview),
      'release_date': serializer.toJson<String>(releaseDate),
      'poster_path': serializer.toJson<String>(posterPath),
      'backdrop_path': serializer.toJson<String>(backdropPath),
      'vote_average': serializer.toJson<double>(voteAverage),
      'vote_count': serializer.toJson<int>(vouteCount),
      'popularity': serializer.toJson<double>(popularity),
      'page': serializer.toJson<int>(page),
      'type': serializer.toJson<String?>(type),
    };
  }

  Movie copyWith(
          {int? id,
          String? title,
          String? overview,
          String? releaseDate,
          String? posterPath,
          String? backdropPath,
          double? voteAverage,
          int? vouteCount,
          double? popularity,
          int? page,
          String? type}) =>
      Movie(
        id: id ?? this.id,
        title: title ?? this.title,
        overview: overview ?? this.overview,
        releaseDate: releaseDate ?? this.releaseDate,
        posterPath: posterPath ?? this.posterPath,
        backdropPath: backdropPath ?? this.backdropPath,
        voteAverage: voteAverage ?? this.voteAverage,
        vouteCount: vouteCount ?? this.vouteCount,
        popularity: popularity ?? this.popularity,
        page: page ?? this.page,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('vouteCount: $vouteCount, ')
          ..write('popularity: $popularity, ')
          ..write('page: $page, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, overview, releaseDate, posterPath,
      backdropPath, voteAverage, vouteCount, popularity, page, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movie &&
          other.id == this.id &&
          other.title == this.title &&
          other.overview == this.overview &&
          other.releaseDate == this.releaseDate &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.voteAverage == this.voteAverage &&
          other.vouteCount == this.vouteCount &&
          other.popularity == this.popularity &&
          other.page == this.page &&
          other.type == this.type);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> overview;
  final Value<String> releaseDate;
  final Value<String> posterPath;
  final Value<String> backdropPath;
  final Value<double> voteAverage;
  final Value<int> vouteCount;
  final Value<double> popularity;
  final Value<int> page;
  final Value<String?> type;
  const MoviesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.overview = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.vouteCount = const Value.absent(),
    this.popularity = const Value.absent(),
    this.page = const Value.absent(),
    this.type = const Value.absent(),
  });
  MoviesCompanion.insert({
    required int id,
    required String title,
    required String overview,
    required String releaseDate,
    required String posterPath,
    required String backdropPath,
    required double voteAverage,
    required int vouteCount,
    required double popularity,
    required int page,
    this.type = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        overview = Value(overview),
        releaseDate = Value(releaseDate),
        posterPath = Value(posterPath),
        backdropPath = Value(backdropPath),
        voteAverage = Value(voteAverage),
        vouteCount = Value(vouteCount),
        popularity = Value(popularity),
        page = Value(page);
  static Insertable<Movie> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? overview,
    Expression<String>? releaseDate,
    Expression<String>? posterPath,
    Expression<String>? backdropPath,
    Expression<double>? voteAverage,
    Expression<int>? vouteCount,
    Expression<double>? popularity,
    Expression<int>? page,
    Expression<String?>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (overview != null) 'overview': overview,
      if (releaseDate != null) 'release_date': releaseDate,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (vouteCount != null) 'voute_count': vouteCount,
      if (popularity != null) 'popularity': popularity,
      if (page != null) 'page': page,
      if (type != null) 'type': type,
    });
  }

  MoviesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? overview,
      Value<String>? releaseDate,
      Value<String>? posterPath,
      Value<String>? backdropPath,
      Value<double>? voteAverage,
      Value<int>? vouteCount,
      Value<double>? popularity,
      Value<int>? page,
      Value<String?>? type}) {
    return MoviesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      voteAverage: voteAverage ?? this.voteAverage,
      vouteCount: vouteCount ?? this.vouteCount,
      popularity: popularity ?? this.popularity,
      page: page ?? this.page,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (vouteCount.present) {
      map['voute_count'] = Variable<int>(vouteCount.value);
    }
    if (popularity.present) {
      map['popularity'] = Variable<double>(popularity.value);
    }
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (type.present) {
      map['type'] = Variable<String?>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('vouteCount: $vouteCount, ')
          ..write('popularity: $popularity, ')
          ..write('page: $page, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movie> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MoviesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String?> overview = GeneratedColumn<String?>(
      'overview', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String?> releaseDate = GeneratedColumn<String?>(
      'release_date', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String?> posterPath = GeneratedColumn<String?>(
      'poster_path', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String?> backdropPath = GeneratedColumn<String?>(
      'backdrop_path', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<double?> voteAverage = GeneratedColumn<double?>(
      'vote_average', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _vouteCountMeta = const VerificationMeta('vouteCount');
  @override
  late final GeneratedColumn<int?> vouteCount = GeneratedColumn<int?>(
      'voute_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _popularityMeta = const VerificationMeta('popularity');
  @override
  late final GeneratedColumn<double?> popularity = GeneratedColumn<double?>(
      'popularity', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int?> page = GeneratedColumn<int?>(
      'page', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        overview,
        releaseDate,
        posterPath,
        backdropPath,
        voteAverage,
        vouteCount,
        popularity,
        page,
        type
      ];
  @override
  String get aliasedName => _alias ?? 'movies';
  @override
  String get actualTableName => 'movies';
  @override
  VerificationContext validateIntegrity(Insertable<Movie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (data.containsKey('voute_count')) {
      context.handle(
          _vouteCountMeta,
          vouteCount.isAcceptableOrUnknown(
              data['voute_count']!, _vouteCountMeta));
    } else if (isInserting) {
      context.missing(_vouteCountMeta);
    }
    if (data.containsKey('popularity')) {
      context.handle(
          _popularityMeta,
          popularity.isAcceptableOrUnknown(
              data['popularity']!, _popularityMeta));
    } else if (isInserting) {
      context.missing(_popularityMeta);
    }
    if (data.containsKey('page')) {
      context.handle(
          _pageMeta, page.isAcceptableOrUnknown(data['page']!, _pageMeta));
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Movie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Movie.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(_db, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int? id;
  final int movieId;
  final bool isFavorite;
  Favorite({this.id, required this.movieId, required this.isFavorite});
  factory Favorite.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Favorite(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      movieId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}movie_id'])!,
      isFavorite: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_favorite'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['movie_id'] = Variable<int>(movieId);
    map['is_favorite'] = Variable<bool>(isFavorite);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      movieId: Value(movieId),
      isFavorite: Value(isFavorite),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<int?>(json['id']),
      movieId: serializer.fromJson<int>(json['movieId']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'movieId': serializer.toJson<int>(movieId),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  Favorite copyWith({int? id, int? movieId, bool? isFavorite}) => Favorite(
        id: id ?? this.id,
        movieId: movieId ?? this.movieId,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('movieId: $movieId, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, movieId, isFavorite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.movieId == this.movieId &&
          other.isFavorite == this.isFavorite);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int?> id;
  final Value<int> movieId;
  final Value<bool> isFavorite;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.movieId = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    required int movieId,
    this.isFavorite = const Value.absent(),
  }) : movieId = Value(movieId);
  static Insertable<Favorite> custom({
    Expression<int?>? id,
    Expression<int>? movieId,
    Expression<bool>? isFavorite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (movieId != null) 'movie_id': movieId,
      if (isFavorite != null) 'is_favorite': isFavorite,
    });
  }

  FavoritesCompanion copyWith(
      {Value<int?>? id, Value<int>? movieId, Value<bool>? isFavorite}) {
    return FavoritesCompanion(
      id: id ?? this.id,
      movieId: movieId ?? this.movieId,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('movieId: $movieId, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FavoritesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _movieIdMeta = const VerificationMeta('movieId');
  @override
  late final GeneratedColumn<int?> movieId = GeneratedColumn<int?>(
      'movie_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES movies(id)');
  final VerificationMeta _isFavoriteMeta = const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<bool?> isFavorite = GeneratedColumn<bool?>(
      'is_favorite', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_favorite IN (0, 1))',
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [id, movieId, isFavorite];
  @override
  String get aliasedName => _alias ?? 'favorites';
  @override
  String get actualTableName => 'favorites';
  @override
  VerificationContext validateIntegrity(Insertable<Favorite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id']!, _movieIdMeta));
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Favorite.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MoviesTable movies = $MoviesTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final MoviesDao moviesDao = MoviesDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movies, favorites];
}
