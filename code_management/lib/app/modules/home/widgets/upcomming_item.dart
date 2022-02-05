import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_management/app/core/model/movie_with_fav.dart';
import 'package:code_management/app/core/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';

class UpcommingItem extends StatelessWidget {
  const UpcommingItem({
    Key? key,
    required this.movieWithCategory,
    this.onTap,
    this.onTapFav,
  }) : super(key: key);

  final MovieWithFavorite movieWithCategory;
  final VoidCallback? onTapFav;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: movieWithCategory.movie.posterPath.toUrl,
                    height: 120,
                    width: 130,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => Container(
                      height: 120,
                      width: 130,
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
            const SizedBox(width: 10.0),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieWithCategory.movie.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  movieWithCategory.movie.overview,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
