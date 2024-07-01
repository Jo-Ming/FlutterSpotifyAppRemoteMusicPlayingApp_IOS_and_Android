import 'package:flutter/material.dart';

class DisplayImageWidget extends StatelessWidget {
  final String fileLocation;
  final double width;
  final double height;
  final double padding;
  final bool isNetworkImage;

  const DisplayImageWidget({
    super.key,
    required this.fileLocation,
    required this.width,
    required this.height,
    required this.padding,
    required this.isNetworkImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: isNetworkImage
              ? Image.network(fileLocation, fit: BoxFit.cover)
              : Image.asset(fileLocation, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
