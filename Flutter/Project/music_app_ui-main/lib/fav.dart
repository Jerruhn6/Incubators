import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       child: Column(
        children: [
          Container(
            height:MediaQuery.of(context).size.height*0.65,
            width:MediaQuery.of(context).size.width,
            decoration:const BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/fav1.jpg'),
                fit: BoxFit.cover
                )
            ),
            child: Column(
              children: [
                SizedBox(
                  height:MediaQuery.of(context).size.height*0.588,
       
                ),
                Text("Alone in the Abyss",
                style: GoogleFonts.inter(
                  color: Colors.amber,fontWeight: FontWeight.w400,fontSize: 24),),
                  Text("Youlakou",
                style: GoogleFonts.inter(
                  color: Colors.white,fontWeight: FontWeight.w600,fontSize: 13),)
              ],
            ),
          ),
          Container(
            height:MediaQuery.of(context).size.height*0.283,
            width:MediaQuery.of(context).size.width,
            color: Colors.black,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               
               
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.file_upload_sharp,color: Colors.amber,size: 30,),
                    SizedBox(width: 20,)
                  ],
                ),
                SizedBox(height: 10,),
                 Row(
                  
                  children: [
                    const SizedBox(width: 10,),
                    Text("Dynamic Warmup | ",style: GoogleFonts.inter(
                  color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
                  Spacer(),
                  Text("4 Min",style: GoogleFonts.inter(
                  color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
                  const SizedBox(width: 20,)          
                  ],
                  ),
                const   SizedBox(height: 5,),
                               
                const Padding(
                  padding:  EdgeInsets.only(left: 13,right: 10,top: 3),
                  child:  LinearProgressIndicator(
                    value: 0.3,
                    backgroundColor: Color.fromARGB(255, 84, 84, 84)
                    ,valueColor:AlwaysStoppedAnimation(Color.fromARGB(255, 200, 157, 29)),
                    minHeight: 7,),
                )  ,
                const Padding(
                  padding:EdgeInsets.only(top:5,left: 30,right: 30)
                  ,child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.repeat_one_rounded,color: Colors.white,size: 30,),
                      Icon(Icons.skip_previous,color: Colors.white,size: 40,),
                       Icon(Icons.play_circle_fill,color: Colors.white,size: 70,),
                        Icon(Icons.skip_next,color: Colors.white,size: 40,),
                         Icon(Icons.volume_up,color: Colors.white,size: 30,),
                    ],
                  ),
                  )             
              ],
            ),
          )
        ],
       ),
     ),
    );
  }
}