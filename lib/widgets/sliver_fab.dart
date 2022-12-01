library sliver_fab;

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:getx_sample/widgets/disable_scroll_glow_behavior.dart';

/// A helper class if you want a FloatingActionButton to be pinned in the FlexibleAppBar
// ignore: must_be_immutable
class SliverFab extends StatefulWidget {
  ///List of slivers placed in CustomScrollView
  final List<Widget> slivers;

  ///FloatingActionButton placed on the edge of FlexibleAppBar and rest of view
  final Widget floatingWidget;

  ///Expanded height of FlexibleAppBar
  final double expandedHeight;

  ///Number of pixels from top from which the [floatingWidget] should start shrinking.
  ///E.g. If your SliverAppBar is pinned, I would recommend this leaving as default 96.0
  ///     If you want [floatingActionButton] to shrink earlier, increase the value.
  final double topScalingEdge;

  final Function(bool value)? notifyFabToTopOffsetMoreThan70;

  ///Position of the widget.
  final FloatingPosition floatingPosition;

  const SliverFab({
    super.key,
    required this.slivers,
    required this.floatingWidget,
    this.floatingPosition = const FloatingPosition(right: 16),
    this.expandedHeight = 256.0,
    this.topScalingEdge = 96.0,
    this.notifyFabToTopOffsetMoreThan70,
  });

  @override
  State<StatefulWidget> createState() {
    return SliverFabState();
  }
}

class SliverFabState extends State<SliverFab> {
  late ScrollController scrollController;

  bool fabToTopOffsetMoreThan75 = true;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          scrollBehavior: DisableScrollGlowBehavior(),
          controller: scrollController,
          slivers: widget.slivers,
        ),
        _buildFab(),
      ],
    );
  }

  Widget _buildFab() {
    const double defaultFabSize = 56.0;
    final double paddingTop = MediaQuery.of(context).padding.top;
    final double defaultTopMargin =
        widget.expandedHeight + paddingTop + widget.floatingPosition.top - defaultFabSize / 2;

    final double scale0edge = widget.expandedHeight - kToolbarHeight;
    final double scale1edge = defaultTopMargin - widget.topScalingEdge;

    double top = defaultTopMargin;
    double scale = 1.0;

    if (scrollController.hasClients) {
      double offset = scrollController.offset;
      top -= offset > 0 ? offset : 0;
      if (top > 75) {
        if (fabToTopOffsetMoreThan75 != true) {
          widget.notifyFabToTopOffsetMoreThan70?.call(true);
          Fimber.d("DanhDue ExOICTIF: White: $top");
        }
        fabToTopOffsetMoreThan75 = true;
      } else {
        if (fabToTopOffsetMoreThan75 != false) {
          widget.notifyFabToTopOffsetMoreThan70?.call(false);
          Fimber.d("DanhDue ExOICTIF: MainGreen: $top");
        }
        fabToTopOffsetMoreThan75 = false;
      }
      if (offset < scale1edge) {
        scale = 1.0;
      } else if (offset > scale0edge) {
        scale = 0.0;
      } else {
        scale = (scale0edge - offset) / (scale0edge - scale1edge);
      }
    }

    return Positioned(
      top: top,
      right: widget.floatingPosition.right,
      left: widget.floatingPosition.left,
      child: Transform(
        transform: Matrix4.identity()..scale(scale, scale),
        alignment: Alignment.center,
        child: widget.floatingWidget,
      ),
    );
  }
}

///A class representing position of the widget.
///At least one value should be not null
class FloatingPosition {
  ///Can be negative. Represents how much should you change the default position.
  ///E.g. if your widget is bigger than normal [FloatingActionButton] by 20 pixels,
  ///you can set it to -10 to make it stick to the edge
  final double top;

  ///Margin from the right. Should be positive.
  ///The widget will stretch if both [right] and [left] are not nulls.
  final double right;

  ///Margin from the left. Should be positive.
  ///The widget will stretch if both [right] and [left] are not nulls.
  final double left;

  const FloatingPosition({this.top = 0, this.right = 0, this.left = 0});
}
