import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_ui/model/category.dart';
import 'package:test_ui/utils/constants/custom_colors.dart';
import 'package:test_ui/utils/constants/icon_paths.dart';
import 'package:test_ui/utils/constants/image_paths.dart';
import 'package:test_ui/utils/custom_shape.dart';
import 'package:test_ui/widgets/custom_tab_bar.dart';
import 'package:test_ui/widgets/rate_item.dart';
import 'package:test_ui/widgets/room_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final List<String> tabItems = ["By Room", "By Rates"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        children: [
          const _ToolBar(),
          const _TitleInfo(),
          const SizedBox(height: 16.0),
          const _ImageSlider(),
          const SizedBox(height: 16.0),
          const SizedBox(height: 120, child: _CategoryList()),
          CustomTabBar(
            tabItems,
            selectedIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          selectedIndex == 0
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const RoomItem(),
                  separatorBuilder: (context, index) => const Divider(
                      indent: 16.0, endIndent: 16.0, thickness: 2),
                  itemCount: 10,
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: RateItem(
                      hasVoucher: index / 2 == 0,
                    ),
                  ),
                  itemCount: 10,
                )
        ],
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(
              categories[index].image,
              width: 55,
              height: 55,
            ),
            Text(categories[index].name),
          ],
        ),
      ),
    );
  }
}

class _TitleInfo extends StatelessWidget {
  const _TitleInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              const SizedBox(width: 8.0),
              Expanded(
                child: Text("Rurama Riverfont, Singapore",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
              Image.asset(IconPaths.next, width: 35.0, height: 35.0),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              const SizedBox(width: 8.0),
              Expanded(
                child: Text("405  Havelock Road, Singapore 169633",
                    style: Theme.of(context).textTheme.bodyText2),
              ),
              Image.asset(IconPaths.location, width: 30.0, height: 30.0),
            ],
          ),
        ),
      ],
    );
  }
}

class _ImageSlider extends StatelessWidget {
  const _ImageSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.9, initialPage: 1),
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: CachedNetworkImage(
                imageUrl: images[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          right: 16.0,
          bottom: -16.0,
          child: CustomPaint(
            painter: CustomShape(fillColor: Colors.black87),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Text(
                "See All 2/144",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _ToolBar extends StatelessWidget {
  const _ToolBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: CustomColors.primary,
            ),
            onPressed: () {},
          ),
          const Spacer(),
          IconButton(
            icon: Image.asset(
              IconPaths.currency,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              IconPaths.chatActive,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
