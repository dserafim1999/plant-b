import 'package:flutter/material.dart';
import 'package:plant_b/models/ticket.model.dart';
import 'package:plant_b/models/discount.model.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/core/carousel_item.dart';
import 'package:plant_b/popups/discount_popup.dart';
import 'package:plant_b/popups/ticket_popup.dart';


class RewardsCarousel extends StatelessWidget {
  const RewardsCarousel({Key? key}) : super(key: key);

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
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: discounts.length,
              itemBuilder: (BuildContext context, int index) {
                Discount discount = discounts[index];
                return CarouselItem(
                    label: discount.name,
                    tokens: discount.tokens.toString(),
                    positive: false,
                    onTap: () { openDiscountsDialog(discount); }
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
                  "Transportation Tickets",
                  style: headline1
              ),
            ],),
        ),
        const SizedBox(height: 20),
        SizedBox(
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
                    onTap: () { openTicketsDialog(ticket); }
                    );
              }
          ),
        ),
      ],
    );
  }
}



