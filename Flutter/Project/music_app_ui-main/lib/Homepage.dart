
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.7,
            width: MediaQuery.of(context).size.width,
            decoration:const  BoxDecoration(
             image: DecorationImage(
                     image: AssetImage("assets/musicBackground.jpg"),
                     fit: BoxFit.cover
             )
               
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 SizedBox(height:MediaQuery.of(context).size.height*0.5,),
                  Text("Dancing between",style:GoogleFonts.inter(
                          fontWeight: FontWeight.w600,fontSize: 36,color: Colors.white
                        )),
                  Text("The Shadows",style:GoogleFonts.inter(
                          fontWeight: FontWeight.w600,fontSize: 36,color: Colors.white
                        )), 
                    Text("Of rhythm",style:GoogleFonts.inter(
                          fontWeight: FontWeight.w600,fontSize: 36,color: Colors.white
                        )),          
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.3,
            width: MediaQuery.of(context).size.width,
            color:const Color.fromARGB(255, 5, 4, 4),
            child: Column(
              children: [
                SizedBox(
                  height: 47,
                  width: 261,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      
                      backgroundColor: WidgetStatePropertyAll(Colors.red)
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return const MyBottomNavigationBar();
                      }));
                  }, child: Text("Get Started",style:GoogleFonts.inter(
                    fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black
                  ))),
                ),
                 SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                 Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 47,
                  width: 261,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      
                      backgroundColor: WidgetStatePropertyAll(Colors.black)
                    ),
                    onPressed: (){
                  
                  }, child: Text("Continue with Email",style:GoogleFonts.inter(
                    fontWeight: FontWeight.w600,fontSize: 20,color: Colors.red
                  ))),
                ),
                 SizedBox(height:MediaQuery.of(context).size.height*0.02,),
                 Text("by continuing you agree to terms",style:GoogleFonts.inter(
                    fontWeight: FontWeight.w600,fontSize: 14,color: Colors.grey
                  )),
                  
                 Text("of services and  Privacy policy",style:GoogleFonts.inter(
                    fontWeight: FontWeight.w600,fontSize: 14,color: Colors.grey
                  ))
              ],
            ),

          ),
         
        ],
      ),
    );
  }
}