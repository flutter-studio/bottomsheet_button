
import 'package:flutter/material.dart';

class HiFiveVerticalDivider extends StatelessWidget {
  HiFiveVerticalDivider({this.height, this.color, this.margin});

  ///分割线高度
  final double height;

  ///分割线颜色
  final Color color;

  ///分割线外边距
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 12,
        width: 1,
        color: color ??  Color(0xffebebeb),
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 0));
  }
}

class HiFiveDivider extends StatelessWidget {
  HiFiveDivider({this.width,this.color,this.margin});
  final double width;
  final Color color;
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: width ?? double.infinity,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 0),
      color: color ?? Color(0xffebebeb),
    );
  }
}
