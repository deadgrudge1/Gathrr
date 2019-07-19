import 'package:flutter/material.dart';
import 'package:flutter_app/ui/login.dart';
import 'package:flutter_app/walkthrough.dart';
import 'strings_class.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade900,
            Colors.blue.shade500
          ],
        ),
      ),
      //color: Colors.blueAccent,
        //(0xFFEEEEEE),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: <Widget>[
                Walkthrough(
                  title: StringsClass.wt1,
                  content: StringsClass.wc1,
                  imageIcon: Icons.group_add,
                ),
                Walkthrough(
                  title: StringsClass.wt2,
                  content: StringsClass.wc2,
                  imageIcon: Icons.aspect_ratio,
                ),
                Walkthrough(
                  title: StringsClass.wt3,
                  content: StringsClass.wc3,
                  imageIcon: Icons.person,
                ),
                Walkthrough(
                  title: StringsClass.wt4,
                  content: StringsClass.wc4,
                  imageIcon: Icons.notifications_active,
                ),
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(lastPage ? "" : StringsClass.skip,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () =>
                  lastPage ? null : Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login()),
                  ),
                ),
                FlatButton(
                  child: Text(lastPage ? StringsClass.gotIt : StringsClass.next,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login()),
                  )
                      : controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
