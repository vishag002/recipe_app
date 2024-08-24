// lib/widgets.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:recipe_app/utilis/color_const.dart';
import 'package:recipe_app/utilis/text_const.dart';

class FoodCard extends StatelessWidget {
  final String title;
  final String rating;
  final String time;
  final String imageUrl;
  final String authorName;
  final String url;

  const FoodCard({
    Key? key,
    required this.title,
    required this.rating,
    required this.time,
    required this.imageUrl,
    required this.authorName,
    required this.url,
  }) : super(key: key);

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri parsedUrl = Uri.parse(url);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                await _launchUrl(parsedUrl);
              },
              child: Container(
                height: 230,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.blackBg,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_half,
                                  color: AppColors.white,
                                  size: 20,
                                ),
                                Text(
                                  rating,
                                  style: TextStyles.subtitle,
                                ),
                                const SizedBox(width: 5),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.blackBg,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  color: AppColors.white,
                                  size: 20,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  time,
                                  style: TextStyles.subtitle,
                                ),
                                const SizedBox(width: 5),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 46,
                    child: Text(
                      maxLines: 2,
                      title,
                      style: TextStyles.subheading,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              horizontalTitleGap: 10,
              minVerticalPadding: 0,
              minTileHeight: 0,
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.white,
              ),
              title: Text(
                maxLines: 1,
                authorName,
                style: TextStyles.title,
              ),
              subtitle: Text(
                maxLines: 1,
                "name",
                style: TextStyles.subtitle,
              ),
              trailing: Icon(
                CupertinoIcons.bookmark,
                color: AppColors.primaryColor,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
