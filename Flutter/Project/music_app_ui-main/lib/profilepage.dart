import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  List<Map> discographList = [
   {
    "img":'assets/Rectangle 32.png',
    "title": "Dead inside",
    "year":2020

   } 
   ,{
    "img":'assets/Rectangle 38.png',
    "title": "Alone",
    "year":2023

   } ,
   {
    "img":'assets/Rectangle 39.png',
    "title": "Heartless",
    "year":2023

   } 
  ];


   List<Map> popular = [
   {
    "img":'assets/Rectangle 34.png',
    "title": "We Are Chaos",
    "year":2023,
    "type":"ease living"

   } 
   ,{
    "img":'assets/Rectangle 40.png',
    "title": "Smile",
    "year":2023,
    "type":"berrechid"

   } ,
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height*0.4,
          width:MediaQuery.of(context).size.width,
          decoration:const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/profile1.jpg'),
            fit: BoxFit.cover)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(height: MediaQuery.of(context).size.height*0.23,),
                Text("A.L.O.N.E",style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,fontSize: 36,
                  color: Colors.white
                ),),
                SizedBox(height: 10,),
                ElevatedButton(
                    style: const ButtonStyle(
                      
                      backgroundColor: WidgetStatePropertyAll(Colors.red)
                    ),
                    onPressed: (){
                      
                      
                  }, child: Text("Subscribe",style:GoogleFonts.inter(
                    fontWeight: FontWeight.w600,fontSize: 16,color: Colors.black
                  ))),
              ],
            ),
          ),
        ),
        Container(
          color:const Color.fromARGB(255, 24, 24, 24),
          height:MediaQuery.of(context).size.height*0.34 ,
          width:MediaQuery.of(context).size.width ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
               height:MediaQuery.of(context).size.height*0.05,
            ),
            Row(
              children: [
                const SizedBox(width: 15,),
                Expanded(
                  child: Row(
                    
                    children: [
                      Text("Discography",style:GoogleFonts.inter(
                              fontWeight: FontWeight.w600,fontSize: 16,color: Colors.red
                            )),
                            Spacer(),
                            Text("See All",style:GoogleFonts.inter(
                          fontWeight: FontWeight.w600,fontSize: 14,color: Colors.amber
                        )),
                        const SizedBox(width: 14,)
                    ],
                  ),
                ),
              ],
            ),
                const  SizedBox(height: 8,),
             Expanded(
               child: ListView.builder(
                itemCount: discographList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Padding(
                    padding:const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.height*0.18 ,
                          width:MediaQuery.of(context).size.width*0.33,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: AssetImage("${discographList[index]['img']}")
                            ,fit: BoxFit.cover)
                            
                          ),
                        ),
                        Text(discographList[index]['title'],style:GoogleFonts.inter(
                          fontWeight: FontWeight.w600,fontSize: 12,color: const Color.fromARGB(255, 213, 211, 211)
                        )),
                        Text("${discographList[index]['year']}",style:GoogleFonts.inter(
                          fontWeight: FontWeight.w600,fontSize: 10,color:  Colors.grey,
                        ))
                      ],
                    ),
                    );
               
               }),
             )     
          ],),
        ),
        Expanded(child: Container(
          width:MediaQuery.of(context).size.width,
          color:const Color.fromARGB(255, 24, 24, 24),
          child: Column(
            children: [
              Row(
              children: [
                const SizedBox(width: 15,),
                Expanded(
                  child: Row(
                    
                    children: [
                      Text("Popular Singles",style:GoogleFonts.inter(
                              fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white
                            )),
                            Spacer(),
                            Text("See All",style:GoogleFonts.inter(
                          fontWeight: FontWeight.w600,fontSize: 14,color: Colors.amber
                        )
                        ),
                        



             
                    ],
                  ),
                ),
                const SizedBox(width: 15,),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: popular.length,
                itemBuilder:(context,index){
                  return Padding(
                    padding: const EdgeInsets.only(left: 15,bottom: 10),
                    child: Row(children: [
                             Container(
                              height:MediaQuery.of(context).size.height*0.09 ,
                              width:MediaQuery.of(context).size.width*0.17,
                              decoration: BoxDecoration(
                                image:DecorationImage(image:  AssetImage('${popular[index]['img']}'),
                                fit: BoxFit.cover
                                )
                              ),
                             )
                           ,const SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(popular[index]['title'],style:GoogleFonts.inter(
                          fontWeight: FontWeight.w600,fontSize: 12,color: const Color.fromARGB(255, 213, 211, 211)
                        )),
                       const SizedBox(height: 5,),
                        Text("${popular[index]['year']}* ${popular[index]['type']}",style:GoogleFonts.inter(
                          fontWeight: FontWeight.w600,fontSize: 10,color:  Colors.grey,
                        ))
                                
                              ],
                            )
                    
                    ,Spacer(),
                   const Icon(Icons.more_vert,color: Colors.white,size: 40,)
                  ,const SizedBox(width: 15,)
                    ],),
                    );

              })
            
            ),
            ],
          ),
        ))
      ],),
    );
  }
}