import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  final bool loading;
  final bool disable;
  const MainButton({Key? key,required this.onTap,required this.child,this.loading=false,this.disable=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: disable?Colors.grey:Colors.blue,
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      child: InkWell(
        onTap: disable?null:onTap,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: Container(
            height: 55,
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child,
                if(loading)
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: SizedBox(height: 25,width: 25,child: CircularProgressIndicator(color: Colors.white,)),
                  )
              ],
            )
        ),
      ),
    );
  }
}