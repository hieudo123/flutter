import 'package:build_environment/common/app_colors.dart';
import 'package:build_environment/common/app_constants.dart';
import 'package:build_environment/common/app_fonts.dart';
import 'package:build_environment/common/app_strings.dart';
import 'package:build_environment/models/category_model.dart';
import 'package:build_environment/models/movie/movie_model.dart';
import 'package:build_environment/screens/movie/bloc/categories_bloc.dart';
import 'package:build_environment/screens/movie/bloc/categories_state.dart';
import 'package:build_environment/widgets/items/item_category_movie_widget.dart';
import 'package:build_environment/widgets/items/item_large_movie_widget.dart';
import 'package:build_environment/widgets/items/item_movie_horizontal_widget.dart';
import 'package:build_environment/widgets/round_icon_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieScreen extends StatefulWidget {
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  CategoriesBloc _categoriesBloc;
  int selectedItem = 0;

  @override
  void initState() {
    _categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.only(bottom: 24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTopWidget(),
            BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesInitial)
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                if (state is CategoriesLoaded)
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _buildSliderWidget(state.categories[AppStrings.kNowPlaying]),
                      SizedBox(
                        height: 24.0,
                      ),
                      ItemCategoryMovieWidget(
                        mListMovie: state.categories[AppStrings.kPopular],
                        onTapItem: (item){},
                        mTitle: AppStrings.kPopular,
                        actionWidget: GestureDetector(
                          onTap: (){},
                          child: Text(
                            AppStrings.kMore,
                            style: AppConstants.kWhite30TextStyle,
                          ),
                        ),
                      ),
                      ItemCategoryMovieWidget(
                        mListMovie: state.categories[AppStrings.kTopRated],
                        onTapItem: (item){},
                        mTitle: AppStrings.kTopRated,
                        actionWidget: GestureDetector(
                          onTap: (){},
                          child: Text(
                            AppStrings.kMore,
                            style: AppConstants.kWhite30TextStyle,
                          ),
                        ),
                      ),
                      ItemCategoryMovieWidget(
                        mListMovie: state.categories[AppStrings.kUpcoming],
                        onTapItem: (item){},
                        mTitle: AppStrings.kUpcoming,
                        actionWidget: GestureDetector(
                          onTap: (){},
                          child: Text(
                            AppStrings.kMore,
                            style: AppConstants.kWhite30TextStyle,
                          ),
                        ),
                      ),
                    ],
                  );
                return new Container();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSliderWidget(List<MovieModel> list) {
    return SizedBox(
      height: 360.0,
      child: Stack(
        children: <Widget>[
          CarouselSlider.builder(
            itemCount: list.length,
            height: 360.0,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            initialPage: 0,
            enlargeCenterPage: true,
            pauseAutoPlayOnTouch: Duration(seconds: 8),
            itemBuilder: (BuildContext context, int index) =>
                ItemLargeMovieWidget(
                  imageUrl: list[index].posterPath,
                ),
            onPageChanged: (currentPosition) {
              setState(() {
                selectedItem = currentPosition;
                print('position : $selectedItem');
              });
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Wrap(
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.symmetric(vertical: 24.0),
                    color: Color(0x80000000),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          list[selectedItem].title,
                          style: AppConstants.kSmallTitleTextStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          list[selectedItem].releaseDate,
                          style: AppConstants.kNormalTextStyle,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        RatingBarIndicator(
                          rating: list[selectedItem].voteAverage * 0.5,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 14.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopWidget() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            AppStrings.kMovie,
            style: AppConstants.kLargeTitleTextStyle,
          ),
          RoundIconButton(
            onPressed: () {},
            mColor: AppColors.kAppBarColor,
            mIcon: Icons.search,
            mSize: 36.0,
          )
        ],
      ),
    );
  }
}
