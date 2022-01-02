import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';


class CarouselItem extends StatelessWidget {
  final Function()? onTap;
  final String label;
  //final String imagePath

  const CarouselItem({
    Key? key,
    required this.label,
    this.onTap,
    // this.imagePath,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 200.0,
        margin: const EdgeInsets.all(10.0),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              bottom: 20.0,
              child: Container(
                height: 80.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)
               ),
             child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    const SizedBox(height: 20),
                    Text(
                      this.label,
                      style: headline4,
                      maxLines: 2,
                    )
                  ]),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                  ),
                ),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: const Image(
                    height: 200.0,
                    width: 200.0,
                    image: AssetImage("assets/placeholder.jpg"),
                    ),
                  )
                ],
              )
            ),
          ]),
        );
  }
}



