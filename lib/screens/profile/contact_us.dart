import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
          "Contact us",
          style: extrabold22White,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(fixPadding * 2.0),
        physics: const BouncingScrollPhysics(),
        children: [
          nameField(),
          heightSpace,
          heightSpace,
          emailField(),
          heightSpace,
          heightSpace,
          messageField(size),
          heightSpace,
          heightSpace,
          heightSpace,
          height5Space,
          sendButton(context),
          heightSpace,
          heightSpace,
          heightSpace,
          supportImage(),
          height5Space,
          getInTouchText()
        ],
      ),
    );
  }

  getInTouchText() {
    return const Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: "You can",
        style: semibold16Grey,
        children: [
          TextSpan(text: " "),
          TextSpan(text: "Get in touch", style: bold16Primary),
          TextSpan(text: " "),
          TextSpan(text: "our 24/7 customer service any time."),
        ],
      ),
    );
  }

  supportImage() {
    return Image.asset(
      "assets/contactus/support.png",
      height: 25,
      color: greyColor,
    );
  }

  sendButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
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
          "Send",
          style: bold20White,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  messageField(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Message",
          style: semibold18Black,
        ),
        heightSpace,
        Container(
          height: size.height * 0.16,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: TextField(
            textAlignVertical: TextAlignVertical.top,
            expands: true,
            maxLines: null,
            minLines: null,
            style: semibold18Black,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: primaryColor.withOpacity(0.05),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: fixPadding * 1.2, vertical: fixPadding * 1.7),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: primaryColor, width: 1.5),
              ),
              hintText: "Write here...",
              hintStyle: semibold16Grey,
            ),
          ),
        ),
      ],
    );
  }

  emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email Address",
          style: semibold18Black,
        ),
        heightSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: TextField(
            style: semibold18Black,
            cursorColor: primaryColor,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: primaryColor.withOpacity(0.05),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: fixPadding * 1.2, vertical: fixPadding * 1.7),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: primaryColor, width: 1.5),
              ),
              hintText: "Your email address",
              hintStyle: semibold16Grey,
            ),
          ),
        ),
      ],
    );
  }

  nameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Full Name",
          style: semibold18Black,
        ),
        heightSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: TextField(
            style: semibold18Black,
            cursorColor: primaryColor,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              filled: true,
              fillColor: primaryColor.withOpacity(0.05),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: fixPadding * 1.2, vertical: fixPadding * 1.7),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: primaryColor, width: 1.5),
              ),
              hintText: "Your full name",
              hintStyle: semibold16Grey,
            ),
          ),
        ),
      ],
    );
  }
}
