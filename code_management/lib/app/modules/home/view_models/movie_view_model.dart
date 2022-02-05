import 'package:code_management/app/core/database/my_db.dart';
import 'package:code_management/app/core/exceptions/db_exception.dart';
import 'package:code_management/app/core/exceptions/network_exception.dart';
import 'package:code_management/app/core/model/movie_with_fav.dart';
import 'package:code_management/app/core/utils/movie_type.dart';
import 'package:code_management/app/core/utils/view_model.dart';
import 'package:code_management/app/core/utils/view_state.dart';
import 'package:code_management/app/modules/home/repositories/movie_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoiveViewModel extends ViewModel {
  final MovieRepository _repository;

  MoiveViewModel(this._repository);

  List<MovieWithFavorite> upcommingMovies = [];
  List<MovieWithFavorite> popularMovies = [];

  late ScrollController upcomingController;
  late ScrollController popularController;

  int upcommingPage = 1;
  int popularPage = 1;

  String? _errorMessage;
  @override
  String? get errorMessage => _errorMessage;

  @override
  void onInit() {
    upcomingController = ScrollController();
    popularController = ScrollController();
    _listenOnScrollEnd();
    loadMovies();
    super.onInit();
  }

  @override
  void onClose() {
    upcomingController.dispose();
    popularController.dispose();
    super.onClose();
  }

  void onTapFav(MovieWithFavorite movieWithFav) {
    _repository.setFavoriteMovie(
      Favorite(
        id: movieWithFav.movie.id,
        movieId: movieWithFav.movie.id,
        isFavorite: !(movieWithFav.favorite?.isFavorite ?? false),
      ),
    );
    if (movieWithFav.movie.type == MovieType.popular.name) {
      _loadLocalPopularMovies();
    } else {
      _loadLocalUpcommingMovies();
    }
    update();
  }

  Future<void> loadMovies() async {
    upcommingPage = 1;
    popularPage = 1;
    _loadLocaleMovies();
    await _loadRemoteMovies();
  }

  Future<void> retry() async {
    _errorMessage = null;
    viewState = ViewState.loading;
    update();
    await loadMovies();
  }

  Future<void> _loadRemoteMovies() async {
    try {
      await _repository.fetchUpcommingMovies(page: upcommingPage);
      await _repository.fetchPopularMovies(page: popularPage);
      _loadLocaleMovies();
    } on NetworkException catch (e) {
      if (e is InternetConnectionException) {
        _showConnectionErrorMessage();
      } else {
        _errorMessage = e.message;
        viewState = ViewState.error;
        update();
      }
    }
  }

  void _loadLocaleMovies() async {
    try {
      await _loadLocalPopularMovies();
      await _loadLocalUpcommingMovies();
      if (upcommingMovies.isEmpty && popularMovies.isEmpty) {
        viewState = ViewState.loading;
      } else {
        viewState = ViewState.completed;
      }
      update();
    } on DatabaseExcetpion catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _loadLocalUpcommingMovies() async {
    try {
      final _upcommingMovies =
          await _repository.getUpcommingMovies(page: upcommingPage);
      upcommingMovies.clear();
      upcommingMovies.addAll(_upcommingMovies);
    } on DatabaseExcetpion catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _loadLocalPopularMovies() async {
    try {
      final _popularMovies =
          await _repository.getPopularMovies(page: popularPage);
      popularMovies.clear();
      popularMovies.addAll(_popularMovies);
    } on DatabaseExcetpion catch (e) {
      debugPrint(e.toString());
    }
  }

  void _loadNextUpcommingMovies() async {
    upcommingPage++;
    debugPrint('upcommingPage: $upcommingPage');
    try {
      await _repository.fetchPopularMovies(page: upcommingPage);
      await _loadLocalUpcommingMovies();
      update();
    } on InternetConnectionException {
      _showConnectionErrorMessage();
    }
  }

  void _loadNextPopularMovies() async {
    popularPage++;
    debugPrint('popularPage: $popularPage');
    try {
      await _repository.fetchPopularMovies(page: popularPage);
      await _loadLocalPopularMovies();
      update();
    } on InternetConnectionException {
      _showConnectionErrorMessage();
    }
  }

  void _showConnectionErrorMessage() {
    if (upcommingMovies.isEmpty && popularMovies.isEmpty) {
      viewState = ViewState.error;
      _errorMessage = 'No internet connection';
    } else {
      viewState = ViewState.completed;
      Get.snackbar(
        'No Internet Connection',
        'Please check your internet connection',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    update();
  }

  void _listenOnScrollEnd() {
    upcomingController.addListener(() {
      if (upcomingController.position.maxScrollExtent ==
          upcomingController.position.pixels) {
        _loadNextUpcommingMovies();
      }
    });
    popularController.addListener(() {
      if (popularController.position.maxScrollExtent ==
          popularController.position.pixels) {
        _loadNextPopularMovies();
      }
    });
  }

  void reloadPourlarMovies() async {
    await _loadLocalPopularMovies();
    update();
  }

  void reloadUpcommingMovies() async {
    await _loadLocalPopularMovies();
    update();
  }
}
