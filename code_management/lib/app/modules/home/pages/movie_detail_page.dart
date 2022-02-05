import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_management/app/core/model/movie_with_fav.dart';
import 'package:code_management/app/modules/home/view_models/movie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:code_management/app/core/utils/extensions/string_extension.dart';
import 'package:code_management/app/core/utils/extensions/date_string_extension.dart';
import 'package:get/get.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage(this.movieWithFavorite, {Key? key}) : super(key: key);
  final MovieWithFavorite movieWithFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: movieWithFavorite.movie.posterPath.toUrl,
                      height: MediaQuery.of(context).size.height * 0.43,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top,
                    right: 16.0,
                    child: FavIcon(movieWithFavorite: movieWithFavorite),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top,
                    left: 16.0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () => Get.back(),
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movieWithFavorite.movie.title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            movieWithFavorite.movie.releaseDate.toDDMYYYY,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      movieWithFavorite.movie.voteAverage.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                const SizedBox(height: 14.0),
                Text(movieWithFavorite.movie.overview),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavIcon extends StatefulWidget {
  const FavIcon({
    Key? key,
    required this.movieWithFavorite,
  }) : super(key: key);

  final MovieWithFavorite movieWithFavorite;

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  bool _isFav = false;

  @override
  void initState() {
    _isFav = widget.movieWithFavorite.favorite?.isFavorite ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFav = !_isFav;
        });
        Get.find<MoiveViewModel>().onTapFav(widget.movieWithFavorite);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueAccent,
        ),
        child: Icon(
          _isFav ? Icons.favorite : Icons.favorite_border,
          color: Colors.white,
        ),
      ),
    );
  }
}
