import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class ReferAFriendScreen extends StatefulWidget {
  const ReferAFriendScreen({super.key});

  @override
  State<ReferAFriendScreen> createState() => _ReferAFriendScreenState();
}

class _ReferAFriendScreenState extends State<ReferAFriendScreen> {
  final socialMediaList = [
    "assets/referFriend/facebook-3 logo.png",
    "assets/referFriend/gmail logo.png",
    "assets/referFriend/instagram-2-1 logo.png",
    "assets/referFriend/twitter-3 logo.png",
    "assets/referFriend/WhatsApp logo.png",
    "assets/referFriend/snapchat logo.png"
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                header(context),
                contentBox(size, context),
              ],
            ),
          ),
          shareTitle(),
          socialMediaListContent(),
          height5Space,
        ],
      ),
    );
  }

  header(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.symmetric(vertical: fixPadding),
      color: primaryColor,
      width: double.maxFinite,
      child: Column(
        children: [
          heightSpace,
          heightSpace,
          height5Space,
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: whiteColor,
                ),
              ),
              const Text(
                "Refer a Friend",
                style: extrabold22White,
              )
            ],
          ),
        ],
      ),
    );
  }

  contentBox(Size size, BuildContext context) {
    return Positioned(
      top: fixPadding * 8.0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        margin: const EdgeInsets.all(fixPadding * 2.0),
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
        child: ListView(
          padding: const EdgeInsets.only(
              left: fixPadding * 2.0,
              right: fixPadding * 2.0,
              bottom: fixPadding * 2.0),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Image.asset(
              "assets/referFriend/Christmas giveaway.png",
              height: size.height * 0.28,
            ),
            heightSpace,
            heightSpace,
            Center(
              child: DottedBorder(
                padding: EdgeInsets.zero,
                color: greyColor,
                strokeWidth: 1.5,
                borderType: BorderType.RRect,
                radius: const Radius.circular(5.0),
                dashPattern: const [5],
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: fixPadding * 1.5, horizontal: fixPadding * 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                  child: const Text(
                    "SADJK170S",
                    style: extrabold22Primary,
                  ),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            const Text(
              "Share your code with your friends and get exciting bonus points",
              style: semibold16Grey,
              textAlign: TextAlign.center,
            ),
            heightSpace,
            heightSpace,
            heightSpace,
            referButton(context),
          ],
        ),
      ),
    );
  }

  shareTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Text(
        "Share",
        style: extrabold20Black,
      ),
    );
  }

  socialMediaListContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(fixPadding),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          socialMediaList.length,
          (index) {
            return Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.symmetric(horizontal: fixPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: primaryColor.withOpacity(0.05),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                socialMediaList[index],
                height: 26,
                width: 26,
              ),
            );
          },
        ),
      ),
    );
  }

  referButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: fixPadding),
        padding: const EdgeInsets.all(fixPadding * 2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.25),
              blurRadius: 32,
              offset: const Offset(0, 16),
            )
          ],
        ),
        child: const Text(
          "Refer",
          style: bold20White,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
