import 'package:build_environment/common/app_constants.dart';
import 'package:flutter/material.dart';

class ItemLargeMovieWidget extends StatelessWidget {
  final String imageUrl;

  const ItemLargeMovieWidget({
    Key key, this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(AppConstants.kImageUrl + imageUrl
          ),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
