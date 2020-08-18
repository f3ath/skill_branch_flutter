import 'package:FlutterGalleryApp/res/res.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Photo extends StatelessWidget {
  const Photo({Key key, this.photoLink}) : super(key: key);

  final String photoLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(17)),
        child: Container(
          color: AppColors.grayChateau,
          child: CachedNetworkImage(
            imageUrl: photoLink,
            fit: BoxFit.fill,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
