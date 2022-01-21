import 'package:flutter/material.dart';
import 'package:plant_b/models/activity.model.dart';
import 'package:plant_b/models/ticket.model.dart';
import 'package:plant_b/models/discount.model.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/core/carousel_item.dart';
import 'package:plant_b/models/user.model.dart';


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
                  "My Activities",
                  style: headline1
              ),
            ],),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: FutureBuilder(
            initialData: const [],
            future: getAllUserActivities(loggedUser.cc),
            builder: (context, AsyncSnapshot projectSnap) {
              if (projectSnap.connectionState == ConnectionState.none &&
                  projectSnap.hasData == false) {
                return Container();
              } else if (projectSnap.hasData) {
                return  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: projectSnap.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Activity activity = projectSnap.data[index];
                      return CarouselItem(
                          label: activity.getLabel(),
                          tokens: activity.token_reward.toString(),
                          positive: true,
                          img_url: activity.img_url,
                          onTap: () { }
                      );
                    }
                );
              } else {
                return Container();
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                  "My Discounts",
                  style: headline1
              ),
            ],),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: FutureBuilder(
            initialData: const [],
            future: getAllUserDiscounts(loggedUser.cc),
            builder: (context, AsyncSnapshot projectSnap) {
              if (projectSnap.connectionState == ConnectionState.none &&
                  projectSnap.hasData == false) {
                return Container();
              } else if (projectSnap.hasData) {
                return  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: projectSnap.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Discount discount = projectSnap.data[index];
                      return CarouselItem(
                          label: discount.getLabel(),
                          tokens: discount.token_cost.toString(),
                          positive: false,
                          img_url: discount.img_url,
                          onTap: () { }
                      );
                    }
                );
              } else {
                return Container();
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                  "My Tickets",
                  style: headline1
              ),
            ],),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: FutureBuilder(
            initialData: const [],
            future: getAllUserTickets(loggedUser.cc),
            builder: (context, AsyncSnapshot projectSnap) {
              if (projectSnap.connectionState == ConnectionState.none &&
                  projectSnap.hasData == false) {
                return Container();
              } else if (projectSnap.hasData) {
                return  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: projectSnap.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Ticket ticket = projectSnap.data[index];
                      return CarouselItem(
                          label: ticket.getLabel(),
                          tokens: ticket.token_cost.toString(),
                          positive: false,
                          img_url: ticket.img_url,
                          onTap: () { }
                      );
                    }
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}



