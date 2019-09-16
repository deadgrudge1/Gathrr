import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/util/image_picker_handler.dart';

class ImagePickerGetter extends StatefulWidget {
  @override
  _ImagePickerGetterState createState() => _ImagePickerGetterState();
}

class _ImagePickerGetterState extends State<ImagePickerGetter>
    with TickerProviderStateMixin,ImagePickerListener {

  File _image;
  AnimationController _controller;
  ImagePickerHandler imagePicker;

  @override
  void initState() {

    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    imagePicker=new ImagePickerHandler(this,_controller);
    imagePicker.init();

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => imagePicker.showDialog(context),
      child: Center(
        child: _image == null
            ? new Stack(
          children: <Widget>[

            Center(
              child: new CircleAvatar(
                radius: 80.0,
                backgroundColor: const Color(0xFF778899),
              ),
            ),

          ],
        )
            : Container(
          height: 160.0,
          width: 160.0,
          decoration: BoxDecoration(
            color: Color(0xff7c94b6),
            image: DecorationImage(
              image: ExactAssetImage(_image.path),
              fit: BoxFit.cover,
            ),
            border:
            Border.all(color: Colors.blue, width: 5.0),
            borderRadius:
            BorderRadius.all(const Radius.circular(80.0)),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }
}
