import 'package:daily_coding/widgets/animCategoryItem.dart';
import 'package:flutter/material.dart';

class AnimCategoryContainer extends StatefulWidget {
  final CategoryBean categoryBean;

  AnimCategoryContainer(this.categoryBean);

  @override
  _AnimCategoryContainerState createState() => _AnimCategoryContainerState();
}

class _AnimCategoryContainerState extends State<AnimCategoryContainer>
    with SingleTickerProviderStateMixin {
  bool isExpanded;
  AnimationController controller;
  Animation<EdgeInsetsGeometry> marginAnim;
  Animation<BorderRadius> radiusAnim;

  @override
  void initState() {
    super.initState();
    isExpanded = false;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    marginAnim = Tween(
      begin: EdgeInsets.symmetric(horizontal: 16),
      end: EdgeInsets.zero,
    ).animate(controller);
    radiusAnim = BorderRadiusTween(
      begin: BorderRadius.circular(16),
      end: BorderRadius.zero,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listItems = widget.categoryBean.categoryItems
        .map(buildAnimCategoryItem)
        .toList()
          ..add(SizedBox(height: 12));

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          margin: marginAnim.value,
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: radiusAnim.value,
            ),
            color: Colors.cyan.shade700,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                widget.categoryBean.onTap();
                onTap();
              },
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          child: Icon(
                            widget.categoryBean.icon,
                            size: 48,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.categoryBean.title,
                            style: TextStyle(color: Colors.white, fontSize: 30),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                  ClipRect(
                    child: Align(
                      heightFactor: controller.value,
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: isExpanded || controller.isDismissed
          ? Column(children: listItems)
          : null,
    );
  }

  void onTap() {
    isExpanded = !isExpanded;
    if (isExpanded) {
      controller.forward();
      setState(() {});
    } else {
      controller.reverse().then<void>((value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }
}
