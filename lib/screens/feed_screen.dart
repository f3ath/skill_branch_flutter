import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  static const flutterDash =
      'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png';

  @override
  State<StatefulWidget> createState() {
    return _FeedState();
  }
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            print(index);
            return Column(children: [
              _buildItem(),
              Text('#$index'),
              Divider(
                thickness: 2,
                color: AppColors.mercury,
              ),
            ]);
          }),
    );
  }

  Widget _buildItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Photo(
          photoLink: Feed.flutterDash,
        ),
        _buildPhotoMeta(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Text(
            'This is Flutter Dash.',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.h3.copyWith(color: AppColors.manatee),
          ),
        )
      ],
    );
  }

  Widget _buildPhotoMeta() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              UserAvatar('https://skill-branch.ru/img/speakers/Adechenko.jpg'),
              SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Kirill Ad',
                    style: AppStyles.h2Black,
                  ),
                  Text(
                    '@ololo',
                    style: AppStyles.h5Black.copyWith(color: AppColors.manatee),
                  ),
                ],
              )
            ],
          ),
          LikeButton(10, true),
        ],
      ),
    );
  }
}
