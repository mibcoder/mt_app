import 'package:flutter/material.dart';
typedef WidgetBuilder = Widget Function(BuildContext context);

class AppDialog{
  AppDialog._();
  static void appSimpleDialog({required BuildContext buildContext, required WidgetBuilder builder,}){

    showGeneralDialog(
      barrierLabel: 'appSimpleDialog',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: buildContext,
      pageBuilder: (context, anim1, anim2) {

        return Dismissible(
            direction: DismissDirection.vertical,
            key: const Key('appSimpleDialog'),
            onDismissed: (_) => Navigator.of(context).pop(),
            child: Align(
                alignment: Alignment.center,
                child: builder(context))
        );
      },
      transitionBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
          ) {

        return ScaleTransition(
          alignment: Alignment.center,
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.ease,
            reverseCurve: Curves.ease,
          ),
          child: child,
        );

      },
    );
  }

  static void appConfirmation({required BuildContext buildContext,required String title,required String message, Function(bool)? onTap,Color color=Colors.blue}){

    showGeneralDialog(
      barrierLabel: "appConfirmation",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.2),
      transitionDuration: const Duration(milliseconds: 500),
      context: buildContext,
      pageBuilder: (context, anim1, anim2) {

        return Dismissible(
            direction: DismissDirection.vertical,
            key: const Key('appConfirmation'),
            onDismissed: (_) => Navigator.of(context).pop(),
            child:Align(
              alignment: Alignment.center,
              child: SizedBox(

                height: 409,
                width: 300,
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      height: 393.0,
                      constraints: const BoxConstraints(maxWidth: 287,minWidth: 287),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:  BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: Material(
                        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 125,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: const BorderRadius.all(Radius.circular(4.0))
                              ),
                              child: Image.asset('assets/icons/danger.png',height: 50.0,width: 50.0,),
                            ),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(4.0))
                                  ),
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(title,style: const TextStyle(color: Color(0xFF5A5A5A),fontSize: 24.0,fontWeight: FontWeight.w700),),
                                      const SizedBox(height: 5,),
                                      Text(message,textAlign: TextAlign.center,style: const TextStyle(color: Color(0xFF959595),fontSize: 16.0,fontWeight: FontWeight.w400),),
                                      Expanded(child: SizedBox(height: 1,)),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: color),
                                          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                        ),
                                        child: Material(
                                          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                          color: Colors.white,
                                          child: InkWell(
                                            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                            onTap: (){
                                              if(onTap!=null){
                                                onTap(true);
                                              }
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                height: 56,
                                                child: Text('Yes',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: color),)
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 12),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xFFAEAEAE)),
                                          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                        ),
                                        child: Material(
                                          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                          color: Colors.white,
                                          child: InkWell(
                                            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                            onTap: (){
                                              if(onTap!=null){
                                                onTap(false);
                                              }
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                height: 54,
                                                child: const Text('No',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Color(0xFFAEAEAE)),)
                                            ),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),
                                )
                            ),

                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            // to make elevation
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // Button color
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                  width: 36,
                                  height: 36,
                                  alignment: Alignment.center,
                                  child: Image.asset('assets/icons/close.png',width: 30,color:color,fit: BoxFit.cover,)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        );
      },
      transitionBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
          ) {

        return ScaleTransition(
          alignment: Alignment.center,
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.ease,
            reverseCurve: Curves.ease,
          ),
          child: child,
        );

      },
    );
  }

  static void showSnackBar(BuildContext context,{required String content,bool isError=false}){
    final snackBar = SnackBar(
      content: Text(content,style: const TextStyle(color: Colors.white),),
      backgroundColor: (isError?Colors.red:Colors.green),
      action: SnackBarAction(
        label: 'dismiss',
        textColor: Colors.white,
        onPressed: () {
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}