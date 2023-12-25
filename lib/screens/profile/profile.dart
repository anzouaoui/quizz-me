import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rc_fl_quiz_app/screens/bottomNavigationBar/bottom_navigation_bar.dart';

import '../../theme/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final rankpointsList = [
    {
      "icon": "assets/profile/Star.png",
      "title": "POINTS",
      "detail": "590",
    },
    {
      "icon": "assets/profile/world.png",
      "title": "WORLD RANK",
      "detail": "#1,480",
    },
    {
      "icon": "assets/profile/verified.png",
      "title": "LOCAL RANK",
      "detail": "#46",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          title: const Text(
            "Profile",
            style: extrabold22White,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/editProfile');
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        body: ListView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            header(size),
            height5Space,
            listTileWidget(
                FontAwesomeIcons.trophy, "Leaderboard", lightGreenColor, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomBarScreen(
                    selectedId: 2,
                  ),
                ),
              );
            }, 22),
            listTileWidget(
                FontAwesomeIcons.solidBell, "Notification", lightBlueColor, () {
              Navigator.pushNamed(context, '/notification');
            }, 22),
            listTileWidget(
                CupertinoIcons.person_2_fill, "Refer a Friend", orangeColor,
                () {
              Navigator.pushNamed(context, '/referAFriend');
            }, 24),
            listTileWidget(
                CupertinoIcons.question_circle_fill, "FAQs", pinkColor, () {
              Navigator.pushNamed(context, '/faqs');
            }, 24),
            listTileWidget(Icons.headphones, "Contact us", lightGreenColor, () {
              Navigator.pushNamed(context, '/contactUs');
            }, 24),
            listTileWidget(FontAwesomeIcons.arrowRightFromBracket, "Logout",
                lightBlueColor, () {
              logoutDialog(context);
            }, 22),
            heightSpace,
            heightSpace,
          ],
        ));
  }

  logoutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          insetPadding: const EdgeInsets.all(fixPadding * 3.0),
          child: Padding(
            padding: const EdgeInsets.only(
              left: fixPadding,
              right: fixPadding,
              top: fixPadding * 2.0,
              bottom: fixPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/profile/question.png",
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    widthSpace,
                    const Expanded(
                      child: Text(
                        "Confirm Exit...!!!",
                        style: extrabold20Black,
                      ),
                    ),
                  ],
                ),
                heightSpace,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: fixPadding),
                  child: Text(
                    "Are you sure, You want to exit",
                    style: semibold16Black,
                  ),
                ),
                heightSpace,
                heightSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "CANCEL",
                        style: extrabold14Primary,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "NO",
                            style: extrabold14Primary,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            "YES",
                            style: extrabold14Primary,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  listTileWidget(
      IconData icon, String title, Color color, Function() onTap, double size) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      leading: Icon(
        icon,
        size: size,
        color: color,
      ),
      minLeadingWidth: 25,
      title: Text(
        title,
        style: semibold18Black,
      ),
    );
  }

  header(Size size) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 230,
          width: double.maxFinite,
          color: primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Column(
            children: [
              height5Space,
              Container(
                padding: const EdgeInsets.all(fixPadding * 1.5),
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
                child: Image.asset(
                  "assets/profile/avatar3.png",
                ),
              ),
              heightSpace,
              const Text(
                "Antonia Mcdaniel",
                style: extrabold22White,
              ),
              heightSpace,
              heightSpace,
              rankAndPoints(),
            ],
          ),
        )
      ],
    );
  }

  rankAndPoints() {
    return Container(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: grey9AColor.withOpacity(0.1),
            blurRadius: 24,
            offset: const Offset(0, 12),
          )
        ],
      ),
      child: Row(
        children: List.generate(rankpointsList.length, (index) {
          return Expanded(
            child: Column(
              children: [
                Image.asset(
                  rankpointsList[index]['icon'].toString(),
                  color: primaryColor,
                  height: 24,
                  width: 24,
                ),
                height5Space,
                Text(
                  rankpointsList[index]['title'].toString(),
                  style: extrabold12Grey,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  rankpointsList[index]['detail'].toString(),
                  style: extrabold20Primary,
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  userInfo(Size size) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.light_mode_sharp,
                    color: whiteColor,
                  ),
                  widthSpace,
                  Expanded(
                    child: Text(
                      "Good Morning",
                      style: semibold16White,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              height5Space,
              const Text(
                "Antonia Mcdaniel",
                style: extrabold22White,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        Container(
          height: size.height * 0.08,
          width: size.height * 0.08,
          padding: const EdgeInsets.all(fixPadding / 1.3),
          decoration: const BoxDecoration(
            color: whiteColor,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Image.asset(
            "assets/home/MemojiGirls.png",
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
