import 'package:de_marketplace/core/providers/tab_provider/tab_provider.dart';
import 'package:de_marketplace/features/dashboard/presentation/views/collections_page.dart';
import 'package:flutter/material.dart';

class TabBars extends StatefulWidget {
  const TabBars(
      {Key? key,
      required this.children,
      required this.type,
      required this.isDarkMode})
      : super(key: key);

  final List<String> children;
  final String type;
  final bool isDarkMode;

  @override
  State<TabBars> createState() => _TabBarsState();
}

class _TabBarsState extends State<TabBars> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        separatorBuilder: (context, _) => const SizedBox(
          width: 30,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: widget.children.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => TabMenu(
          text: widget.children[index],
          style: widget.type == widget.children[index]
              ? TextStyle(
                  fontSize: 16.0,
                  color: widget.isDarkMode ? Colors.white : Colors.black,
                )
              : const TextStyle(fontSize: 16.0, color: Colors.grey),
          onTap: () {
            setState(() {
              if (widget.type == 'Trending' || widget.type == 'All Drops') {
                TabProvider.tab(context)
                    .changeEventTabBar(widget.children[index]);
              } else {
                TabProvider.tab(context).changeTabBar(widget.children[index]);
              }
            });
          },
          decoration: BoxDecoration(
              border: widget.type == widget.children[index]
                  ? Border(
                      bottom: BorderSide(
                          width: 1.8,
                          color:
                              widget.isDarkMode ? Colors.white : Colors.black))
                  : Border(bottom: BorderSide.none)),
        ),
      ),
    );
  }
}
