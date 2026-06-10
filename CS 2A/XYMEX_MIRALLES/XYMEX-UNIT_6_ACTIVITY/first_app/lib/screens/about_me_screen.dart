import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../decorations.dart';

const String biography = '''
Hello! My name is Xymex. I'm a creative developer who's been making games since 2017. I've come from a long background of computer-related activities, gathering an assortment of skills along the way.
''';

//ABOUT ME SCREEN
class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.sizeOf(context).width >= 900;
    bool isScreenNarrow = MediaQuery.sizeOf(context).width <= 420;

    return Stack(
      children: [
        Column(
          children: [
            Flexible(
              flex: isScreenWide ? 3 : 4,
              child: Flex(
                direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                children: [
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        left: 4,
                        right: 4,
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 20,
                          right: 20,
                        ),
                        decoration: monitorScreenDec,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: isScreenNarrow ? 1 : 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: isScreenWide || isScreenNarrow
                                        ? BoxFit.fitHeight
                                        : BoxFit.fitWidth,

                                    alignment: FractionalOffset.center,
                                    image: AssetImage(
                                      'assets/images/profile_pic.png',
                                    ),
                                  ),
                                  border: BoxBorder.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ), // Profile
                            Expanded(
                              flex: isScreenNarrow ? 4 : 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: BoxBorder.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 8.0,
                                          ),
                                          child: Text(
                                            "Xymex B. Miralles",
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.sixtyfour(
                                              fontSize: 20,
                                              color: Colors.white,
                                              letterSpacing: 3,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Aspiring Game Dev",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.sixtyfour(
                                            fontSize: 10,
                                            color: Colors.white,
                                            letterSpacing: 3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ), //Name and Title
                          ],
                        ),
                      ),
                    ),
                  ), // Profile and Name
                  Flexible(
                    flex: isScreenWide ? 3 : 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        left: 4,
                        right: 4,
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 20,
                          right: 20,
                        ),
                        decoration: monitorScreenDec,
                        child: Container(
                          decoration: BoxDecoration(
                            border: BoxBorder.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                          bottom: 5.0,
                                          top: 5.0,
                                        ),
                                        child: CRTText("Profile", 15),
                                      ),
                                    ), //Profile Title
                                    DetailsSection(), //Details
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ), // Info Row
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  left: 4,
                  right: 4,
                ),
                child: Container(
                  decoration: monitorScreenDec,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 20,
                      right: 20,
                    ),
                    decoration: monitorScreenDec,
                    child: Container(
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Colors.white, width: 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                bottom: 5.0,
                                top: 5.0,
                              ),
                              child: CRTText("Biography", 15),
                            ),
                          ), //Biography Title
                          Expanded(
                            flex: 4,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                left: 8,
                                right: 8,
                                top: 10,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: BiographySection(),
                            ),
                          ), //Biography
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ), // Biography
          ],
        ),
      ],
    );
  }
}

class BiographySection extends StatelessWidget {
  BiographySection({super.key});
  final ScrollController _myController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: _myController,
      thumbVisibility: true,
      thumbColor: Colors.white,
      child: SingleChildScrollView(
        controller: _myController,
        child: CRTText(biography, 12),
      ),
    );
  }
}

class DetailsSection extends StatelessWidget {
  DetailsSection({super.key});
  final ScrollController _myController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white, width: 2)),
        ),
        child: RawScrollbar(
          controller: _myController,
          thumbVisibility: true,
          thumbColor: Colors.white,
          child: ListView(
            controller: _myController,
            padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
            children: [
              CRTTableRow("EMAIL:", "xymexxxx@gmail.com"),
              CRTTableRow("ABOUT:", "Student"),
              CRTTableRow("COURSE:", "BSCS - 2nd year"),
              CRTTableRow(
                "HOBBIES:",
                "Digital art\nGame Development\nMusic Production",
              ),
              CRTTableRow("LOCATION:", "Iloilo City, Philippines"),
            ],
          ),
        ),
      ),
    );
  }
}
