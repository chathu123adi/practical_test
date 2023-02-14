import 'package:flutter/material.dart';
import 'package:practical_test/utils/app_colors.dart';

class Eft_payment extends StatefulWidget {
  const Eft_payment({super.key});

  @override
  State<StatefulWidget> createState() => _eft_payment();

}

class _eft_payment extends State<Eft_payment> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 112,
        backgroundColor: App_colors.navBackground,
        // leading: Container(
        //   padding: EdgeInsets.only(left: 30, bottom: 75.5),
        //   child: Image.asset("images/back.png",),
        // ),
        flexibleSpace:
        Column(
          children: [
            SizedBox(height: 43,),
            Container(
              margin: EdgeInsets.only(left: 24),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        // margin: EdgeInsets.only(left: 24, top: 36),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset("images/back.png",),
                        ),
                      ),
                      SizedBox(width: 24,),],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24,),
                      Text("Amount", style: TextStyle(color: Colors.white, fontSize: 14),),
                      Text("R800.00 Avl.", style: TextStyle(color: App_colors.balance, fontSize: 12)),
                    ],
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 24),
                    child: Text("Confirm", style: TextStyle(color: App_colors.confirm, fontSize: 14,decoration: TextDecoration.underline,),),
                  )
                ],
              ),
            )
          ],
        ),
      automaticallyImplyLeading: false,
    ),

      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 69,right: 32),
            child: Column(
              children: [

                Row(
                  children: [
                    Text("Pay", style: TextStyle(color: App_colors.confirm,fontSize: 12),),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Image.asset("images/tcimage.png")
                      ],
                    ),
                    Column(
                      children: [
                        Text("Terry Crews"),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Container(
                          child: MaterialButton(
                            onPressed: (){}, child: Text("dfdf", style: TextStyle(backgroundColor: Colors.red)),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )

    );
  }

}