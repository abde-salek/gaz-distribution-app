import 'package:flutter/material.dart';


class CollectPayment extends StatelessWidget {
  const CollectPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'SpaceGrotesk',
      ),
      home: Scaffold(
        body: ListView(children: [
          Collect(),
        ]),
      ),
    );
  }
}

class Collect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity / 3,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFF9F9F9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    Positioned(
                      left: 169,
                      top: 14,
                      child: Container(
                        width: 65,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 5,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: const Color(0xFFACACAC),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 260,
                padding: const EdgeInsets.symmetric(vertical: 11),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 26,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 21,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 106,
                            top: 0,
                            child: Text(
                              'Collect Payment',
                              style: TextStyle(
                                color: const Color(0xFF1B3F77),
                                fontSize: 24,
                                fontFamily: 'Space Grotesk',
                                fontWeight: FontWeight.w700,
                                height: 0.88,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 48,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 52,
                            top: 0,
                            child: Container(
                              width: 299,
                              height: 48,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFD9D9D9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 14,
                                    child: Container(
                                      width: 299,
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        spacing: 10,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 21,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: SizedBox(
                                                    width: 181,
                                                    child: Text(
                                                      'Enter the amount received',
                                                      style: TextStyle(
                                                        color: const Color(0xFF66707F),
                                                        fontSize: 14,
                                                        fontFamily: 'Space Grotesk',
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.50,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Container(
                            width: 200,
                            height: 48,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFA8D03D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 14,
                                  child: Container(
                                    width: 200,
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      spacing: 10,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 21,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 12,
                                                top: 0,
                                                child: Text(
                                                  'Submit Payment',
                                                  style: TextStyle(
                                                    color: const Color(0xFF1B3F77),
                                                    fontSize: 18,
                                                    fontFamily: 'Space Grotesk',
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.17,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}