import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationList = [
    {
      "image": "assets/selectFriend/friend2.png",
      "isImage": true,
      "title": "Quiz Invitation",
      "time": "35 min ago",
      "discription": "Ginger Williamson Challenged you for Biology Quiz",
      "color": pinkColor
    },
    {
      "isImage": false,
      "title": "Quizx",
      "time": "1 hour ago",
      "discription":
          "Your Quiz for Data Science-II is Created successfully. Share link with your Feiends.",
      "color": lightBlueColor
    },
    {
      "isImage": false,
      "title": "Quizx",
      "time": "1 hour ago",
      "discription": "Your Score in Biology and Science Quiz is 15 outof 20.",
      "color": orangeColor
    },
    {
      "image": "assets/selectFriend/friend7.png",
      "isImage": true,
      "title": "Michael Rhodes",
      "time": "1 hour ago",
      "discription": "Michael Rhodes Challenged you for Math Quiz",
      "color": lightGreenColor
    },
    {
      "isImage": false,
      "title": "Quizx",
      "time": "2 hour ago",
      "discription":
          "Your Quiz for Data Science-II is Created successfully. Share link with your Feiends.",
      "color": pinkColor
    },
    {
      "image": "assets/editProfile/avatar2.png",
      "isImage": true,
      "title": "Clara Nichols",
      "time": "1 hour ago",
      "discription": "Clara Nichols Challenged you for Math Quiz",
      "color": lightBlueColor
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
          "Notification",
          style: extrabold22White,
        ),
      ),
      body: notificationList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    FontAwesomeIcons.bellSlash,
                    color: greyColor,
                    size: 35,
                  ),
                  heightSpace,
                  height5Space,
                  Text(
                    "No new notification",
                    style: semibold16Grey,
                  )
                ],
              ),
            )
          : notificationListContent(),
    );
  }

  notificationListContent() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: notificationList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            setState(() {
              notificationList.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 1500),
                behavior: SnackBarBehavior.floating,
                backgroundColor: blackColor,
                content: Text(
                  "Removed from notification",
                  style: bold15White,
                ),
              ),
            );
          },
          background: Container(
            color: redColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: notificationList[index]['color'] as Color,
                        ),
                        alignment: Alignment.center,
                        child: notificationList[index]['isImage'] == true
                            ? Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(notificationList[index]
                                        ['image']
                                    .toString()),
                              )
                            : const Icon(
                                FontAwesomeIcons.solidBell,
                                color: whiteColor,
                              ),
                      ),
                      widthSpace,
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    notificationList[index]['title'].toString(),
                                    style: bold18Black,
                                  ),
                                ),
                                Text(
                                  notificationList[index]['time'].toString(),
                                  style: semibold14Grey,
                                )
                              ],
                            ),
                            height5Space,
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    notificationList[index]['discription']
                                        .toString(),
                                    style: semibold16Grey,
                                  ),
                                ),
                                width5Space,
                                notificationList[index]['isImage'] == true
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: fixPadding / 2,
                                            horizontal: fixPadding * 1.5),
                                        decoration: BoxDecoration(
                                          color: primaryColor.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: const Text(
                                          "Accept",
                                          style: bold14Primary,
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                notificationList.length == index + 1
                    ? const SizedBox()
                    : Container(
                        height: 1,
                        width: double.maxFinite,
                        color: greyColor.withOpacity(0.3),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
