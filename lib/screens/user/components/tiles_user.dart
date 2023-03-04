import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/screens/order/order_screen.dart';
import 'package:grocery/screens/wishlist/wishlist_screen.dart';
import 'package:grocery/widgets/theme_button.dart';
import 'package:grocery/screens/user/components/list_tile_profile.dart';

class TilesUser extends StatefulWidget {
  const TilesUser({
    super.key,
  });

  @override
  State<TilesUser> createState() => _TilesUserState();
}

class _TilesUserState extends State<TilesUser> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
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
        SizedBox(height: dimensions.getScreenH(5)),
        ListTileProfile(
          leading: const Icon(IconlyLight.bag),
          title: "Order",
          press: () {
            CommonFunction.navigateToPage(context: context, routeName: OrderScreen.routeName);
          },
        ),
        SizedBox(height: dimensions.getScreenH(5)),
        ListTileProfile(
          leading: const Icon(IconlyLight.heart),
          title: "Wishlist",
          press: () {
            CommonFunction.navigateToPage(
                context: context, routeName: WishListScreen.routeName);
          },
        ),
        SizedBox(height: dimensions.getScreenH(5)),
        ListTileProfile(
          leading: const Icon(IconlyLight.show),
          title: "Viewed",
          press: () {},
        ),
        SizedBox(height: dimensions.getScreenH(5)),
        ListTileProfile(
          leading: const Icon(IconlyBold.unlock),
          title: "Forget Password",
          press: () {},
        ),
        const ThemeButton(),
        SizedBox(height: dimensions.getScreenH(5)),
        ListTileProfile(
          leading: const Icon(IconlyLight.logout),
          title: "Logout",
          press: () async {
            return await CommonFunction.warningDialog(
              context: context,
              imgPath: "assets/images/warning-sign.png",
              text: 'Sign Out',
              subTitle: 'Are you sure?',
              press: () {},
            );
          },
        ),
      ],
    );
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
