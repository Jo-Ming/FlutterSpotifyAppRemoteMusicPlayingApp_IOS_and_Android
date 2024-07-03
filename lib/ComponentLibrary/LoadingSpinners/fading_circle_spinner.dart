import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FadingCircleSpinner extends StatelessWidget {
  final double size;
  final Color color;
  final Duration duration;

  const FadingCircleSpinner(
      {super.key,
      required this.size,
      required this.color,
      required this.duration});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: color,
      size: size,
      duration: duration,
    );
  }
}
