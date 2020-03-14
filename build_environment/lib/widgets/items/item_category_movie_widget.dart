import 'package:build_environment/common/app_constants.dart';
import 'package:build_environment/models/movie/movie_model.dart';
import 'package:flutter/material.dart';

import 'item_movie_horizontal_widget.dart';

class ItemCategoryMovieWidget extends StatelessWidget {
  final String mTitle;
  final List<MovieModel> mListMovie;
  final Widget actionWidget;
  final Function(MovieModel) onTapItem;

  const ItemCategoryMovieWidget({
    Key key, this.mTitle, this.mListMovie, this.actionWidget, this.onTapItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                mTitle,
                style: AppConstants.kSmallTitleTextStyle,
              ),
              actionWidget ?? Container()
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          SizedBox(
            height: 250.0,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: mListMovie.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){},
                  child: ItemMovieHorizontalWidget(
                    movieModel: mListMovie[index],
                    totalItem: mListMovie.length,
                    position: index,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}