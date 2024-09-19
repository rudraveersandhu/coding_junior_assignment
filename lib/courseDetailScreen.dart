import 'package:coding_junior/paymentSucessScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:google_fonts/google_fonts.dart';

class CourseDetailScreen extends StatefulWidget {
  final String course;
  const CourseDetailScreen({
    super.key,
    required this.course
  });

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    double font_size = width > 1170 ? 35 : width > 940 ? 25 : width > 500 ? 35 : 22;

    double enroll_bar_height = width > 1170 ? 130 : width > 940 ? 80 : width > 500 ? 130 : 90;
    double icon_size = width > 1170 ? 48 : width > 940 ? 32 : width > 500 ? 48 : 30;


    // print("--------------------------------------------");
    // print("width     : ${width}");
    // print("font_size : ${font_size}");
    // print("--------------------------------------------");

    return Scaffold(
        backgroundColor: Colors.white,

        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey.shade100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          topbar(context),
                          SizedBox(height: 20),
                          dashboard(context),
                          SizedBox(height: 20),
                          extended_popular_courses(context)

                        ],
                      ),
                    )
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, -4), // Negative offset to create shadow at the top
                      ),
                    ],
                    color: Colors.white,
                  ),
                  height: enroll_bar_height,
                  width: MediaQuery.of(context).size.width,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: enroll_bar_height * .75,
                        height: enroll_bar_height * .75 ,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2.5,
                              color: Colors.white
                            ),
                          color: Color.fromRGBO(184, 221, 106, 1),
                        ),

                        child: Icon(
                          Icons.book,
                          size: icon_size,
                          color: Colors.white,
                        ),
                        //child: Image(image: AssetImage('assets/course_thumb.png'))
                      ),
                      Padding(
                        padding: width > 440 ? width < 800 ? const EdgeInsets.only(right: 80.0) : const EdgeInsets.only(right: 0.0) : const EdgeInsets.only(right: 0.0),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(() => PaymentSuccessScreen(course: widget.course,));

                          },
                          child: Container(
                            width: width * .7,
                            height: enroll_bar_height * .75 ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 2.5,
                                  color: Colors.white
                              ),
                              color: Color.fromRGBO(184, 221, 106, 1),
                            ),
                            child: Center(
                                child: Text("Enroll Now",
                                style: TextStyle(
                                  fontSize: font_size * .9,
                                  fontWeight: FontWeight.w500
                                ),
                                )
                            )
                            //child: Image(image: AssetImage('assets/course_thumb.png'))
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              )
            ],
          ),
        ),

    );
  }

  Widget topbar(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;

    double circle_rad = width > 800 ? 45 : width > 400 ? 35 : 30;
    double icon_size = width > 1150 ? 30 : width > 800 ? 25 : width > 400 ? 20 : 40;

    // print("####################################################################");
    // print("Width      : $width");
    // print("C Radius   : $circle_rad");
    // print("Icon Size  : $icon_size");
    // print("-------------------------------");
    // print("####################################################################");

    return Container(
      width: width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: circle_rad, // Define icon size
            width: circle_rad,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Background color
            ),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                CupertinoIcons.chevron_back,
                size: icon_size , // Adjust icon size to fit inside
                color: Colors.grey.shade900,
              ),
            ),
          ),
          Text(
            "Details",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Container(
            height: circle_rad, // Define icon size
            width: circle_rad,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Background color
            ),
            child: Icon(
              CupertinoIcons.bell,
              size: icon_size , // Adjust icon size to fit inside
              color: Colors.grey.shade900,
            ),
          ),
        ],
      ),
    )

    ;
  }

  Widget dashboard(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;

    double dash_height = width > 1170 ? 280 : width > 940 ? 330 : width < 500 ? 250 : 350;
    double dash_width = width * 0.9;

    double sub_dash_height = dash_height / 3.5;
    double sub_dash_width = dash_width * 0.9;

    double font_size = dash_width > 1040 ? 22 : dash_width > 700 ? 20: dash_width > 350 ? 15: dash_width > 700 ? 20 :18 ;
    double sub_font_size = dash_width > 1040 ? 22 : dash_width > 700 ? 20 : dash_width > 350 ? 15: dash_width > 700 ? 20 : 18 ;

    double rad = dash_height > 250 ? 100 : dash_height > 200 ? 80 :dash_height > 170 ? 50 : 35;

    double icon_size = dash_height > 250 ? 35 : dash_height > 200 ? 25 :dash_height > 170 ? 22 : 18;

    // print("####################################################################");
    // print("Dash Height : $dash_height");
    // print("Dash Width : $dash_width");
    // print("-------------------------------");
    // print("Sub Dash Height : $sub_dash_height");
    // print("Sub Dash Width : $sub_dash_width");
    // print("-------------------------------");
    // print("Sub Dash Height : $sub_dash_height");
    // print("Sub Dash Width : $sub_dash_width");
    // print("-------------------------------");
    // print("font Size     : $font_size");
    // print("Sub font size : $sub_font_size");
    // print("-------------------------------");
    // print("Radius     : $rad");
    // print("Icon Size  : $icon_size");
    //
    // print("####################################################################");

    double courses_height = dash_height * .75;
    double courses_width = dash_width > 730 ? 300 : dash_width > 380 ? 250 : 300;
    double circle_rad = width > 700 ? 18 : width > 800 ? 15 : width > 400 ? 15 : 30;

    // print(width);
    List<String> pfp_arr = ['pfp.jpg','pfp2.jpg','pfp3.jpg','pfp4.jpg'];

    return Container(
      height: dash_height,
      width: dash_width,
      decoration: BoxDecoration(
        color:  Colors.white,
        borderRadius: width < 500
            ? BorderRadius.circular(10)
            : BorderRadius.circular(15),
      ),

      child: Stack(
        children: [
          Positioned(
            left: 15,
            right: 15,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Container(
                height: sub_dash_height,
                width: sub_dash_width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //color: const Color.fromRGBO(213, 234, 162, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "Our Students",
                                style: TextStyle(
                                  fontSize: font_size,

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:10.0),
                                child: Container(

                                  width: courses_width * 0.9,
                                  child: Row(
                                    children: [
                                      Container(

                                        height: circle_rad * 2,
                                        width: courses_width * 0.9,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage('assets/${pfp_arr[1]}'),
                                                radius: circle_rad,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              left: 40,
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage('assets/${pfp_arr[2]}'),
                                                radius: circle_rad,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              left: 80,
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage('assets/${pfp_arr[3]}'),
                                                radius: circle_rad,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              left: 120,
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage('assets/${pfp_arr[1]}'),
                                                radius: circle_rad,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              left: 160,
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage('assets/${pfp_arr[2]}'),
                                                radius: circle_rad,
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
                        Padding(
                          padding: dash_width > 400 ?  EdgeInsets.only(right: 25.0) : EdgeInsets.only(right: 5.0),
                          child: Container(
                              height: sub_dash_height,
                              child: Image.asset("assets/pshop.png")
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
              height:
              width < 500
                  ? 20
                  : 30
          ),
          Positioned(
              left: 30,
              top: dash_height/2.2,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.course,
                    style: GoogleFonts.aBeeZee(
                      fontSize: font_size+4,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    width: dash_width * 0.9,
                    child: Text("A representation that can convey the three-dimensional aspect of a design through a two-dimensional medium.",
                      style: GoogleFonts.aBeeZee(
                        fontSize: font_size * .9,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500
                      ),
                    ),
                  ),



                ],
              )),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.play_circle,
                            color: Colors.grey.shade600,
                            size: icon_size,
                          ),
                          Text(" 30 Lessons",
                            style: TextStyle(
                              color: Colors.grey.shade700,

                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0,),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.grey.shade600,
                            size: icon_size * .9,
                          ),
                          Text(" 13h 30min",
                            style: TextStyle(
                              color: Colors.grey.shade700,

                            ),
                          ),

                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget extended_popular_courses(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    double dash_height = width > 1170 ? 450 : width > 940 ? 430 : width < 500 ? 350 : 400;
    double dash_width = width * 0.9;

    double font_size = dash_width > 1040 ? 28 : dash_width > 700 ? 25: dash_width > 350 ? 18: dash_width > 700 ? 20 :18 ;

    double title_font_size = dash_width > 1040 ? 24 : dash_width > 700 ? 23: dash_width > 350 ? 19 :18 ;

    double courses_height = dash_height * .5;
    double courses_width = dash_width > 730 ? 300 : dash_width > 380 ? 250 : 300;

    double icon_size = dash_height > 350 ? 32 : dash_height > 350 ? 28 :dash_height > 250 ? 24 : dash_height > 200 ? 35 :dash_height > 170 ? 22 : 18;

    //double circle_rad = width > 700 ? 18 : width > 800 ? 15 : width > 400 ? 15 : 30;

    //List<String> pfp_arr = ['pfp.jpg','pfp2.jpg','pfp3.jpg','pfp4.jpg'];
    //List<String> cor_arr = ['pshop.png','ill.png','pshop.png','ill.png','pshop.png'];
    List<String> title_arr = ['Photoshop Editing Course','Illustrator Editing Course','Photoshop Editing Course','Illustrator Editing Course','Photoshop Editing Course'];
    List<String> time_list = ['3h 30min',"1h 30min","2h 30min","1h 20min","3h 40min"];
    List<String> vid_title_arr = ['Introduction','Install Software','Learn Tools','Tracing Sketsa','Building project'];

    double vid_height = width > 1170 ? 120 : width > 940 ? 100 : width > 500 ? 110 : 90;
    double square_side = vid_height * .75;


    // print("-------------------------------------------------------");
    // print("width : $width");
    // print("vid_height : $vid_height");
    // print("square_side : $square_side");
    // print("-------------------------------------------------------");


    return Container(

      width: dash_width,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Videos",
                    style: GoogleFonts.poppins(
                      fontSize: font_size+2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text("View All",
                    style: GoogleFonts.poppins(
                        fontSize: font_size-4,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600
                    ),)
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 5, // Number of items in the list
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                          height: vid_height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,),
                          margin: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: width > 500 ? 20 : 10),

                                child: Container(
                                  width: square_side,
                                  height: square_side ,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 2.5,
                                        color: Colors.grey.shade400,

                                      )
                                  ),
                                  child: Icon(
                                    Icons.lock,
                                    size: icon_size+5,
                                    color: Colors.grey.shade700,

                                  ),

                                  //child: Image(image: AssetImage('assets/course_thumb.png'))
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(

                                    width: courses_width * .9 ,
                                    child: Text(vid_title_arr[index],
                                      style: TextStyle(
                                          fontSize: title_font_size
                                      ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0,top: 10),
                                    child: Container(
                                        width: courses_width   ,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.grey.shade600,
                                              size: icon_size,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:5.0),
                                              child: Text(time_list[index],
                                                style: TextStyle(
                                                    color: Colors.grey.shade700,
                                                    fontSize: font_size * 0.8

                                                ),
                                              ),
                                            ),

                                          ],
                                        )
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          )
                      ),
                      Positioned(
                        top: 30,
                        bottom: 30,
                        right : width > 500 ? 30 : 20,
                        child: Container(
                          width: width > 500 ? square_side * 2 :square_side * 1.3 ,
                          height: square_side * .9,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade700),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.play_circle,
                              color: Color.fromRGBO(184, 221, 106, 1),
                                size: width > 500 ? icon_size : icon_size * .7,
                              ),
                              Text("Play Video",
                              style: TextStyle(
                                fontSize: width > 500 ? font_size * .8 : font_size * .6
                              ),)
                            ],
                          ),

                        ),
                      )
                    ],
                  );
                },
              ),
              SizedBox(
                height: 200
              )

            ],
          ),
        ],
      ),
    );
  }
}


