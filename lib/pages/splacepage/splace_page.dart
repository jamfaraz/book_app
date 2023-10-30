import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/splace_controller.dart';

class SplacePage extends StatefulWidget {
  const SplacePage({super.key});

  @override
  State<SplacePage> createState() => _SplacePageState();
}

class _SplacePageState extends State<SplacePage> {
  SplaceController splaceController = Get.put(SplaceController());
  // BookController bookController = Get.put(BookController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Lottie.asset("Assets/Animation/Anim1.json"),
      ),
    );
  }
}
