import 'dart:io';

import 'package:barcode/barcode.dart';
import 'package:coding_junior/popularCoursesScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:barcode_widget/barcode_widget.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final String course;
  const PaymentSuccessScreen({
    super.key,
    required this.course
  });

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double left_right = width > 1170 ? 35 : width > 940 ? 60 : width > 500 ? 55 : 35;

    double grey_radi = width > 500 ? 260 : 170;
    double top_margin = width > 500 ? 100 : 140;
    double paymeny_gap = width > 500 ? 160 : 100;

    double font_size = width > 1170 ? 35 : width > 940 ? 25 : width > 500 ? 35 : 22;

    double enroll_bar_height = width > 1170 ? 130 : width > 940 ? 80 : width > 500 ? 130 : 110;
    
    double canvas_height = width > 1170 ? 830 : width > 940 ? 800 : width > 500 ? 800 : 610;
    double grey_cont_h = width > 1170 ? 330 : width > 940 ? 280 : width > 500 ? 320 : 250;

    Orientation orientation = MediaQuery.of(context).orientation;

    print("grey container height : ${grey_cont_h}");


    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Stack(
          children: [
            Center(
              child: Container(
                width: width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: orientation == Orientation.portrait
                            ?  MediaQuery.of(context).size.height : canvas_height * 1.2,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 200,
                              left: left_right,
                              right: left_right,
                              child: Container(

                                // height: width > 500
                                //     ? MediaQuery.of(context).size.height * .65
                                //     : MediaQuery.of(context).size.height * .6,

                                height: canvas_height,

                                width: MediaQuery.of(context).size.width * .8,

                                color: Colors.white,

                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: paymeny_gap,
                                    ),
                                    Text("Payment Sucessful",
                                    style: TextStyle(
                                      fontSize: font_size,
                                      fontWeight: FontWeight.w600

                                    ),),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text("\$ 35.00",
                                        style: TextStyle(
                                            fontSize: font_size*1.3,
                                            fontWeight: FontWeight.w700,
                                          color: Color.fromRGBO(27,170,157,1)

                                        ),),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Container(
                                        height: grey_cont_h,
                                        width: width * .78,
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey.shade50,
                                          border: Border.all(
                                            color: Colors.blueGrey.shade100,
                                            width: 1.2,
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                        ),

                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 20.0,top: 25,right: 20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundImage: AssetImage('assets/pfp.jpg'),
                                                        radius: width > 500 ? 20 : 15,
                                                      ),

                                                      SizedBox(width: 16),
                                                      Text(
                                                        "Christiana Amandla",
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: width > 500 ? 19 :14,
                                                            color: Colors.grey.shade700
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(height: 25),

                                                  Text(widget.course,
                                                    style: TextStyle(
                                                        fontSize: font_size * .85,
                                                        fontWeight: FontWeight.w600

                                                    ),),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 20.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(
                                                          horizontal: 10,
                                                          ),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("ID Transcription",
                                                            style: TextStyle(
                                                              color: Colors.grey.shade700,
                                                              fontSize: width > 500 ? 19 :14,

                                                            )
                                                          ),
                                                          Text("TA11231PW",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: width > 500 ? 19 :14,

                                                              )
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(
                                                          horizontal: 10,),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        crossAxisAlignment: CrossAxisAlignment.start,

                                                        children: [
                                                          Text("Invoice Date",
                                                              style: TextStyle(
                                                                color: Colors.grey.shade700,
                                                                fontSize: width > 500 ? 19 :14,
                                                              )
                                                          ),

                                                          Text("Nov 14, 2023",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: width > 500 ? 19 :14,
                                                              )
                                                          ),
                                                        ],
                                                      ),
                                                    )

                                                  ],
                                                ),
                                              )

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Container(
                                    height: 80,
                                    width: width * .78,
                                    child: BarcodeWidget(
                                      barcode: Barcode.code128(),
                                      data: 'Made with love, By Rudraveer',
                                      style: TextStyle(
                                        fontSize: width > 500 ? 17 :13,
                                      ),
                                    ),
                                  ),
                                ),

                                  ],
                                ),
                              ),
                            ),  // white canvas

                            Positioned(
                              top: top_margin,
                            left: 0,
                            right: 0,
                              child: Container(
                                height: grey_radi * .8,
                                width: grey_radi * .8,

                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                  shape: BoxShape.circle
                                ),
                              ),
                            ), // grey circle

                            Positioned(
                              top: 10,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 400,
                                width: 400,
                                child: Lottie.asset(
                                  'assets/done.json', // URL of the Lottie animation

                                ),
                              ),
                            ),  // lottie animation


                          ],
                        ),
                      ),
                      SizedBox(height: 200),

                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(

                  color: Colors.grey.shade200,
                ),
                height: enroll_bar_height,
                width: MediaQuery.of(context).size.width,

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(() => const PopularCoursesScreen());
                      },
                      child: Container(
                          width: width * .9,
                          height: enroll_bar_height * .55 ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

                            color: Color.fromRGBO(184, 221, 106, 1),
                          ),
                          child: Center(
                              child: Text("Done",
                                style: TextStyle(
                                    fontSize: font_size * .9,
                                    fontWeight: FontWeight.w400
                                ),
                              )
                          )
                        //child: Image(image: AssetImage('assets/course_thumb.png'))
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }


}


