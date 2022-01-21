import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/models/activity.model.dart';
import 'package:plant_b/models/discount.model.dart';
import 'package:plant_b/popups/discount_popup.dart';
import 'package:plant_b/models/models.dart';


class CarouselItem extends StatelessWidget {
  final Function()? onTap;
  final String label;
  final String tokens;
  final bool positive;
  final String img_url;

  const CarouselItem({
    Key? key,
    required this.label,
    this.onTap,
    required this.tokens,
    required this.positive,
    required this.img_url,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 170.0,
        margin: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                bottom: 55.0,
                child: Container(
                  height: 75.0,
                  width: 170.0,
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
                      child: Container(
                        height: 170.0,
                        width: 170.0,
                        child: Image.network(img_url, fit: BoxFit.fitHeight),
                        ),
                    ),
                    Positioned(
                        bottom: 130,
                        left: 90,
                        child: Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(positive ? tokens : "-" + tokens),
                              CircleAvatar(radius: 10, backgroundImage: AssetImage("assets/token.png"),)
                            ],
                          )
                        )
                    ),
                  ],
                ),
              ),
            ]),
        ),
        );
  }


}



