import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quiz_app/CompletePage.dart';
import 'package:quiz_app/Options.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List responseData=[];
  int number = 0;
  int correctAnswers=0;
  int incorrectAnswers=0;
  List<String> shuffledOptions=[];

Future api()async{
  final response=await http.get(Uri.parse('https://opentdb.com/api.php?amount=10'));
  if(response.statusCode==200){
    var data=jsonDecode(response.body)['results'];
    setState(() {
      responseData=data;
      updateShuffleOption();
    });
  }
}
@override
void initState(){
  super.initState();
  api();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8),
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
                            borderRadius: BorderRadius.circular(20)),
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
                                      offset: const Offset(0, 1),
                                      blurRadius: 3,
                                      color: const Color(0xffA42FC1).withOpacity(.4))
                                ]),
                            child: Padding(
                              padding:const EdgeInsets.symmetric(horizontal: 18),
                              child: Column(children: [
                                 Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      (correctAnswers).toString(),
                                      style: const TextStyle(
                                          color: Colors.green, fontSize: 20
                                          ),),
                                    Text(
                                      (incorrectAnswers).toString(),
                                      style: const TextStyle(
                                          color: Colors.red, fontSize: 20),
                                    )
                                  ],
                                ),
                                Center(
                                    child: Text(
                                  "Question ${number + 1}/10",style:const TextStyle(
                                    color: Color(0xffA42FC1)
                                    ),),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(responseData.isNotEmpty? responseData[number]['question']:'')
                              ]),
                            ),
                          )),
                      const Positioned(
                          bottom: 210,
                          left: 140,
                          child: CircleAvatar(
                            radius: 42,
                            backgroundColor: Colors.white,
                            child: Center(
                              child: Text(
                                'Timer',
                                style: TextStyle(
                                    color: Color(0xffA42FC1), fontSize: 25),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: (responseData.isNotEmpty&& responseData[number]['incorrect_answers']!=null)?
                  shuffledOptions.map((option){
                    return Options(option: option.toString());

                  }).toList():[],
                ),
                const SizedBox(height: 30,),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xffA42FC1),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5),
                      onPressed: () {
                        nextQuestion();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text('Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                    )
              ],
            )
            )
            );
  }
void nextQuestion(){
  if(number==9){
    completed();
  }
  setState(() {
      if (shuffledOptions.isNotEmpty &&
          shuffledOptions[0] == responseData[number]['correct_answer']) {
        correctAnswers++;
      } else {
        incorrectAnswers++;
      }
    number = number+1;
    updateShuffleOption();
  });
}

void completed(){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Completed()));
}

void updateShuffleOption(){
  setState(() {
    shuffledOptions=shuffleOption(
      [
        responseData[number]['correct_answer'],
        ...(responseData[number]['incorrect_answers'] as List)
      ]
    );
  });
}
List<String> shuffleOption(List<String> option){
  List<String> shuffledOptions=List.from(option);
  shuffledOptions.shuffle();
  return shuffledOptions;
}
}
