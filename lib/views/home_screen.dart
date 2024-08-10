import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:recipe_app/models/api_modal.dart';
import 'package:recipe_app/models/receipe_model.dart';
import 'package:recipe_app/utilis/color_const.dart';
import 'package:recipe_app/utilis/text_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Recipie> _recipies;
  bool _isloading = true;
  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecipies();
  }

  //
  Future<void> getRecipies() async {
    _recipies = await ReceipieApi.getRecipe();
    setState(() {
      _isloading = false;
    });
    print(_recipies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Row(
          children: [
            Icon(
              Icons.fastfood_rounded,
              color: AppColors.primaryColor,
              size: 25,
            ),
            Gap(10),
            Text(
              "Receipieee",
              style: TextStyles.heading,
            ),
          ],
        ),
        actions: const [
          Row(
            children: [
              Icon(
                Icons.notifications_sharp,
                color: AppColors.white,
                size: 25,
              ),
              Gap(20),
              Icon(
                Icons.calendar_month,
                color: AppColors.white,
                size: 25,
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          _isloading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: _recipies.length,
                    itemBuilder: (context, index) => foodCard(
                        title: _recipies[index].name.toString(),
                        rating: _recipies[index].rating.toString(),
                        time: _recipies[index].totalTime.toString(),
                        imageUrl: _recipies[index].images.toString()),
                  ),
                ),
        ],
      ),
    );
  }

  Widget foodCard({
    required String title,
    required String rating,
    required String time,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          scale: 1,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyles.title,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
