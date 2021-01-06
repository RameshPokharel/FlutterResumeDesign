import 'package:flutter/material.dart';
import 'package:flutter_app_resume/model/specialization.dart';
import 'package:flutter_app_resume/home/specialization/stack_experience.dart';
class Specialization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: 575,
      margin: EdgeInsets.only(bottom: screenSize.height * 0.05),
      child: Container(
        child: Stack(children: [
          Container(
            child: Card(
              margin: EdgeInsets.all(0),
              color: Color(0xffFAF9FB),
              child: Container(
                margin: EdgeInsets.symmetric(vertical:screenSize.height * 0.05,horizontal: 8),
                width: double.infinity,
                height: 250,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          "WHAT I DO",
                          style: TextStyle(
                              color: Color(0xff498CF4).withAlpha(200),
                              letterSpacing: 2,
                              fontWeight: FontWeight.normal,
                              fontSize: 10),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "SPECILIZING IN",
                          style: TextStyle(
                              color: Color(0xff498CF4),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.04,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: GridView.count(
                            // Create a grid with 2 columns. If you change the scrollDirection to
                            // horizontal, this produces 2 rows.
                            physics: ScrollPhysics(),
                            crossAxisCount: 2,
                            scrollDirection: Axis.vertical,
                            childAspectRatio: 11 / 4,
                            primary: false,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 6,
                            shrinkWrap: true,
                            // Generate 100 widgets that display their index in the List.
                            children: List.generate(4, (index) {
                              return Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            specializations[index].startColor,
                                            specializations[index].endCOlor
                                          ]),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                              image: AssetImage(
                                                  specializations[index].icon)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        constraints: BoxConstraints(
                                            maxHeight: 15, maxWidth: 15)),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                             specializations[index].title,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.2,
                                                color: Color(0xff394562),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                             specializations[index].detail1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xffA6ACCC),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                            specializations[index].dtail2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xffA6ACCC),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          StackExperience(screenSize: screenSize)
        ]),
      ),
    );
  }
}
