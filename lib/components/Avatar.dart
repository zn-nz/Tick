import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image(
          width: 80.0,
          height: 80.0,
          image: AssetImage("assets/images/avatar.png"),
          fit: BoxFit.fill,
        ),
      ),
      Container(
        width: 80.0,
        alignment: Alignment.topRight,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            width: 20.0,
            height: 20.0,
            image: AssetImage("assets/images/avatar.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ]);
  }
}
