import 'package:FlutterGalleryApp/res/colors.dart';
import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FullScreenImage extends StatelessWidget {
  FullScreenImage(
      {this.photo = '',
      this.name = '',
      this.userName = '',
      this.altDescription = '',
      Key key})
      : super(key: key);

  final String photo;
  final String name;
  final String userName;
  final String altDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBar(
            title: Text('Photo'),
            leading: IconButton(
              icon: Icon(CupertinoIcons.back),
              onPressed: () {},
            ),
          ),
          Photo(
            photoLink: photo,
          ),
          Text(
            altDescription,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.h3,
          ),
          Text(
            name,
            style: AppStyles.h1Black,
          ),
          Text(
            '@$userName',
            style: AppStyles.h5Black.copyWith(color: AppColors.manatee),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.dodgerBlue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('Save')),
                onTap: () {},
              ),
              GestureDetector(
                child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.dodgerBlue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('Visit')),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
