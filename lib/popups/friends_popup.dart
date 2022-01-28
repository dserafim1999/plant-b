import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/models/user.model.dart';
import 'package:plant_b/pages/scanner/scanner.dart';
import 'package:plant_b/pages/social/friend.dart';
import 'package:plant_b/popups/code_popup.dart';


class FriendsPopup extends StatefulWidget {
  const FriendsPopup({
    Key? key,
  }) : super(key: key);

  @override
  State<FriendsPopup> createState() => _FriendsPopupState();
}

class _FriendsPopupState extends State<FriendsPopup> {
  Future _myData = getUserFriends();

  rebuildPage() {
    setState(() {});
  }

  Future openCodeDialog() => showDialog(
      context: context,
      builder: (BuildContext context) {
        return CodePopup(label:"Your Code", qrCodeValue: loggedUser.toString(), description: "Let your friends scan your code to add you to their friends list. They will not be added to your Friends in return.",);
      }
  );

  Future openConfirmationDialog(BuildContext context, User user) => showDialog(
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
                Text("Are you sure you want to unfriend ${user.name}?", style: headline, textAlign: TextAlign.center),
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
                        deleteUserFriend(loggedUser, user.cc);
                        setState(() { _myData = getUserFriends(); });
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

  @override
  Widget build(BuildContext context) {
    Future openCodeDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return CodePopup(label:"Your Code", qrCodeValue: loggedUser.toString(), description: "Let your friends scan your code so you can be added to their friends list. They will not be added to your friends.");
        }
    );



    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      contentPadding: const EdgeInsets.all(20.0),
      content: SizedBox(
        height: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 475,
              width: 350,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.withOpacity(0.2)),
              child: FutureBuilder(
                  initialData: const[],
                  future: _myData,
                  builder: (context, AsyncSnapshot projectSnap) {
                    if (projectSnap.connectionState == ConnectionState.none &&
                        projectSnap.hasData == false) {
                      return Container();
                    } else if (projectSnap.hasData){
                      return  Grid(context, projectSnap.data);
                    }  else {
                      return Container();
                    }
                  }
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  friendButton(Icons.qr_code_scanner, false),
                  friendButton(Icons.person_add, true)
                ],
              ),
          ],
        )
      ),
    );
  }

  Widget Grid(BuildContext context, friends) => Padding(
    padding: const EdgeInsets.all(5.0),
    child: Scrollbar(
      isAlwaysShown: true,
      child: GridView.builder(
          // 4
          itemCount: friends.length,
          // 5
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            // 6
            final friend = friends[index];

            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage(friend.img_url), radius: 50,),
                    SizedBox(height: 10),
                    Text(friend.name),
                  ],
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: RawMaterialButton(
                      onPressed: () {
                        openConfirmationDialog(context, friend);
                      },
                      elevation: 2.0,
                      fillColor: Colors.red,
                      child: Icon(
                        Icons.close,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(5.0),
                      shape: CircleBorder(),
                    )
                )
              ]
            );
          },
      ),
    ),
  );

  Widget friendButton(IconData? icon, bool isPopup) => InkWell(
    onTap: () async {
      if (isPopup) {
        openCodeDialog();
      } else {
        final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Scanner()),
        );

        Navigator.pop(context);
      }
      rebuildPage();
    },
    child: Container(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: new BoxDecoration(
                color: Color(0xff63982e),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            child: Icon(icon, color: Colors.white, size: 75),
          ),
        ),
  );
}



