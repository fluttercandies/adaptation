library adaptation;

import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class Adaptation extends StatefulWidget {
  final Widget child;
  final double designWidth;

  const Adaptation({
    Key key,
    @required this.child,
    this.designWidth = 375,
  }) : super(key: key);

  @override
  _AdaptationState createState() => _AdaptationState();
}

class _AdaptationState extends State<Adaptation> {
  double get designWidth => widget.designWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) {
        print('box = $box');
        final data = MediaQueryData.fromWindow(ui.window);
        final scale = data.size.width / designWidth;
        final childTargetHeight = data.size.height / scale;

        final childSize = Size(designWidth, childTargetHeight);

        print('scale = $scale');
        print('src size = ${data.size}');
        print('dst size = $childSize');

        final w = Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: Transform.scale(
              scale: scale,
              child: OverflowBox(
                maxWidth: childSize.width,
                maxHeight: childSize.height,
                // size: childSize,
                child: widget.child,
              ),
            ),
          ),
        );
        if (scale >= 1) {
          return w;
        } else {
          return w;
        }
      },
    );
  }
}
