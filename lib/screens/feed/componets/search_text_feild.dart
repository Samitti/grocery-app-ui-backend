import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';

class SearchTextFeild extends StatefulWidget {
  const SearchTextFeild({super.key});

  @override
  State<SearchTextFeild> createState() => _SearchTextFeildState();
}

class _SearchTextFeildState extends State<SearchTextFeild> {
  final TextEditingController _searchBarController = TextEditingController();
  final FocusNode _searchFouceNode = FocusNode();
  @override
  void dispose() {
    _searchBarController.dispose();
    _searchFouceNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    return Padding(
      padding: EdgeInsets.all(dimensions.getScreenW(15)),
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: TextField(
          focusNode: _searchFouceNode,
          controller: _searchBarController,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(dimensions.getScreenW(12)),
              borderSide: const BorderSide(color: Colors.greenAccent, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(dimensions.getScreenW(12)),
              borderSide: const BorderSide(color: Colors.greenAccent, width: 2),
            ),
            hintText: 'Search Here',
            prefixIcon: const Icon(Icons.search),
            suffix: IconButton(
              onPressed: () {
                _searchBarController.clear();
                _searchFouceNode.unfocus();
              },
              icon: Icon(
                Icons.close,
                color: _searchFouceNode.hasFocus ? Colors.red : color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
