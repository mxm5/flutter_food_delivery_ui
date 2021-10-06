import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatefulWidget {
  final Function onChange;
  final Function onClean;

  SearchBar({this.onChange, this.onClean});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChange,
      textAlign: TextAlign.end,
      cursorColor: Colors.red,
      controller: controller,
      style: TextStyle(fontSize: 12),
      decoration: InputDecoration(
        prefixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),

        contentPadding: EdgeInsets.all(10),
//                fillColor: Colors.red[800],
//                filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            width: 1.0,
          ),
        ),
        hintText: '     غذا یا رستوران را جستجو کنید  '.trim(),

        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            controller.clear();
            widget.onClean();
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
//              color: Colors.white.withOpacity(0.6),
              width: 1.0),
        ),
        focusColor: Colors.red,
        hintStyle: TextStyle(
          fontSize: 12,
        ),
        alignLabelWithHint: true
      ),
    );
  }
}
