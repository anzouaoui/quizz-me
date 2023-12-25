import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPasswordObscure = true;

  final avatarList = [
    {"image": "assets/editProfile/avatar1.png", "color": lightGreenColor},
    {"image": "assets/editProfile/avatar2.png", "color": lightBlueColor},
    {"image": "assets/editProfile/avatar3.png", "color": orangeColor},
    {"image": "assets/editProfile/avatar4.png", "color": pinkColor},
    {"image": "assets/editProfile/avatar5.png", "color": pinkColor},
    {"image": "assets/editProfile/avatar6.png", "color": orangeColor},
    {"image": "assets/editProfile/avatar7.png", "color": lightBlueColor},
    {"image": "assets/editProfile/avatar8.png", "color": lightGreenColor},
  ];
  int selectedAvatar = 2;

  String? selectedAvatarImage;
  @override
  void initState() {
    nameController.text = "Antonia Mcdaniel";
    emailController.text = "antoniamcdaniel@gmail.com";
    phoneController.text = "+(444) 123-4859";
    passwordController.text = "1234567890";

    setState(() {
      selectedAvatarImage = avatarList[selectedAvatar]['image'].toString();
    });
    super.initState();
  }

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
          "Edit Profile",
          style: extrabold22White,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(fixPadding * 2.0),
        physics: const BouncingScrollPhysics(),
        children: [
          userProfileImage(size),
          heightSpace,
          nameField(),
          heightSpace,
          heightSpace,
          emailField(),
          heightSpace,
          heightSpace,
          mobileField(),
          heightSpace,
          heightSpace,
          passwordField(),
        ],
      ),
      bottomNavigationBar: updateButton(),
    );
  }

  passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Password",
          style: semibold16Grey,
        ),
        heightSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: TextField(
            controller: passwordController,
            style: semibold18Black,
            cursorColor: primaryColor,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isPasswordObscure,
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
              hintText: "Your password",
              hintStyle: semibold16Grey,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordObscure = !isPasswordObscure;
                  });
                },
                icon: Icon(
                  isPasswordObscure ? Icons.visibility : Icons.visibility_off,
                  color: greyColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  mobileField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "mobile number",
          style: semibold16Grey,
        ),
        heightSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: TextField(
            controller: phoneController,
            style: semibold18Black,
            cursorColor: primaryColor,
            keyboardType: TextInputType.phone,
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
              hintText: "Your mobile number",
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
          style: semibold16Grey,
        ),
        heightSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: TextField(
            controller: emailController,
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
          style: semibold16Grey,
        ),
        heightSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: TextField(
            controller: nameController,
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

  userProfileImage(Size size) {
    return Center(
      child: SizedBox(
        height: size.height * 0.17,
        width: size.height * 0.16,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.16,
              width: size.height * 0.16,
              decoration: BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                  BoxShadow(
                    color: primaryColor.withOpacity(0.05),
                    blurRadius: 32,
                    offset: const Offset(0, 12),
                  )
                ],
              ),
              padding: const EdgeInsets.all(fixPadding * 2.0),
              child: Image.asset(selectedAvatarImage.toString()),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  changeProfileImageBottomSheet();
                },
                child: Container(
                  height: size.height * 0.048,
                  width: size.height * 0.048,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.camera_alt,
                    color: whiteColor,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeProfileImageBottomSheet() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, state) {
          return Container(
            color: whiteColor,
            width: double.maxFinite,
            padding: const EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Choose Avatar",
                        style: extrabold20Black,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedAvatarImage =
                              avatarList[selectedAvatar]['image'].toString();
                        });
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Done",
                        style: bold16Primary,
                      ),
                    )
                  ],
                ),
                heightSpace,
                GridView.builder(
                  itemCount: avatarList.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: fixPadding * 2.0,
                      mainAxisSpacing: fixPadding * 2.0),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        state(() {
                          setState(() {
                            selectedAvatar = index;
                          });
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(fixPadding / 1.5),
                            decoration: BoxDecoration(
                              color: avatarList[index]['color'] as Color,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              avatarList[index]['image'].toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          selectedAvatar == index
                              ? Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: const BoxDecoration(
                                      color: primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.done,
                                      color: whiteColor,
                                      size: 20,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          );
        });
      },
    );
  }

  updateButton() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.only(
              left: fixPadding * 4.0,
              right: fixPadding * 4.0,
              bottom: fixPadding * 2.0,
              top: fixPadding),
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
            "Update",
            style: bold20White,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
