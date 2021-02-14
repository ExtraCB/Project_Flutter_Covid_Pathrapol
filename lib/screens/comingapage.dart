import 'package:flutter/material.dart';
import 'package:flutter_covid19_extcb/constants.dart';
import 'package:flutter_covid19_extcb/widgets/my_header.dart';

import 'package:url_launcher/url_launcher.dart';
import 'tracker.dart';

class ComingPage extends StatefulWidget {
  @override
  _ComingPageState createState() => _ComingPageState();
}

class _ComingPageState extends State<ComingPage> {
  final controller = ScrollController();
  double offset = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: "ทำความรู้จัก",
              textBottom: "เกี่ยวกับ Covid 19",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "อาการ",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/headache.png",
                          title: "ปวดหัว",
                          isActive: true,
                        ),
                        SizedBox(width: 20),
                        SymptomCard(
                          image: "assets/images/caugh.png",
                          title: "ไอ",
                        ),
                        SizedBox(width: 20),
                        SymptomCard(
                          image: "assets/images/fever.png",
                          title: "มีไข้",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("การป้องกัน", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 156,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: <Widget>[
                        Container(
                          height: 136,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 8),
                                blurRadius: 24,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                        ),
                        Image.asset("assets/images/wear_mask.png"),
                        Positioned(
                          left: 130,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            height: 136,
                            width: MediaQuery.of(context).size.width - 170,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "สวมหน้ากาก",
                                  style: kTitleTextstyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "คุณสามารถกดที่ลูกศรเพื่อดูว่าหน้่ากากแบบไหนที่สามารถป้องกันเชื้อได้",
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_forward_ios),
                                      onPressed: () => _maskurl(),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 156,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: <Widget>[
                        Container(
                          height: 136,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 8),
                                blurRadius: 24,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                        ),
                        Image.asset("assets/images/wash_hands.png"),
                        Positioned(
                          left: 130,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            height: 136,
                            width: MediaQuery.of(context).size.width - 170,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "ล้างมือ",
                                  style: kTitleTextstyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "คุณสามารถกดที่ลูกศรเพื่อดูวิธีการล้างมือที่ถูกต้อง",
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_forward_ios),
                                      onPressed: () => _washurl(),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("ตรวจสอบผู้ติดเชื้อ", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 156,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: <Widget>[
                        Container(
                          height: 136,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 8),
                                blurRadius: 24,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                        ),
                        Image.asset("assets/images/coronavirus.png"),
                        Positioned(
                          left: 130,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            height: 136,
                            width: MediaQuery.of(context).size.width - 170,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'ตรวจสอบผู้ติดเชื้อ',
                                  style: kTitleTextstyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'คุณสามารถกดที่ลูกศเพื่อดูผู้เชื้อ',
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_forward_ios),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Tracker()),
                                        );
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_goCovid19Page() {}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

_maskurl() async {
  const url = 'https://www.prachachat.net/general/news-578120';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_washurl() async {
  const url =
      'https://www.siphhospital.com/th/news/article/share/966/Hand-hygiene';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
