library bottomsheet_button;

import 'package:flutter/material.dart';
import 'hifive_divider.dart';

class BottomSheetButtonGroup extends StatelessWidget {
  BottomSheetButtonGroup({
    this.children,
    this.sliceIndex = const [],
    this.margin,
  });
  final List<Widget> children;
  final EdgeInsetsGeometry margin;

  ///用于分隔按钮组的index,可以分割多组
  final List<int> sliceIndex;

  List<Widget> get _children {
    List<Widget> _list = [];
    for (int i = 0; i < children.length; i++) {
      Widget _button = children[i];
      bool topRadius = false;
      bool bottomRadius = false;
      if (i > 0)
        _list.add(
            sliceIndex.contains(i) ? SizedBox(height: 8) : HiFiveDivider());
      if (i == 0 || sliceIndex.contains(i)) topRadius = true;
      if (i == children.length - 1 || sliceIndex.contains(i + 1))
        bottomRadius = true;
      if (_button is BottomSheetButton) {
        _list.add(BottomSheetButton(
          onTap: _button.onTap,
          text: _button.text,
          textColor: _button.textColor,
          radius: _button.radius,
          topRadius: _button.topRadius ?? topRadius,
          bottomRadius: _button.bottomRadius ?? bottomRadius,
        ));
      } else {
        _list.add(_button);
      }
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _children,
      ),
    );
  }
}

class BottomSheetButton extends StatelessWidget {
  BottomSheetButton({
    this.onTap,
    this.text,
    this.textColor = Colors.black,
    this.radius = 10,
    this.topRadius,
    this.bottomRadius,
  });
  final VoidCallback onTap;
  final String text;
  final Color textColor;
  final bool topRadius;
  final bool bottomRadius;

  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minHeight: 52),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(topRadius ? radius : 0),
                bottom: Radius.circular(bottomRadius ? radius : 0))),
        child: Center(
          child: Text(
            text ?? "",
            style: TextStyle(fontSize: 17, color: textColor),
          ),
        ),
      ),
    );
  }
}
