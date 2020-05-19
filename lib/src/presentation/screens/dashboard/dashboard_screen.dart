import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/independent/tile_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      children: <Widget>[
        TileWidget(
          child: Padding
            (
            padding: const EdgeInsets.all(24.0),
            child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                    (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text('Total Products Bought', style: TextStyle(color: Colors.blueAccent)),
                      Text('265K', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0))
                    ],
                  ),
                  Material
                    (
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center
                        (
                          child: Padding
                            (
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                          )
                      )
                  )
                ]
            ),
          ),
        ),
        TileWidget(child:
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column
              (
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  Material
                    (
                      color: Colors.teal,
                      shape: CircleBorder(),
                      child: Padding
                        (
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(Icons.settings_applications, color: Colors.white, size: 30.0),
                      )
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text('General', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                  Text('Images, Videos', style: TextStyle(color: Colors.black45)),
                ]
            ),
          ),
        ),
        TileWidget(child:
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column
            (
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>
              [
                Material
                  (
                    color: Colors.teal,
                    shape: CircleBorder(),
                    child: Padding
                      (
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(Icons.settings_applications, color: Colors.white, size: 30.0),
                    )
                ),
                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                Text('General', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                Text('Images, Videos', style: TextStyle(color: Colors.black45)),
              ]
          ),
        ),
        ),
      ],
      staggeredTiles: [
        StaggeredTile.extent(2, 110.0),
        StaggeredTile.extent(1, 180.0),
        StaggeredTile.extent(1, 180),
      ],
    );
  }
}
