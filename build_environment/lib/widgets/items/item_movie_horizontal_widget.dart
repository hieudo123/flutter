import 'package:build_environment/common/app_constants.dart';
import 'package:build_environment/models/movie/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemMovieHorizontalWidget extends StatelessWidget {
  final int position;
  final int totalItem;
  final MovieModel movieModel;

  const ItemMovieHorizontalWidget({
    Key key,@required this.position, @required this.totalItem, this.movieModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136.0,
      margin: position == 0
          ? const EdgeInsets.only(right: 10)
          : position == totalItem - 1
          ? const EdgeInsets.only(left: 10,)
          : const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image(
            image: NetworkImage(AppConstants.kImageUrl + movieModel.posterPath),
            fit: BoxFit.cover,
            height: 196.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            movieModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppConstants.kSmallTextStyle,
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RatingBarIndicator(
                rating: movieModel.voteAverage * 0.5,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 10.0,
                direction: Axis.horizontal,
              ),
              Text(
                '${movieModel.voteAverage}',
                style: AppConstants.kSmallRatingTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}