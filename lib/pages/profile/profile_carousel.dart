import 'package:flutter/material.dart';
import 'package:plant_b/models/activity.model.dart';
import 'package:plant_b/models/ticket.model.dart';
import 'package:plant_b/models/discount.model.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/core/carousel_item.dart';


class ProfileCarousel extends StatelessWidget {
  const ProfileCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                  "Activity History",
                  style: headline1
              ),
            ],),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: activities.length,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = activities[index];
                return CarouselItem(
                    label: activity.name,
                    tokens: activity.tokens.toString(),
                    positive: true,
                );
              }
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                  "Discounts History",
                  style: headline1
              ),
            ],),
        ),
        const SizedBox(height: 20),
        /*SizedBox(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: discounts.length,
              itemBuilder: (BuildContext context, int index) {
                Discount discount = discounts[index];
                return CarouselItem(
                    label: discount.getLabel(),
                    tokens: discount.token_cost .toString(),
                    positive: false,
                );
              }
          ),
        ),*/
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                  "Ticket History",
                  style: headline1
              ),
            ],),
        ),
        const SizedBox(height: 20),
        /*SizedBox(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tickets.length,
              itemBuilder: (BuildContext context, int index) {
                Ticket ticket = tickets[index];
                return CarouselItem(
                    label: ticket.type,
                    tokens: ticket.tokens.toString(),
                    positive: false,
                );
              }
          ),
        ),*/
      ],
    );
  }
}



