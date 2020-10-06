import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0, 0),
            blurRadius: 10,
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(
            "https://pbs.twimg.com/profile_images/1302411195497013249/rtRci80A_400x400.jpg",
          ),
        ),
      ),
    );
  }
}
