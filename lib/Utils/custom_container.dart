import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color? color;
  final double borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final AlignmentGeometry alignment;

  const CustomContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.padding = const EdgeInsets.all(12),
    this.margin = EdgeInsets.zero,
    this.color,
    this.borderRadius = 12,
    this.border,
    this.boxShadow,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}