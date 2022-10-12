import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class CircularImage extends StatefulWidget {
  final Function(String)? onImage;
  final double size;
  const CircularImage({Key? key, this.onImage,this.size=100}) : super(key: key);

  @override
  State<CircularImage> createState() => _CircularImageState();
}

class _CircularImageState extends State<CircularImage> {

  String fullPath='';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color:  Colors.grey,
          style: BorderStyle.solid,
        ),
      ),
      child: Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();

            // Step 1: Retrieve image from picker
            final XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);

            // Step 2: Check for valid file
            if (image == null) return;

            // Step 3: Get directory where we can duplicate selected file.
            Directory appDocDir = await getApplicationDocumentsDirectory();
            String duplicateFilePath = appDocDir.path;

            // Step 4: Copy the file to a application document directory.
            final fileName = basename(image.path);

            setState((){
              fullPath = '$duplicateFilePath/$fileName';
            });

            await image.saveTo(fullPath);

            if(widget.onImage!=null){
              widget.onImage!(fullPath);
            }

          },
          customBorder: const CircleBorder(),
          child: Container(
            width: widget.size,
            height: widget.size,
            alignment: Alignment.center,
            child: fullPath.isEmpty ? Icon(FontAwesomeIcons.camera,color: Colors.grey.withOpacity(.4),size: 40,) :
              CircleAvatar(backgroundImage: FileImage(File(fullPath),),
                  radius: widget.size/2, backgroundColor: Colors.white)),
        ),
      ),
    );
  }
}
