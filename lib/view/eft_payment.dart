import 'package:flutter/material.dart';
import 'package:practical_test/utils/app_colors.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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

    final String readCounters = """
    query user_by_pk(\$id: String!) {
        username
    }
""";

    bool isChecked = false;

    TextEditingController amounController = TextEditingController(text: "0.00");


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
                    child: TextButton(
                      onPressed: () {

                      },
                      style: ButtonStyle(),
                      child: Text("Confirm", style: TextStyle(color: App_colors.confirm, fontSize: 14,decoration: TextDecoration.underline,),),

                    )

                  )
                ],
              ),
            ),


            // Query(
            //   options: QueryOptions(
            //     document: gql(readCounters),
            //     variables: {
            //       'id': '22f80dda-18f5-4df4-bf9f-2f6a0e04cf84',
            //     },
            //   ),
            //   builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
            //     if (result.hasException) {
            //       return Text(result.exception.toString());
            //     }
            //
            //     if (result.isLoading) {
            //       return const Text('Loading');
            //     }
            //
            //     print(result.data);
            //
            //     // return ProfileWidget(
            //     //   repositories: repositories,
            //     //   userDetails: userDetails,
            //     //   fetchMore: () {
            //     //     fetchMore!(fetchMoreData(
            //     //         userDetails['repositories']['pageInfo']));
            //     //   },
            //     // );
            //   },
            // ),
          ],
        ),
      automaticallyImplyLeading: false,
    ),

      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            color: App_colors.navBackground,
          ),
          Container(
            margin: EdgeInsets.only(left: 69,right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Text("Pay", style: TextStyle(color: App_colors.confirm,fontSize: 12),),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 0),
                  // color: Colors.white,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset("images/tcimage.png")
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Terry Crews", style: TextStyle(color: Colors.white, fontSize: 14),textAlign: TextAlign.left,),
                          Text("FNB .... 9547", style: TextStyle(color: App_colors.balance, fontSize: 13), textAlign: TextAlign.left,),
                        ],
                      ),

                      Spacer(),
                      Column(
                        children: [
                          Container(
                              child: TextButton (
                                  onPressed: () {

                                  },
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                                      foregroundColor: MaterialStateProperty.all<Color>(App_colors.balance),
                                      backgroundColor: MaterialStateProperty.all<Color>(App_colors.navBackground),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: App_colors.balance)
                                          )
                                      )
                                  ),
                                  child: Text("Edit", style: TextStyle(backgroundColor: App_colors.navBackground, color: Colors.white),)

                                // MaterialButton(
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(45)),
                                //   onPressed: (){}, child: Text("Edit", style: TextStyle(backgroundColor: App_colors.navBackground, color: Colors.white)),
                                // ),
                              )
                          )
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 65,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("R",style: TextStyle(color: App_colors.balance, fontSize: 16),),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 121,
                            child: TextFormField(
                              controller: amounController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: App_colors.balance,
                                  fontSize: 50
                                // backgroundColor: Colors.white
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none
                                // hintText: "0.00"
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Text("R5.00 FNB Fees",style: TextStyle(color: App_colors.balance, fontSize: 16),),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Container(
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.white,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Instant EFT",style: TextStyle(color: Colors.white, fontSize: 16),),
                          Text("R10.00 Fee Applies",style: TextStyle(color: App_colors.balance, fontSize: 16),)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )

    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return App_colors.balance;
  }

}