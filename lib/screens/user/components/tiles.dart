import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/screens/home/components/theme_button.dart';
import 'package:grocery/screens/user/components/list_tile_profile.dart';

class Titles extends StatefulWidget {
  const Titles({
    super.key,
  });

  @override
  State<Titles> createState() => _TitlesState();
}

class _TitlesState extends State<Titles> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileProfile(
          leading: const Icon(IconlyLight.profile),
          title: "Address",
          subtitleTitle: "My Address 2",
          press: () async {
            return await addressDialog(context);
          },
        ),
        const SizedBox(height: 5),
        ListTileProfile(
          leading: const Icon(IconlyLight.bag),
          title: "Order",
          press: () {},
        ),
        const SizedBox(height: 5),
        ListTileProfile(
          leading: const Icon(IconlyLight.heart),
          title: "Wishlist",
          press: () {},
        ),
        const SizedBox(height: 5),
        ListTileProfile(
          leading: const Icon(IconlyLight.show),
          title: "Viewed",
          press: () {},
        ),
        const SizedBox(height: 5),
        ListTileProfile(
          leading: const Icon(IconlyBold.unlock),
          title: "Forget Password",
          press: () {},
        ),
        const ThemeButton(),
        const SizedBox(height: 5),
        ListTileProfile(
          leading: const Icon(IconlyLight.logout),
          title: "Logout",
          press: () async {
            return await logoutDialog(context);
          },
        ),
      ],
    );
  }

  Future<void> logoutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  "assets/images/warning-sign.png",
                  height: 30,
                  width: 30,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text("Sign Out")
              ],
            ),
            content: const Text("Are you sure?" , style: TextStyle(fontSize: 18),),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: const Text("Cancel" , style: TextStyle(fontSize: 18),),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text("Yes", style: TextStyle(fontSize: 18),),
              )
            ],
          );
        });
  }

  Future<void> addressDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Address"),
          content: TextField(
            controller: textController,
            maxLines: 5,
            decoration: const InputDecoration(hintText: "Enter your address"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Done"),
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
