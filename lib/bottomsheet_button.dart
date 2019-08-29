library bottomsheet_button;

import 'package:flutter/material.dart';
import 'hifive_divider.dart';
enum RadiusDirection { bottom, top, all, none }

class BottomSheetButtonGroup extends StatelessWidget {
  BottomSheetButtonGroup({this.children, this.sliceIndex = 0})
      : assert(sliceIndex >= 0 && sliceIndex < children.length);
  final List<BottomSheetButton> children;
  ///分隔的index
  ///用于分隔按钮组的
  final int sliceIndex;

  List<Widget> get _children {
    List<Widget> _list = [];
    RadiusDirection _direction;
    for (int i = 0; i < children.length; i++) {
      BottomSheetButton _button = children[i];
      if (i > 0)
        _list.add(i == sliceIndex ? SizedBox(height: 8) : HiFiveDivider());

      if (i < sliceIndex)
        _direction = i == 0
            ? RadiusDirection.top
            : i == sliceIndex - 1
            ? RadiusDirection.bottom
            : RadiusDirection.none;

      if (i >= sliceIndex)
        _direction = i == sliceIndex
            ? RadiusDirection.top
            : i == children.length - 1
            ? RadiusDirection.bottom
            : RadiusDirection.none;
      if ((i == 0 && sliceIndex - 1 == 0) ||
          (i == children.length - 1 && sliceIndex == children.length - 1))
        _direction = RadiusDirection.all;
      _list.add(BottomSheetButton(
        onTap: _button.onTap,
        text: _button.text,
        textColor: _button.textColor,
        radius: _button.radius,
        radiusDirection: _direction,
      ));
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _children,
    );
  }
}

class BottomSheetButton extends StatelessWidget {
  BottomSheetButton({
    this.onTap,
    this.text,
    this.textColor = Colors.black,
    this.radiusDirection = RadiusDirection.all,
    this.radius = 10,
  });
  final VoidCallback onTap;
  final String text;
  final Color textColor;

  ///圆角方向
  final RadiusDirection radiusDirection;

  final double radius;

  BorderRadius get _borderRadius {
    switch (radiusDirection) {
      case RadiusDirection.all:
        return BorderRadius.circular(radius);
      case RadiusDirection.bottom:
        return BorderRadius.vertical(bottom: Radius.circular(radius));
      case RadiusDirection.top:
        return BorderRadius.vertical(top: Radius.circular(radius));
      default:
        return BorderRadius.circular(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minHeight: 52),
        decoration:
        BoxDecoration(color: Colors.white, borderRadius: _borderRadius),
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
