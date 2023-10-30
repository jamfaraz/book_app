import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../profilepage/profile_page.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: SvgPicture.asset("Assets/Icons/dashboard.svg")),
        Text(
          "E-BOOK",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.background,
              ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => const ProfilePage());
          },
          child: CircleAvatar(
              radius: 25,
              backgroundColor: Theme.of(context).colorScheme.background,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                      authController.auth.currentUser!.photoURL!))),
        )
      ],
    );
  }
}
