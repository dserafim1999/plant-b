import 'package:flutter/material.dart';
import 'package:plant_b/models/ticket.model.dart';
import 'package:plant_b/models/discount.model.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/core/carousel_item.dart';
import 'package:plant_b/popups/discount_popup.dart';
import 'package:plant_b/popups/ticket_popup.dart';


class RewardsCarousel extends StatefulWidget {
  const RewardsCarousel({Key? key}) : super(key: key);

  @override
  State<RewardsCarousel> createState() => _RewardsCarouselState();
}

class _RewardsCarouselState extends State<RewardsCarousel> {
  @override
  Widget build(BuildContext context) {
    Future openDiscountsDialog(Discount discount) => showDialog(
        context: context,
        builder: (BuildContext context) {
            return DiscountPopup(discount: discount);
        }
    );

    Future openTicketsDialog(Ticket ticket) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return TicketPopup(ticket: ticket);
        }
    );

    return Column(
      children: <Widget>[
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                  "Discounts",
                  style: headline1
              ),
            ],),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: FutureBuilder(
            initialData: const [],
            future: getAllDiscounts(),
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
                          onTap: () { openDiscountsDialog(discount); }
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
                  "Transportation Tickets",
                  style: headline1
              ),
            ],),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: FutureBuilder(
            initialData: const [],
            future: getAllTickets(),
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
                          onTap: () { openTicketsDialog(ticket); }
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



