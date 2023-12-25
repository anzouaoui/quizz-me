import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class SelectFriendScreen extends StatefulWidget {
  const SelectFriendScreen({super.key});

  @override
  State<SelectFriendScreen> createState() => _SelectFriendScreenState();
}

class _SelectFriendScreenState extends State<SelectFriendScreen> {
  final friendsList = [
    {
      "image": "assets/selectFriend/friend1.png",
      "name": "Antonia Mcdaniel",
      "color": orangeColor
    },
    {
      "image": "assets/selectFriend/friend2.png",
      "name": "Ginger Williamson",
      "color": pinkColor
    },
    {
      "image": "assets/selectFriend/friend3.png",
      "name": "Mario Fleming",
      "color": lightGreenColor
    },
    {
      "image": "assets/selectFriend/friend4.png",
      "name": "Debra Lester",
      "color": lightBlueColor
    },
    {
      "image": "assets/selectFriend/friend5.png",
      "name": "Brad Dawson",
      "color": orangeColor
    },
    {
      "image": "assets/selectFriend/friend6.png",
      "name": "Clara Nichols",
      "color": pinkColor
    },
    {
      "image": "assets/selectFriend/friend7.png",
      "name": "Michael Rhodes",
      "color": lightGreenColor
    },
    {
      "image": "assets/selectFriend/friend8.png",
      "name": "Emma Cunningham",
      "color": lightBlueColor
    },
    {
      "image": "assets/selectFriend/friend9.png",
      "name": "Kelsey Fritz",
      "color": orangeColor
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.14,
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: whiteColor,
            size: 26,
          ),
        ),
        title: const Text(
          "Select Friend",
          style: extrabold22White,
        ),
      ),
      body: friendsListContent(),
    );
  }

  friendsListContent() {
    return ListView.builder(
      itemCount: friendsList.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2.0, vertical: fixPadding),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/randomuser');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: fixPadding, vertical: fixPadding * 1.5),
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(vertical: fixPadding),
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
                    color: friendsList[index]['color'] as Color,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    friendsList[index]['image'].toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                widthSpace,
                Expanded(
                  child: Text(
                    friendsList[index]['name'].toString(),
                    style: semibold18Black,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: fixPadding / 2, horizontal: fixPadding * 1.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: primaryColor.withOpacity(0.2),
                  ),
                  child: const Text(
                    "Invite",
                    style: bold16Primary,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
