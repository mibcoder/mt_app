import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DatePicker extends StatelessWidget {
  final Function() onClose;
  final Function(DateTime) onDateTimeChanged;
  const DatePicker({Key? key,required this.onClose,required this.onDateTimeChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        child: SizedBox(
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('Select DOB',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                  ),
                  TextButton(onPressed: onClose, child: const Text('Close'),)
                ],
              ),
              Container(height: 1,color: Colors.grey.withOpacity(0.2),),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged:onDateTimeChanged,
                  initialDateTime: DateTime.now(),
                  // minimumYear: DateTime.now(),
                  maximumYear: DateTime.now().year,
                ),
              ),
              Container(height: 1,color: Colors.grey.withOpacity(0.2),),
              Material(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  onTap: onClose,
                  child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    child: const Text('Done',style: TextStyle(color: Colors.blue),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}