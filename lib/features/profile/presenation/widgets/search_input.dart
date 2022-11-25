import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;
    Color oppositeFontColor = isDarkMode ? Colors.black : Colors.white;
    return Container(
      margin: EdgeInsets.only(top: 25, left: 10, right: 10),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  cursorColor: oppositeFontColor,
                  style: TextStyle(color: oppositeFontColor),
                  decoration: InputDecoration(
                      fillColor: defaultFontColor,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                      hintStyle:
                          TextStyle(color: oppositeFontColor, fontSize: 18),
                      prefixIcon: Container(
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.search,
                          color: oppositeFontColor,
                        ),
                        width: 18,
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
