import 'package:example_financy/constant.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class WidgetBottomAppBar extends StatefulWidget {

  final Color? selectedColor;
  final List<BottomAppBarModel> children;

  const WidgetBottomAppBar({
    Key? key,
    this.selectedColor,
    required this.children
  }) : super(key: key);

  @override
  State<WidgetBottomAppBar> createState() => _WidgetBottomAppBarState();
}

class _WidgetBottomAppBarState extends State<WidgetBottomAppBar> {

  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(

      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children.map(
                (item) {
                  final currentItem = widget.children.indexOf(item) == _selectedItemIndex;
                  return Expanded(
                      child: InkWell(
                        onTap: item.onPressed,
                        onTapUp: (_) {
                          setState(() {
                            _selectedItemIndex = widget.children.indexOf(item);
                          });
                        },
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: Icon(
                              currentItem ? item.firstIcon : item.secondIcon,
                              color: currentItem 
                                  ? Constant.colorLinear2
                                  : Colors.grey.shade300,
                              size: 30.0,
                            ),
                        ),
                      )
                  );
                }).toList(),
      ),
    );
  }
}
