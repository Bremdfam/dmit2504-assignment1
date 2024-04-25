import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 421,
              width: 400,
              child: Stack(
                children: [
                  Container(
                    height: 240,
                    width: 390,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF9000),
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 22,
                    child: Container(
                      height: 170,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 3,
                            color: Color(0xffA42FC1).withOpacity(.4)
                          )
                        ]
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('05',style: TextStyle(color: Colors.green, fontSize: 20
                          ),),
                          Text('07',style: TextStyle(color: Colors.red, fontSize: 20
                          ),),
                        ],
                        ),
                        Center(
                          child: Text("Question 3/10",style: TextStyle(
                            color: Color(0xffA42FC1)
                          ),)
                        ),
                        SizedBox(
                          height: 25,
                          
                        ),
                        Text("What is ____?")

                      ]
                      ),
                      ),
                    )
                    
                  ),
                  const Positioned(
                    bottom: 210,
                    left: 140,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Text('15', style: TextStyle(
                          color: Color(0xffA42FC1),fontSize: 25
                      ),),
                      ),
                    )
                    )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 18),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xffA42FC1),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5
              ),
              onPressed: (){},
              child:Container(
                alignment: Alignment.center,
              
              child: const Text('Next',style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold
              ),
              )
              ),
              ))
          ],
        )
      )
    
    );
  }
}