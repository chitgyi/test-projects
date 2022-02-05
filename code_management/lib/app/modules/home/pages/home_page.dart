import 'package:code_management/app/modules/home/pages/movie_detail_page.dart';
import 'package:code_management/app/modules/home/widgets/recommanded_item.dart';
import 'package:code_management/app/modules/home/widgets/upcomming_item.dart';
import 'package:flutter/material.dart';
import 'package:code_management/app/core/widgets/custom_builder.dart';
import 'package:code_management/app/modules/home/view_models/movie_view_model.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: CustomBuilder<MoiveViewModel>(
        onError: (vieModel) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(vieModel.errorMessage ?? 'An error occurred'),
              TextButton(
                child: const Text('Tap to Retry'),
                onPressed: vieModel.loadMovies,
              ),
            ],
          ),
        ),
        onSuccess: (viewModel) => RefreshIndicator(
          onRefresh: () async => viewModel.loadMovies(),
          child: ListView(
            controller: viewModel.upcomingController,
            children: [
              viewModel.popularMovies.isEmpty
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Recommanded",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
              viewModel.popularMovies.isEmpty
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: 230,
                      child: ListView.builder(
                        controller: viewModel.popularController,
                        itemCount: viewModel.popularMovies.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final movie = viewModel.popularMovies[index];
                          return RecommandedItem(
                            onTap: () async {
                              await Get.to(() => MovieDetailPage(movie));
                              viewModel.reloadPourlarMovies();
                            },
                            movieWithCategory: movie,
                            onTapFav: () => viewModel.onTapFav(movie),
                          );
                        },
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Upcoming Movies",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: viewModel.upcommingMovies.length,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index) {
                  final movie = viewModel.upcommingMovies[index];
                  return UpcommingItem(
                    onTap: () async {
                      await Get.to(() => MovieDetailPage(movie));
                      viewModel.reloadUpcommingMovies();
                    },
                    movieWithCategory: movie,
                    onTapFav: () => viewModel.onTapFav(movie),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
