
import 'package:flutter/material.dart';
import 'package:sport_connect/Helpers/designs.dart';

class SportTile extends StatefulWidget {
  const SportTile({Key? key, required this.title,
    required this.image, required this.document,}) : super(key: key);
  final String title;
  final String image;
  final Map<String, dynamic> document;

  @override
  State<SportTile> createState() => _SportTileState();
}

class _SportTileState extends State<SportTile> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(Designs.radius13),
          child: Image.asset(widget.image),),
        const SizedBox(height: 10,),
        Text(widget.title, style: Designs.primaryFont,),
      ],
    );
  }
}
