import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_ui/utils/constants/custom_colors.dart';
import 'package:test_ui/utils/constants/image_paths.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: images.first,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deluxe Twin Room",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      "Twin Single Beds, Cable TV, Bathroom, Shower, Bathtub, Hairdryer",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
              Container(
                padding: const EdgeInsets.all(14.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: CustomColors.primary),
                ),
                child: const Text(
                  "View Rates",
                  style: TextStyle(
                    color: CustomColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Avg. Nightly/Room From",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(width: 10.0),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "SGD",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: "161.42",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ])),
            ],
          ),
        ],
      ),
    );
  }
}
