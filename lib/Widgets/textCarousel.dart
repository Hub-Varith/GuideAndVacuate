import 'package:Vacuate/constants.dart';
import 'package:flutter/material.dart';

class TextCarousel extends StatefulWidget {
  final List<String> texts;
  const TextCarousel({Key key, this.texts}) : super(key: key);

  _TextCarouselState createState() => _TextCarouselState();
}

class _TextCarouselState extends State<TextCarousel> {
  
  int textI = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
         textI = (textI+1) % widget.texts.length; 
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: Text(widget.texts[this.textI], style: subtleSubTextStyle, textAlign: TextAlign.center,),
      )
    );
  }
}