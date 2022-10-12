import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mt_app/features/onboard/presentation/pages/registration_page.dart';

import '../widgets/app_logo.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // To hide statusBar without appBar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _pageBindingDone());
  }

  _pageBindingDone(){
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegistrationPage()),);
    });
  }

  @override
  void dispose() {
    // To show statusBar without appBar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:const Color(0xFFFCFCFC),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        alignment: Alignment.center,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(iconSize: 250.0,),
            AnimatedTextKit(
              isRepeatingAnimation:false,
              animatedTexts: [
                TypewriterAnimatedText(
                    'Mobile Technologies',
                    cursor:'',
                    textAlign: TextAlign.center,
                    textStyle:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black87),
                    speed:const Duration(milliseconds: 50)
                ),
              ],

            ),
          ],
        ),
      ),
    );

  }
}
