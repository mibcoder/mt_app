import 'package:flutter/material.dart';

class AppLogo extends StatefulWidget {
  late final double iconSize;
  final int animationTime;
  final bool animation;
  AppLogo({Key? key,required this.iconSize, this.animationTime=1000,this.animation=true}) : super(key: key);

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {

  bool doAnim = false;

  @override
  initState() {
    super.initState();
    if (widget.animation) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _startAnim());
    }
  }

  _startAnim() {
    setState(() {
      doAnim = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.iconSize,
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationTime),
        // alignment: Alignment.center,
        curve: Curves.bounceOut,
        height: doAnim ? widget.iconSize : widget.iconSize / 2,
        width: doAnim ? widget.iconSize : widget.iconSize / 2,
        padding: const EdgeInsets.only(right: 20.0, left: 20.0),
        // decoration: _getDecoration(),
        child: Image.asset('assets/icons/app_logo.png',),
      ),
    );
  }
  _getDecoration(){
    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(15.0),),
      // shape: BoxShape.circle,
      border: Border.all(width: 4, color: Colors.white, style: BorderStyle.solid,),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white,
          Colors.white,
        ],
      ),
      boxShadow: const [
        // to make elevation
        BoxShadow(
          color: Colors.black26,
          offset: Offset(2, 2),
          blurRadius: 4,
        ),
        // to make the coloured border
        // BoxShadow(
        //   color: Colors.blue,
        //   offset: Offset(0, 4),
        // ),
      ],
    );
  }
}