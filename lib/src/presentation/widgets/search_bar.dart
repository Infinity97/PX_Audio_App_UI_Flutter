import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/utils/helper.dart';
import 'package:flutter_ecommerce_youtube/src/utils/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}
//TODO: Adding Backend to this Functionality.
class SearchScreen extends StatelessWidget {
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Helper.symmetryPadding(),
          child: SearchBar<Post>(
            searchBarStyle: SearchBarStyle(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              //backgroundColor: ColorConstants.gradientOrangeEnd,
            ),
            hintText: "Search For Products, Categories and More",
            hintStyle: TextStyle(fontSize: SizeConfig.blockSizeVertical*2, color: ColorConstants.black),
            onSearch: search,
            onItemFound: (Post post, int index) {
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.description),
              );
            },
          ),
        ),
      ),
    );
  }
}