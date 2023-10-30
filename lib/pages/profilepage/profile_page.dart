import 'package:book_app/models/data.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/book_controller.dart';
import '../../widgets/back_button.dart';
import '../../widgets/book_tile.dart';
import '../addBookPage/add_newbook.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthController authController = Get.put(AuthController());
  BookController bookController = Get.put(BookController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddNewBookPage());
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 500,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: Theme.of(context).colorScheme.primary,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const MyBackButton(),
                          Text(
                            "Profile",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                          ),
                          IconButton(
                              onPressed: () {
                                authController.signout();
                              },
                              icon: Icon(
                                Icons.exit_to_app,
                                color: Theme.of(context).colorScheme.background,
                              ))
                        ],
                      ),
                      const SizedBox(height: 60),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 2,
                              color: Theme.of(context).colorScheme.background,
                            )),
                        child: Container(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              "${authController.auth.currentUser!.photoURL}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "${authController.auth.currentUser!.displayName}",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      ),
                      Text(
                        "${authController.auth.currentUser!.email}",
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Your Books",
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Obx(
                  //   () =>

                  Column(
                    children: bookData
                        //  bookController.currentUserBooks
                        .map((e) => BookTile(
                              title: e.title!,
                              coverUrl: e.coverUrl!,
                              author: e.author!,
                              price: e.price!,
                              rating: e.rating!,
                              totalRating: 12,
                              ontap: () {},
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
