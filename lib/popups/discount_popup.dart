import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/models/discount.model.dart';
import 'package:plant_b/models/user.model.dart';
import 'package:plant_b/popups/code_popup.dart';


class DiscountPopup extends StatelessWidget {
  final Discount discount;

  const DiscountPopup({
    Key? key,
    required this.discount
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Future openCodeDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return CodePopup(label:"Discount Code", qrCodeValue: discount.qr_code, description: "Present this code to the corresponding vendor in order to redeem your discount. This code is personal and valid only once. You can access it again in the Profile Menu.",);
        }
    );

    Future openConfirmationDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            contentPadding: const EdgeInsets.all(20.0),
            content: Container(
              height: 200,
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text("Are you sure you want to redeem this discount?", style: headline, textAlign: TextAlign.center),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff63982e),
                          onPrimary: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          textStyle: const TextStyle(fontSize: 20)
                        ),
                        child: const Text('No'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          addUserDiscount(loggedUser, discount.qr_code);
                          openCodeDialog();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff63982e),
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            textStyle: const TextStyle(fontSize: 20)
                        ),
                        child: const Text('Yes'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
    );

    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      contentPadding: const EdgeInsets.all(20.0),
      content: SizedBox(
        height: 600,
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                height: 175.0,
                width: 300.0,
                child: Image.network(discount.img_url, fit: BoxFit.fitHeight),
              ),
            ),
            const SizedBox(height: 20),
            Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                  color: const Color(0xffe5e5e5),
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(discount.getLabel(), style: headline2),
                              const SizedBox(height: 20,),
                              Text(discount.description, style: headline4),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: [
                                  Text("Shop: ", style: headline2),
                                  Text(discount.shop.toString(), style: TextStyle(fontSize: 18)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Amount: ", style: headline2),
                                  Text(discount.amount.toString() + (discount.type == "percentage" ? '%' : '€'), style: TextStyle(fontSize: 18)),
                                ],
                              ),
                            ],
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Tokens Required:", style: headline2),
                                Row(
                                  children: [
                                    Text(discount.token_cost.toString(), style: TextStyle(fontSize: 18)),
                                    SizedBox(width: 5),
                                    CircleAvatar(radius: 10, backgroundImage: AssetImage("assets/token.png"))
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                /*
                                ElevatedButton(
                                  onPressed: () {
                                    // Respond to button press
                                  },
                                  style:  ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(const Color(0xff63982e)),
                                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))
                                  ),
                                  child: Text('Back'),
                                ),*/
                                ElevatedButton(
                                  onPressed: () {
                                    openConfirmationDialog();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff63982e),
                                      onPrimary: Colors.white,
                                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                      textStyle: const TextStyle(fontSize: 20)
                                  ),
                                  child: const Text('Confirm'),
                                ),
                              ],
                            )
                          ],
                        ),
                      )

            ],
                )
            ),
          ],
        ),
      ),
    );
  }

}



