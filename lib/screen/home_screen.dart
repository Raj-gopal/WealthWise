import 'package:flutter/material.dart';
import 'package:wealthwise/widgets/user_data.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              centerTitle: false,
              backgroundColor: Color(0xFFF7F7F7),
              elevation: 0,
              title: Row(
                children: [
                  Text(
                    'Investments',
                    style: TextStyle(
                        color: Color(0xFF041727),
                        fontFamily: 'Montserrat',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),

                  SizedBox(
                    width: 72,
                  ),

                  //search icon

                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Image(
                      image: AssetImage(
                        'assets/image/search 1.png',
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 24,
                  ),

                  //profile icon

                  SizedBox(
                    height: 45,
                    width: 45,
                    child: Image(
                      image: AssetImage(
                        'assets/image/man 1.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
          body: Column(
            children: [
              
              userdata(),


               Container(
                padding: EdgeInsets.only(left: 20,),
                child: ListView(
                  
                ),
               )

            ],
          ),


            )
          );
            
  }
}
