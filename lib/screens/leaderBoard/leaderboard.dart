//import 'package:cupertino_tabbar/cupertino_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:rc_fl_quiz_app/theme/theme.dart';
import 'package:rc_fl_quiz_app/widget/column_builder.dart';

/*
class LeaderBaordScreen extends StatefulWidget {
  const LeaderBaordScreen({super.key});

  @override
  State<LeaderBaordScreen> createState() => _LeaderBaordScreenState();
}

class _LeaderBaordScreenState extends State<LeaderBaordScreen> {
  int tabbarvalue = 0;

  final list = [
    {
      "image": "assets/leaderboard/user1.png",
      "name": "Antonia Mcdaniel",
      "score": "479",
      "color": orangeColor
    },
    {
      "image": "assets/leaderboard/user2.png",
      "name": "Ginger Williamson",
      "score": "475",
      "color": pinkColor
    },
    {
      "image": "assets/leaderboard/user3.png",
      "name": "Mario Fleming",
      "score": "450",
      "color": lightGreenColor
    },
    {
      "image": "assets/leaderboard/user1.png",
      "name": "Debra Lester",
      "score": "420",
      "color": lightBlueColor
    },
    {
      "image": "assets/leaderboard/user4.png",
      "name": "Brad Dawson",
      "score": "400",
      "color": orangeColor
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            color: primaryColor,
            padding: const EdgeInsets.only(
                top: fixPadding * 5.0,
                left: fixPadding * 2.0,
                right: fixPadding * 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Leaderboard",
                  style: extrabold22White,
                ),
                heightSpace,
                heightSpace,
                tabbar(),
                heightSpace,
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 225,
                  toolbarHeight: 0.0,
                  backgroundColor: primaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    background: leaderBoardUser(),
                  ),
                ),
                othersScoreList(),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  othersScoreList() {
    return SliverList(
        delegate: SliverChildListDelegate([
      heightSpace,
      ColumnBuilder(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(
                vertical: fixPadding, horizontal: fixPadding * 2.0),
            padding: const EdgeInsets.symmetric(
                horizontal: fixPadding, vertical: fixPadding * 1.5),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(fixPadding / 2),
                  decoration: BoxDecoration(
                    color: list[index]['color'] as Color,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    list[index]['image'].toString(),
                  ),
                ),
                widthSpace,
                Expanded(
                  child: Text(
                    list[index]['name'].toString(),
                    style: semibold18Black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  list[index]['score'].toString(),
                  style: bold18Primary,
                )
              ],
            ),
          );
        },
        itemCount: list.length,
      ),
      heightSpace,
    ]));
  }

  leaderBoardUser() {
    return Container(
      padding: const EdgeInsets.only(
          left: fixPadding * 2.5,
          right: fixPadding * 2.5,
          top: fixPadding,
          bottom: fixPadding * 2.0),
      width: double.maxFinite,
      color: primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          secondThirdUserWidget(
              "2",
              Icons.arrow_drop_down,
              pinkColor,
              "assets/leaderboard/Vector1.png",
              "496",
              tabbarvalue == 0
                  ? "assets/leaderboard/image1.png"
                  : tabbarvalue == 1
                      ? "assets/leaderboard/image3.png"
                      : "assets/leaderboard/image2.png",
              "Mario"),
          firstPositionNumber(),
          secondThirdUserWidget(
              "3",
              Icons.arrow_drop_up,
              lightGreenColor,
              "assets/leaderboard/Vector3.png",
              "480",
              tabbarvalue == 0
                  ? "assets/leaderboard/image3.png"
                  : tabbarvalue == 1
                      ? "assets/leaderboard/image2.png"
                      : "assets/leaderboard/image1.png",
              "Michael")
        ],
      ),
    );
  }

  firstPositionNumber() {
    return Column(
      children: [
        SizedBox(
          height: 185,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 90,
                child: Center(
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/leaderboard/Vector2.png",
                        height: 90,
                        width: 70,
                        fit: BoxFit.fill,
                      ),
                      const Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            "598",
                            style: bebas28White,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 110,
                width: 110,
                padding: const EdgeInsets.all(fixPadding),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                  border: Border.all(color: lightBlueColor, width: 6),
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.15),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      tabbarvalue == 0
                          ? "assets/leaderboard/image2.png"
                          : tabbarvalue == 1
                              ? "assets/leaderboard/image1.png"
                              : "assets/leaderboard/image3.png",
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: -25,
                      child: Image.asset(
                        "assets/leaderboard/crown.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        height5Space,
        const Text(
          "Antonia",
          style: bold18White,
        )
      ],
    );
  }

  secondThirdUserWidget(String position, IconData icon, Color color,
      String scoreImage, String score, String userImage, String userName) {
    return Column(
      children: [
        Text(
          position,
          style: black18White.copyWith(height: 0.7),
        ),
        Icon(
          icon,
          color: color,
        ),
        SizedBox(
          height: 130,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 50,
                child: Center(
                  child: Stack(
                    children: [
                      Image.asset(
                        scoreImage,
                        height: 80,
                        width: 50,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            score,
                            style: bebas28White,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(fixPadding / 3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                    border: Border.all(color: color, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: blackColor.withOpacity(0.15),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ]),
                child: Image.asset(userImage),
              ),
            ],
          ),
        ),
        heightSpace,
        Text(
          userName,
          style: bold18White,
        )
      ],
    );
  }


  tabbar() {
    return CupertinoTabBar(
      whiteColor,
      primaryColor,
      [
        Text(
          "All Time",
          style: tabbarvalue == 0 ? bold16White : bold16Grey,
          textAlign: TextAlign.center,
        ),
        Text(
          "This Week",
          style: tabbarvalue == 1 ? bold16White : bold16Grey,
          textAlign: TextAlign.center,
        ),
        Text(
          "This Month",
          style: tabbarvalue == 2 ? bold16White : bold16Grey,
          textAlign: TextAlign.center,
        )
      ],
      () => tabbarvalue,
      (index) {
        setState(() {
          tabbarvalue = index;
        });
      },
      allowExpand: true,
      useShadow: false,
      borderRadius: BorderRadius.circular(5.0),
      outerHorizontalPadding: 2.0,
      innerVerticalPadding: 10.0,
      innerHorizontalPadding: 20.0,
    );
  }
}*/
