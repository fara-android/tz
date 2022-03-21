import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final String image;
  final int likeCount;
  const CustomImageContainer({
    Key? key,
    required this.image,
    required this.likeCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 280,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Icon(
              CupertinoIcons.heart_fill,
              size: 36,
              color: Colors.red,
            ),
            SizedBox(width: 6),
            Text(
              '$likeCount',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ],
    );
  }
}
