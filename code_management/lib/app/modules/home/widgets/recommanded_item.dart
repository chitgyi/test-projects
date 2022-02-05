import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_management/app/core/model/movie_with_fav.dart';
import 'package:flutter/material.dart';
import 'package:code_management/app/core/utils/extensions/string_extension.dart';

class RecommandedItem extends StatelessWidget {
  const RecommandedItem({
    Key? key,
    required this.movieWithCategory,
    this.onTapFav,
    this.onTap,
  }) : super(key: key);

  final MovieWithFavorite movieWithCategory;
  final VoidCallback? onTapFav;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: movieWithCategory.movie.posterPath.toUrl,
                      height: 180,
                      width: 150,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) => Container(
                        height: 150,
                        width: 250,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: GestureDetector(
                      onTap: onTapFav,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Icon(
                          movieWithCategory.favorite?.isFavorite ?? false
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                movieWithCategory.movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
