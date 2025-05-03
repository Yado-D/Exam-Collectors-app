
import 'package:examcollectors/Pages/HomePage/widgets/schedule/PomodoroPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';
import 'Note/NoteTaking.dart';
import 'calculatorUi.dart';

Widget toolkitPage(BuildContext context){
  return SliverToBoxAdapter(
    child: Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ContainerDesign(
              context,'Grade Calculator',
              'calculator',
                (){
                //container clicked
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>calculatorUi()));
                },
                (){},
          ),
          ContainerDesign(
            context,'Pomodoro Tool',
            'schedule',
                (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PomodoroTimerPage()));
                },
                (){},
          ),
          ContainerDesign(
            context,'Note Taking',
            'note',
                (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>classSchedule()));
                },
                (){},
          ),
        ],
      ),
    ),
  );
}

//toolkit widget for gradecalculator....

Widget ContainerDesign(BuildContext context,String txt,String image,VoidCallback ContainerClicked,VoidCallback moreClicked){
   return InkWell(
     onTap: ContainerClicked,
     child: Container(
       margin: EdgeInsets.all(5),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         color: ColorCollections.WhiteColor,
       ),
       height: 80,
       width:MediaQuery.of(context).size.width-30,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           Container(
             margin: EdgeInsets.only(left: 10),
             height: 50,
             width: 50,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               image: DecorationImage(
                 fit: BoxFit.fill,
                 image: AssetImage('assets/Images/$image.png'),
               ),
             ),
           ),
           Container(
             margin: EdgeInsets.only(right: 55),
             child:Column(
               mainAxisAlignment: MainAxisAlignment.center,
               // crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 ReusableText(
                   // FromTop: 10,
                   FromBottom: 0,
                   FromLeft: 30,
                   TextString: txt,
                   FontSize: 16,
                   TextColor: Colors.black,
                   TextFontWeight: FontWeight.w500,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     for(int i=0;i<5;i++)
                       InkWell(
                         onTap: moreClicked,
                           child: Icon(Icons.star,size: 18,color: Colors.black,)),

                   ],
                 )

               ],
             ) ,
           ),
           Container(
             child: IconButton(
               onPressed: (){},
               icon: Icon(Icons.more_vert),
             ),
           ),
         ],
       ),
     ),
   );
}