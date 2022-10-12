import 'package:flutter/material.dart';

class AppAnimatedContainer extends StatefulWidget {
  final Widget child;
  const AppAnimatedContainer({Key? key, required this.child}) : super(key: key);

  @override
  State<AppAnimatedContainer> createState() => _AppAnimatedContainerState();
}

class _AppAnimatedContainerState extends State<AppAnimatedContainer> {

  bool doAnim = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _afterWidgetsBind());
  }

  void _afterWidgetsBind() {
    setState(() {
      doAnim = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.ease,
      margin: EdgeInsets.only(top: doAnim ? 0 : 70),
      child: widget.child,
    );
  }
}
