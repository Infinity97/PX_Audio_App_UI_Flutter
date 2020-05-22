import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';

class TileWidget extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final double elevation;
  final double borderRadius;
  final Color shadowColor;
  TileWidget({@required this.child, this.onTap = null, this.elevation = 14.0, this.borderRadius = 12.0, this.shadowColor = ColorConstants.orange, Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Material(
          elevation: elevation,
          borderRadius: BorderRadius.circular(borderRadius),
          shadowColor: shadowColor,
          child: InkWell
            (
              onTap: onTap,
              child: child
          )
      );
   }
}
