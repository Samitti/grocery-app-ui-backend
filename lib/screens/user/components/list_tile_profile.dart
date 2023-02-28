import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ListTileProfile extends StatelessWidget {
  final Widget leading;
  final String title;
  final String? subtitleTitle;
  final void Function()? press;
  const ListTileProfile(
      {super.key,
      required this.leading,
      required this.title,
      this.subtitleTitle, this.press});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title , style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
      subtitle: Text(subtitleTitle ?? "", style: const TextStyle(fontSize: 17),),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: press,
    );
  }
}
