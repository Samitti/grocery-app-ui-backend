import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/screens/order/order_screen.dart';
import 'package:grocery/screens/signin/signin_screen.dart';
import 'package:grocery/screens/viewed/viewed_screen.dart';
import 'package:grocery/screens/wishlist/wishlist_screen.dart';
import 'package:grocery/services/auth/auth_services.dart';
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
            CommonFunction.navigateToPage(
                context: context, routeName: OrderScreen.routeName);
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
          press: () {
            CommonFunction.navigateToPage(
                context: context, routeName: ViewedScreen.routeName);
          },
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
          leading: firebaseAuth.currentUser == null
              ? const Icon(IconlyLight.login)
              : const Icon(IconlyLight.logout),
          title: firebaseAuth.currentUser == null ? "Login" : "Logout",
          press: () async {
            if (firebaseAuth.currentUser == null) {
              CommonFunction.navigateToPage(
                  context: context, routeName: SignInScreen.routeName);
              return;
            }
            return await CommonFunction.warningDialog(
              context: context,
              text: 'Sign Out',
              subTitle: 'Are you sure?',
              press: () {
                AuthServices().signOut(context: context);
                CommonFunction.navigateToPage(
                    context: context, routeName: SignInScreen.routeName);
                return;
              },
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
