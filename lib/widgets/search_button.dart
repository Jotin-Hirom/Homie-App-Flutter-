
import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

// ignore: must_be_immutable
class SearchButton extends StatefulWidget {
  SearchButton({super.key, required this.list});
  List list;

  @override
  State<SearchButton> createState() => _SearchButtonState();
} 

class _SearchButtonState extends State<SearchButton> {
  List<dynamic> search = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    search = widget.list;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBarAnimation(
      textEditingController: controller,
      isOriginalAnimation: true,
      enableKeyboardFocus: true,
      onExpansionComplete: () {
        debugPrint('do something just after searchbox is opened.');
      },
      onCollapseComplete: () {
        debugPrint('do something just after searchbox is closed.');
      },
      onPressButton: (isSearchBarOpens) {
        debugPrint(
            'do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
      },
      onFieldSubmitted: (String value) {
        if (value.isEmpty) {
          debugPrint("yes");
        } else {
          search = widget.list
              .where((element) => element.contains(value.toLowerCase()))
              .toList();
          // debugPrint(wait.toString());
          setState(() {
            widget.list = search;
            controller.clear();
          });
        }
      },
      trailingWidget: const Icon(
        Icons.search,
        size: 20,
        color: Colors.black,
      ),
      secondaryButtonWidget: const Icon(
        Icons.close,
        size: 20,
        color: Colors.black,
      ),
      buttonWidget: const Icon(
        Icons.search,
        size: 20,
        color: Colors.black,
      ),
    );
  }
}
