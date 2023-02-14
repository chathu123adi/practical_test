import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practical_test/utils/app_colors.dart';
import 'package:practical_test/view/eft_payment.dart';

class Chat_screen extends StatefulWidget {
  final collectedChatArray;
  final int? count;
  const Chat_screen({this.collectedChatArray, this.count,super.key});

  @override
  State<StatefulWidget> createState() => _chat_screen();

}

class _chat_screen extends State<Chat_screen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController txtController = TextEditingController();
  var placeholderArray = ["Enter your email address", "Enter your mobile number"];
  var quizArray = ["Nice to meet you Benjamin What is your email? ✉️", "Thanks Benjamin What is your mobile number? 📱"];

  var quizFlow = [];
  var anzArray = [];
  var count = 0;
  var placeHolder = "";
  bool isEmail = false;
  TextInputType textBoardType = TextInputType.emailAddress;

  @override
  void initState() {
    isEmail = true;
    count = widget.count ?? 0;
    if (count == 0) {
      anzArray.add(quizArray[0]);
      placeHolder = placeholderArray[0];
    } else if (count == 1) {
      for(String item in widget.collectedChatArray) {
        anzArray.add(item);
      }
      textBoardType = TextInputType.numberWithOptions(decimal: false);
      anzArray.add(quizArray[1]);
      placeHolder = placeholderArray[1];
    } else {
      for(String item in widget.collectedChatArray) {
        anzArray.add(item);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn);
      }
    });

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading:
        Container(
          padding: EdgeInsets.only(left: 30, bottom: 75.5),
          child: Image.asset("images/back.png",),
        ),
        // actions: [
        //   IconButton(onPressed: (){}, icon: Image.asset("images/back.png")),
        // ],
        backgroundColor: App_colors.navBackground,
        toolbarHeight: 148,
        flexibleSpace: Column(
          children: [
            SizedBox(height: 145,),
            Container(
              padding: EdgeInsets.only(left: 30, bottom: 4),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Eft_payment()));
                    },
                    child: Image.asset("images/logo.png", color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),

      body: Stack(
        children: <Widget>[
          Container(
            width: width,
            height: height,
            color: App_colors.navBackground,
          ),
          ListView.builder(
            controller: _scrollController,
            itemCount: anzArray.length,
            itemBuilder: (context, index) {
              return Container(
                color: App_colors.navBackground,
                child: Column(
                  children: [
                    SizedBox(height: 8,),
                    Container(
                      margin: EdgeInsets.only(left: 24, right: 24),
                      height: 57,
                      color: App_colors.navBackground,
                      child: Row(
                        children: [
                          SizedBox(
                            width: width - 48,
                            child:Text(anzArray[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,fontFamily: "inter",color: Color(0xffFFFFFF)), maxLines: 2, overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),

                      ),


                    ],
                  ),
                );
              }
              ),


          Align(
              alignment: Alignment.bottomLeft,
              child:
              Container(
                  alignment: AlignmentDirectional.centerEnd,
                  height: 200,
                  color: App_colors.navBackground,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 24, right: 24),
                        height: 54, color: App_colors.navBackground, child: Row(
                        children: [
                          SizedBox(
                              width: width - 48,
                              child:
                              Align(
                                alignment: Alignment.centerRight,
                                child: Row (
                                  children: [
                                    const Spacer(),
                                    Image.asset("images/typing4.gif"),
                                  ],
                                ),
                              )
                          )
                        ],
                      ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(padding: EdgeInsets.only(left: 24),
                            child: Text(placeHolder, style: TextStyle(color: Colors.white),),
                          )
                      ),

                      Divider(color: Colors.white,),
                      Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          TextField(
                            controller: txtController,
                            keyboardType: textBoardType,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              // suffixIcon: IconButton(onPressed: (){
                              //   txtController.clear();
                              // }
                              // , icon: Icon(Icons.clear),),
                              contentPadding: EdgeInsets.all(24.0),
                            ),
                            onChanged: (s) {
                              var bool = validateEmail(s);
                              if (bool) {
                                setState(() {
                                  isEmail = true;
                                });

                              } else {
                                setState(() {
                                  isEmail = false;
                                });
                              }
                              if (s.isEmpty) {
                                setState(() {
                                  isEmail = true;
                                });
                              }
                            },
                          ),

                          Visibility(
                            visible: isEmail,
                              child: TextButton(
                              onPressed: (){
                                setState(() {
                                  if (count < 2){
                                    if (count == 0) {
                                      anzArray.add(txtController.text);
                                      count++;
                                      txtController.clear();
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Chat_screen(collectedChatArray: anzArray, count: count,)));
                                    } else if (count == 1) {
                                      anzArray.add(txtController.text);
                                      txtController.clear();
                                      count++;
                                    }



                                  }
                                  // anzArray.add(quizArray[count]);
                                  // anzArray.add(txtController.text);
                                  // count++;
                                });
                              },
                              child: Image.asset("images/send.png", color: Colors.white)
                          )),

                          Visibility(
                              visible: !isEmail,
                              child: TextButton(
                                  onPressed: (){
                                    setState(() {
                                      if (count < 2){
                                        if (count == 0) {
                                          anzArray.add(txtController.text);
                                          count++;
                                          txtController.clear();
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Chat_screen(collectedChatArray: anzArray, count: count,)));
                                        } else if (count == 1) {
                                          anzArray.add(txtController.text);
                                          txtController.clear();
                                          count++;
                                        }



                                      }
                                      // anzArray.add(quizArray[count]);
                                      // anzArray.add(txtController.text);
                                      // count++;
                                    });
                                  },
                                  child: Image.asset("images/cancel.png", color: Colors.red)
                              ))
                        ],
                      )
                    ],
                  )

              )
          )

        ],
      ),








      // body: Stack(
      //   children: [
      //     Container(
      //       width: width,
      //       height: height,
      //       color: App_colors.navBackground,
      //     ),
      //     Container(
      //       child: SingleChildScrollView(
      //         child: Column(
      //           children:<Widget> [
      //             SizedBox(height: 8,),
      //             Container(
      //               margin: EdgeInsets.only(left: 24, right: 24),
      //               height: 57, color: App_colors.navBackground, child: Row(
      //               children: [
      //                 SizedBox(
      //                   width: width - 48,
      //                   child:Text("Nice to meet you BenjaminWhat is your email? ✉️", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,fontFamily: "inter",color: Color(0xffFFFFFF)), maxLines: 2, overflow: TextOverflow.ellipsis,),
      //                   )
      //                 ],
      //               ),
      //             ),
      //
      //             SizedBox(height: 10,), //TODO: remove this line
      //             Container(
      //               margin: EdgeInsets.only(left: 24, right: 24),
      //               height: 54, color: App_colors.navBackground, child: Row(
      //               children: [
      //                 SizedBox(
      //                     width: width - 48,
      //                     child:
      //                     Align(
      //                       alignment: Alignment.centerRight,
      //                       child: Row (
      //                         children: [
      //                           const Spacer(),
      //                           Image.asset("images/typing.gif"),
      //                         ],
      //                       ),
      //                     )
      //                 )
      //               ],
      //             ),
      //             ),
      //
      //
      //             SizedBox(height: 10,),
      //             Container(height: 100, color: Colors.yellowAccent,),
      //             SizedBox(height: 10,),
      //             Container(height: 100, color: Colors.yellowAccent,),
      //             SizedBox(height: 10,),
      //             Container(height: 100, color: Colors.yellowAccent,),
      //             SizedBox(height: 10,),
      //             Container(height: 100, color: Colors.yellowAccent,),
      //             SizedBox(height: 10,),
      //             Container(height: 100, color: Colors.yellowAccent,),
      //             SizedBox(height: 10,),
      //             Container(height: 100, color: Colors.yellowAccent,),
      //             SizedBox(height: 10,),
      //             Container(height: 100, color: Colors.yellowAccent,),
      //             SizedBox(height: 10,),
      //             Container(height: 100, color: Colors.yellowAccent,),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Align(
      //       alignment: Alignment.bottomLeft,
      //       child:
      //       Container(
      //         alignment: AlignmentDirectional.centerEnd,
      //         height: 100,
      //         color: App_colors.navBackground,
      //         child: Column(
      //           children: [
      //             Align(
      //               alignment: Alignment.centerLeft,
      //               child: Container(padding: EdgeInsets.only(left: 24),child: Text("datadfdfdfgdfgd", style: TextStyle(color: Colors.red),),)
      //             ),
      //             Divider(color: Colors.white,),
      //             Stack(
      //               alignment: AlignmentDirectional.centerEnd,
      //               children: [
      //                 TextField(
      //                   controller: txtController,
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                   ),
      //                   decoration: InputDecoration(
      //                       // border: OutlineInputBorder(),
      //                       suffixIcon: IconButton(onPressed: (){
      //                         txtController.clear();
      //                       }, icon: Icon(Icons.clear),),
      //                       contentPadding: EdgeInsets.all(24.0),
      //                   ),
      //                 ),
      //
      //                 TextButton(
      //                     onPressed: (){},
      //                     child: Image.asset("images/send.png", color: Colors.white))
      //               ],
      //             )
      //           ],
      //         )
      //
      //       )
      //     )
      //   ],
      // ),



    );
  }

  validateMobileNo(String str) {

  }

  bool validateEmail(String email){
    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    return emailValid;
  }

}