import 'package:coding_junior/courseDetailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';


class PopularCoursesScreen extends StatefulWidget {
  const PopularCoursesScreen({super.key});

  @override
  State<PopularCoursesScreen> createState() => _PopularCoursesScreenState();
}

class _PopularCoursesScreenState extends State<PopularCoursesScreen> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                topbar(context),

                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: dashboard(context),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: popular_courses(context),
                ),



                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: extended_popular_courses(context),
                ),

                SizedBox(
                  height: 200,
                )

                // ListView.builder(
                //   itemCount: 3,
                //   itemBuilder: (context, index) {
                //     return Card(
                //       child: ListTile(
                //         leading: Icon(Icons.book),
                //         title: Text("Course ${index + 1}"),
                //         subtitle: Text("30 Lessons"),
                //         trailing: Text("4.8 ★"),
                //       ),
                //     );
                //   },
                // ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, -4), // Negative offset to create shadow at the top
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _buildIconWithBackground(
                icon: HugeIcons.strokeRoundedHome01,
                isSelected: _selectedIndex == 0,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildIconWithBackground(
                icon: HugeIcons.strokeRoundedFavourite,
                isSelected: _selectedIndex == 1,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: _buildIconWithBackground(
                icon: HugeIcons.strokeRoundedNotification02,
                isSelected: _selectedIndex == 2,
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: _buildIconWithBackground(
                icon: HugeIcons.strokeRoundedUser,
                isSelected: _selectedIndex == 3,
              ),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget topbar(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;

    double circle_rad = width > 800 ? 40 : width > 400 ? 35 : 30;
    double icon_size = width > 1150 ? 70 : width > 800 ? 60 : width > 400 ? 50 : 40;
    // print("####################################################################");
    // print("Width  : $width");
    // print("Radius : $circle_rad");
    // print("Icon : $icon_size");
    // print("-------------------------------");
    // print("####################################################################");

    return Container(
      width: width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [

              CircleAvatar(
                backgroundImage: AssetImage('assets/pfp.jpg'),
                radius: circle_rad, ),

              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Christiana Amandla",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 19
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text("Lets Learning to smart",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.grey.shade700
                    ),
                  ),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              Positioned(
                top: 8,
                bottom: 8,
                left: 8,
                right: 8,
                child: Container(
                  height: icon_size,
                  width: icon_size,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade700
                  ),
                ),
              ),

              Icon(CupertinoIcons.search_circle_fill,
                size: icon_size,
                color: Colors.white,
              ),

            ],
          )

        ],
      ),
    );
  }

  Widget dashboard(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;

    double dash_height = width > 1170 ? 280 : width > 940 ? 330 : width < 500 ? 180 : 230;
    double dash_width = width * 0.9;

    double sub_dash_height = dash_height / 3.5;
    double sub_dash_width = dash_width * 0.9;

    double font_size = dash_width > 1040 ? 22 : dash_width > 700 ? 20: dash_width > 350 ? 15: dash_width > 700 ? 20 :18 ;
    double sub_font_size = dash_width > 1040 ? 22 : dash_width > 700 ? 20 : dash_width > 350 ? 15: dash_width > 700 ? 20 : 18 ;

    double rad = dash_height > 250 ? 100 : dash_height > 200 ? 80 :dash_height > 170 ? 50 : 35;

    double icon_size = dash_height > 250 ? 40 : dash_height > 200 ? 35 :dash_height > 170 ? 22 : 18;

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

    // print(width);

    return Container(
      height: dash_height,
      width: dash_width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(184, 221, 106, 1),
        borderRadius: width < 500 ? BorderRadius.circular(10) : BorderRadius.circular(15),

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
                  color: const Color.fromRGBO(213, 234, 162, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Mathematics Course",
                            style: TextStyle(
                              fontSize: font_size,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: width > 900 ?  const EdgeInsets.only(right: 10.0) : width < 500 ?  const EdgeInsets.only(right: 10.0) :  const EdgeInsets.only(right: 15.0),
                          child: Container(
                            height: sub_dash_height * .7,
                            width: width < 500 ? dash_width * 0.4 : dash_width * 0.3,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(184, 221, 106, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.calendar,
                                  size: 25,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "19 Nov, 2023",
                                  style: TextStyle(
                                    fontSize: sub_font_size,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
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
            top: dash_height /2,
            bottom: 30,
            left: 10,
            right: 10,
            child: Container(

              width: dash_width * 0.93,
              height:width > 1100 ? dash_height * .35 : width > 900 ? dash_height * .7 : width > 500 ? .35 : dash_height * .5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        width: rad,
                        height: rad,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(
                              213,
                              234,
                              162,
                              1
                          ),
                        ),
                        child:  Icon(CupertinoIcons.check_mark_circled_solid,
                            size: icon_size,
                            color: Color.fromRGBO(175, 210, 100, 1)
                        ),
                      ),
                      SizedBox(width: dash_width * 0.04,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Completed",
                            style: TextStyle(
                                fontSize: sub_font_size,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          Text("20",
                            style: TextStyle(
                                fontSize: sub_font_size,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8),
                    child: const VerticalDivider(
                      color: Color.fromRGBO(213, 234, 162, 1),
                      thickness: 3,
                    ),
                  ),

                  Row(
                    children: [
                      Container(
                        width: rad,
                        height: rad,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(213, 234, 162, 1),
                        ),
                        child:  Icon(
                            Icons.access_time_filled,
                            size: icon_size,
                            color: Color.fromRGBO(175, 210, 100, 1)
                        ),
                      ),
                      SizedBox(
                        width: dash_width * 0.04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hours Spent",
                            style: TextStyle(
                                fontSize: sub_font_size,
                                fontWeight: FontWeight.w400
                            ),),
                          Text("455",
                            style: TextStyle(
                                fontSize: sub_font_size,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget popular_courses(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    double dash_height = width > 1170 ? 450 : width > 940 ? 430 : width < 500 ? 350 : 400;
    double dash_width = width * 0.9;

    double font_size = dash_width > 1040 ? 28 : dash_width > 700 ? 25: dash_width > 350 ? 18: dash_width > 700 ? 20 :18 ;

    double title_font_size = dash_width > 1040 ? 24 : dash_width > 700 ? 22: dash_width > 350 ? 18 :18 ;

    double courses_height = dash_height * .75;
    double courses_width = dash_width > 730 ? 300 : dash_width > 380 ? 250 : 300;

    double icon_size = dash_height > 350 ? 32 : dash_height > 350 ? 28 :dash_height > 250 ? 24 : dash_height > 200 ? 35 :dash_height > 170 ? 22 : 18;

    double circle_rad = width > 700 ? 18 : width > 800 ? 15 : width > 400 ? 15 : 30;

    List<String> pfp_arr = ['pfp.jpg','pfp2.jpg','pfp3.jpg','pfp4.jpg'];
    List<String> cor_arr = ['pshop.png','ill.png','pshop.png','ill.png','pshop.png'];
    List<String> title_arr = ['Photoshop Editing Course','Illustrator Editing Course','Photoshop Editing Course','Illustrator Editing Course','Photoshop Editing Course'];


    return Container(
      height: dash_height ,
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
                  Text("Popular Courses",
                    style: GoogleFonts.poppins(
                      fontSize: font_size+2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text("View All",
                    style: GoogleFonts.poppins(
                        fontSize: font_size-3,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600
                    ),)
                ],
              ),
              Container(
                height: courses_height + 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {

                    return GestureDetector(
                      onTap: (){
                        Get.to(() => CourseDetailScreen(course: title_arr[index]));
                      },
                      child: Container(
                          height: courses_width,
                          width: courses_width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 30.0),
                                        child: Container(
                                            width: courses_width/3 ,
                                            child: Image(image: AssetImage('assets/${cor_arr[index]}'))
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15.0),
                                        child: Container(
                                          width: courses_width * .8 ,
                                          child: Text(title_arr[index],
                                            style: TextStyle(
                                                fontSize: title_font_size
                                            ),),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: dash_width > 1000 ? EdgeInsets.only(top: 40.0) : EdgeInsets.only(top: 15.0),
                                    child: Container(
                                      width: courses_width * 0.9,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: circle_rad * 2,
                                            width: circle_rad * 6.3,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  top: 0,
                                                  left: 5,
                                                  child: CircleAvatar(
                                                    backgroundImage: AssetImage('assets/${pfp_arr[1]}'),
                                                    radius: circle_rad,
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  left: 25,
                                                  child: CircleAvatar(
                                                    backgroundImage: AssetImage('assets/${pfp_arr[2]}'),
                                                    radius: circle_rad,
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  left: 45,
                                                  child: CircleAvatar(
                                                    backgroundImage: AssetImage('assets/${pfp_arr[3]}'),
                                                    radius: circle_rad,
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  left: 65,
                                                  child: CircleAvatar(
                                                    radius: circle_rad,
                                                    //backgroundImage: AssetImage('assets/pfp.jpg'),
                                                    backgroundColor: const Color.fromRGBO(184, 221, 106, 1),
                                                    child: const Center(
                                                      child: Text("+20",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                    ),

                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 12.0),
                                            child: Text("Participants",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  )

                                ],
                              ),

                              Column(
                                children: [
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0,bottom: 20),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: icon_size,
                                            ),
                                            Text("4.8",
                                              style: TextStyle(
                                                  color: Colors.grey.shade700
                                              ),
                                            ),
                                            Text("(230)",
                                              style: TextStyle(
                                                  color: Colors.grey.shade700
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 20.0,bottom: 20),
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
                                      )
                                    ],
                                  ),
                                ],
                              )


                            ],
                          )
                      ),
                    );
                  },
                ),
              ),
            ],
          ),



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

    double circle_rad = width > 700 ? 18 : width > 800 ? 15 : width > 400 ? 15 : 30;

    List<String> pfp_arr = ['pfp.jpg','pfp2.jpg','pfp3.jpg','pfp4.jpg'];
    List<String> cor_arr = ['pshop.png','ill.png','pshop.png','ill.png','pshop.png'];
    List<String> title_arr = ['Photoshop Editing Course','Illustrator Editing Course','Photoshop Editing Course','Illustrator Editing Course','Photoshop Editing Course'];


    return Container(
      height: dash_height ,
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
                  Text("Popular Courses",
                    style: GoogleFonts.poppins(
                      fontSize: font_size+2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text("View All",
                    style: GoogleFonts.poppins(
                        fontSize: font_size-3,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600
                    ),)
                ],
              ),
              Container(
                height: courses_height + 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10, // Number of items in the list
                  itemBuilder: (context, index) {
                    return Container(
                        height: courses_width,
                        width: courses_width * 1.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,),

                        margin: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0,left: 30),
                                        child: Container(
                                            width: courses_width/3 ,
                                            child: Image(image: AssetImage('assets/${cor_arr[index]}'))
                                        ),
                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 30,top: 30.0),
                                            child: Container(
                                              width: courses_width * .9 ,
                                              child: Text(title_arr[index],
                                                style: TextStyle(
                                                    fontSize: title_font_size
                                                ),),
                                            ),
                                          ),
                                          Container(

                                            width: courses_width   ,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 25.0,bottom: 20,top: 10),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                        size: icon_size,
                                                      ),
                                                      Text("4.8",
                                                        style: TextStyle(
                                                            color: Colors.grey.shade700
                                                        ),
                                                      ),
                                                      Text(" (230)",
                                                        style: TextStyle(
                                                            color: Colors.grey.shade700,
                                                            fontSize: 12
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 20.0,bottom: 20,top: 10),
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
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                  Divider(),

                                  Padding(
                                    padding: dash_width > 1000 ? EdgeInsets.only(top: 10.0) : EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: Container(
                                            width: courses_width * 0.9,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: circle_rad * 2,
                                                  width: circle_rad * 6.3,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        top: 0,
                                                        left: 5,
                                                        child: CircleAvatar(
                                                          backgroundImage: AssetImage('assets/${pfp_arr[1]}'),
                                                          radius: circle_rad,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 0,
                                                        left: 25,
                                                        child: CircleAvatar(
                                                          backgroundImage: AssetImage('assets/${pfp_arr[2]}'),
                                                          radius: circle_rad,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 0,
                                                        left: 45,
                                                        child: CircleAvatar(
                                                          backgroundImage: AssetImage('assets/${pfp_arr[3]}'),
                                                          radius: circle_rad,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 0,
                                                        left: 65,
                                                        child: CircleAvatar(
                                                          radius: circle_rad,
                                                          //backgroundImage: AssetImage('assets/pfp.jpg'),
                                                          backgroundColor: const Color.fromRGBO(184, 221, 106, 1),
                                                          child: const Center(
                                                            child: Text("+20",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Colors.white
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(left: 12.0),
                                                  child: Text("Participants",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w300
                                                    ),
                                                  ),
                                                )

                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 20.0),
                                          child: Container(
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              color: const Color.fromRGBO(184, 221, 106, 1),
                                            ),
                                            child: const Center(
                                              child: Text("Enroll",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconWithBackground({required IconData icon, required bool isSelected}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isSelected)
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(184, 221, 106, 1),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        Icon(
          icon,
          color: isSelected ? Colors.white: Colors.grey.shade700, // Icon color changes based on selection
          size: 24.0,
        ),
      ],
    );
  }

}
