import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class FlightList extends StatefulWidget {
  const FlightList({super.key});

  @override
  State<FlightList> createState() => _FlightListState();
}

class _FlightListState extends State<FlightList> {
  String selectedValue = 'price';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(46, 76, 72, 1),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.fromLTRB(0, 18, 18, 5),
            height: size.height * 0.065,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromRGBO(46, 76, 72, 1),
                ),
                Text(
                  'Ticket List',
                  style: TextStyle(
                    color: Color.fromRGBO(46, 76, 72, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //smainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Sort By",
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      value: selectedValue,
                                      dropdownColor:
                                          const Color.fromRGBO(46, 76, 72, 1),
                                      items: ['price', 'Date', 'Depart']
                                          .map((e) => DropdownMenuItem(
                                              value: e, child: Text(e)))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value!;
                                        });
                                      }),
                                ),
                                const Spacer(),
                                const CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  child: RotatedBox(
                                    quarterTurns: 1,
                                    child: Icon(
                                      Icons.sync_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Text(
                              '12 more flight to london',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                flex: 14,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 12,
                            ),
                            height: size.height * 0.3,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: destinationsDetail(context),
                                ),
                                Expanded(
                                  child: departmentDetails(),
                                ),
                                Expanded(
                                  child: priceAndDateDetails(),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          //top: size.height * 40,
                          bottom: 60,
                          left: -16,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Color.fromRGBO(46, 76, 72, 1),
                          ),
                        ),
                        Positioned(
                            //top: size.height * 40,
                            bottom: 72,
                            // left: -16,
                            child: SizedBox(
                              // color: const Color.fromRGBO(46, 76, 72, 1),
                              width: size.width - 20,
                              child: Flex(
                                direction: Axis.horizontal,
                                children: List.generate(
                                    (size.width / 6).floor(),
                                    (index) => Expanded(
                                        child: SizedBox(
                                            height: 6,
                                            child: Center(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20),
                                                width: 2.5,
                                                height: 2,
                                                color: index % 2 == 0
                                                    ? Colors.transparent
                                                    : const Color.fromRGBO(
                                                        46, 76, 72, 1),
                                              ),
                                            )))),
                              ),
                            )),
                        const Positioned(
                          //top: size.height * 40,
                          bottom: 60,
                          right: -16,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Color.fromRGBO(46, 76, 72, 1),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

priceAndDateDetails() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(30, 15, 0, 0),
    child: Row(
      children: [
        const Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Date",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              "12 MAY 2024",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ]),
        ),
        Expanded(child: Container()),
        Expanded(
            child: Container(
          height: 30,
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                20,
              ),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: const Center(
              child: Text(
            "\$600",
            style: TextStyle(fontSize: 20),
          )),
        ))
      ],
    ),
  );
}

departmentDetails() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
    child: Row(
      children: [
        const Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Depart",
            style: TextStyle(
                fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w300),
          ),
          Text(
            "7:40 AM",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ])),
        Expanded(
            flex: 2,
            child: Container(
              child: const Icon(
                Icons.flight_takeoff_rounded,
                size: 30,
                color: Colors.amber,
              ),
            )),
        const Expanded(
          child: Column(
            children: [
              Text(
                "Flight No",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "B843-E",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

destinationsDetail(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(30, 10, 15, 0),
    child: Row(children: [
      const Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "London",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(46, 76, 72, 1),
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "LDN",
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(46, 76, 72, 1),
                    fontWeight: FontWeight.w500),
              ),
            ],
          )),
      Expanded(
        flex: 2,
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CustomPaint(
                        painter: CurvePainter(),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          width: MediaQuery.sizeOf(context).width * 0.35,
                        ),
                      ),
                      const Positioned(
                          top: 4,
                          left: 60,
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Icon(
                              Icons.flight,
                              color: Colors.amber,
                            ),
                          )),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(46, 76, 72, 1),
                        radius: 8,
                      ),
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(46, 76, 72, 1),
                        radius: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Positioned(
                left: 60,
                bottom: 15,
                child: Text(
                  "8h 45m",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ))
          ],
        ),
      ),
      const Expanded(
          flex: 1,
          child: Column(
            children: [
              Text(
                "Aachan",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(46, 76, 72, 1),
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "AOC",
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(46, 76, 72, 1),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ))
    ]),
  );
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    double h = size.height;
    double w = size.width;
    paint.color = const Color.fromRGBO(46, 76, 72, 1);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    var startPoint = Offset(0, h);
    var controlPoint1 = Offset(w / 4, h / 4);
    var controlPoint2 = Offset(3 * w / 4, h / 4);
    var endPoint = Offset(w, h);
    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);
    //path_drawing package
    var curvePath = dashPath(path, dashArray: CircularIntervalList([5, 5]));
    canvas.drawPath(curvePath, paint);

    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
