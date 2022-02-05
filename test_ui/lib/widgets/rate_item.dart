import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:test_ui/utils/constants/custom_colors.dart';
import 'package:test_ui/utils/constants/icon_paths.dart';

class RateItem extends StatelessWidget {
  const RateItem({
    Key? key,
    this.hasVoucher = false,
  }) : super(key: key);

  final bool hasVoucher;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.black,
      strokeWidth: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      hasVoucher
                          ? Text(
                              "Your E-Voucher Rate".toUpperCase(),
                            )
                          : const SizedBox.shrink(),
                      Text(
                        "Mobile App Special Voucher",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 14.0),
                Image.asset(IconPaths.next, width: 35.0, height: 35.0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        IconPaths.fnb,
                        width: 55,
                        height: 55,
                      ),
                      const Text(
                        "Inclusive of Breakfast",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        IconPaths.discount,
                        width: 55,
                        height: 55,
                      ),
                      const Text(
                        "20% off In-Room Server",
                        textAlign: TextAlign.center,
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
          ),
          hasVoucher
              ? const SizedBox.shrink()
              : const Divider(thickness: 2, indent: 10.0, endIndent: 10.0),
          hasVoucher
              ? Container(
                  height: 30,
                  color: Colors.amberAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.volunteer_activism_sharp,
                        color: Colors.black54,
                      ),
                      Text("Memeber Deals".toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.black54)),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          hasVoucher
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Avg. Nightly/Room From",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            const Text("Service to GST & Service Charge")
                          ],
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
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ])),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
