import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reactive_variables/reactive_variables.dart';

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final ScrollController secondController;

  const ScrollToHideWidget(
      {super.key,
      required this.child,
      required this.controller,
      required this.secondController}
      );

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  final isVisible = true.rv;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
    widget.secondController.addListener(secondListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    widget.secondController.removeListener(secondListen);
    super.dispose();
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
    if(direction == ScrollDirection.forward){
      isVisible.value = true;
    } else if (direction == ScrollDirection.reverse){
      isVisible.value = false;
    }
  }

  void secondListen() {
    final direction = widget.secondController.position.userScrollDirection;
    if(direction == ScrollDirection.forward){
      isVisible.value = true;
    } else if (direction == ScrollDirection.reverse){
      isVisible.value = false;
    }
  }
  @override
  Widget build(BuildContext context) => isVisible.observer((context, value) =>
      AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: value ? kBottomNavigationBarHeight + 16 : 0,
        child: Wrap(children : [widget.child]),
      )
  ) ;
}
