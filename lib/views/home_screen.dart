// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:recipe_app/models/api_modal.dart';
// import 'package:recipe_app/models/receipe_model.dart';
// import 'package:recipe_app/utilis/color_const.dart';
// import 'package:recipe_app/utilis/text_const.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late List<Recipie> _recipies;
//   bool _isloading = true;
//   //
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getRecipies();
//   }

//   Future<void> _launchUrl(Uri url) async {
//     if (!await launchUrl(url)) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   //
//   Future<void> getRecipies() async {
//     _recipies = await ReceipieApi.getRecipe();
//     setState(() {
//       _isloading = false;
//     });
//     print(_recipies);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.black,
//       appBar: AppBar(
//         backgroundColor: AppColors.black,
//         title: Row(
//           children: [
//             Icon(
//               Icons.fastfood_rounded,
//               color: AppColors.primaryColor,
//               size: 25,
//             ),
//             Gap(10),
//             Text(
//               "Receipi Book",
//               style: TextStyles.heading,
//             ),
//           ],
//         ),
//         actions: [
//           Row(
//             children: [
//               Icon(
//                 Icons.notifications_sharp,
//                 color: AppColors.white,
//                 size: 25,
//               ),
//               Gap(20),
//               Icon(
//                 Icons.calendar_month,
//                 color: AppColors.white,
//                 size: 25,
//               ),
//               Gap(30),
//             ],
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           _isloading
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : Expanded(
//                   child: ListView.builder(
//                     itemCount: _recipies.length,
//                     itemBuilder: (context, index) => foodCard(
//                       title: _recipies[index].name.toString(),
//                       rating: _recipies[index].rating.toString(),
//                       time: _recipies[index].totalTime.toString(),
//                       imageUrl: _recipies[index].images.toString(),
//                       authorName: _recipies[index].authorName.toString(),
//                       url: _recipies[index].url.toString(),
//                       //Uri url = Uri.parse(url),

//                       //   url: _recipies[index].url.toString(),
//                     ),
//                   ),
//                 ),
//         ],
//       ),
//     );
//   }

//   Widget foodCard({
//     required String title,
//     required String rating,
//     required String time,
//     required String imageUrl,
//     required String authorName,
//     required String url,
//   }) {
//     final Uri parsedUrl = Uri.parse(url); // Parse the URL string here

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         child: Column(
//           children: [
//             InkWell(
//               onTap: () async {
//                 await _launchUrl(parsedUrl); // Use parsed URL here
//               },
//               child: Container(
//                 height: 230,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.grey,
//                   image: DecorationImage(
//                     image: NetworkImage(imageUrl),
//                     scale: 1,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 30, vertical: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: AppColors.blackBg,
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.star_half,
//                                   color: AppColors.white,
//                                   size: 20,
//                                 ),
//                                 Text(
//                                   rating,
//                                   style: TextStyles.subtitle,
//                                 ),
//                                 const SizedBox(width: 5),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: AppColors.blackBg,
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.timer_sharp,
//                                   color: AppColors.white,
//                                   size: 20,
//                                 ),
//                                 const SizedBox(width: 5),
//                                 Text(
//                                   time,
//                                   style: TextStyles.subtitle,
//                                 ),
//                                 const SizedBox(width: 5),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, top: 5),
//               child: Row(
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width - 46,
//                     child: Text(
//                       maxLines: 2,
//                       title,
//                       style: TextStyles.subheading,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               horizontalTitleGap: 10,
//               minVerticalPadding: 0,
//               minTileHeight: 0,
//               leading: CircleAvatar(
//                 radius: 20,
//                 backgroundColor: AppColors.white,
//               ),
//               title: Text(
//                 maxLines: 1,
//                 authorName,
//                 style: TextStyles.title,
//               ),
//               subtitle: Text(
//                 maxLines: 1,
//                 "name",
//                 style: TextStyles.subtitle,
//               ),
//               trailing: Icon(
//                 CupertinoIcons.bookmark,
//                 color: AppColors.primaryColor,
//                 size: 25,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
