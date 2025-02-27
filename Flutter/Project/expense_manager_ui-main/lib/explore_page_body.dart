import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ExplorePageBody extends StatefulWidget {
  const ExplorePageBody({super.key});

  @override
  State<ExplorePageBody> createState() => _ExplorePageBodyState();
}

class _ExplorePageBodyState extends State<ExplorePageBody> {

      TextEditingController amountController=TextEditingController();
      TextEditingController categoryController=TextEditingController();
    TextEditingController descriptionController=TextEditingController();
    TextEditingController dateController=TextEditingController();


  
  void showBottomSheet(){

    showModalBottomSheet(

      context: context, 
      isScrollControlled: true,
      builder: (context){
        return Padding(
          padding:  EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top:45,
            left: 12,
            right: 12,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height*0.52,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [

                Text(
                  "Date",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(33, 33, 33, 1)
                  ),
                ),
                const SizedBox(height: 10,),
            
                Container(
                  width: MediaQuery.of(context).size.width*0.95,
                  height: MediaQuery.of(context).size.width*0.10,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suffixIcon: GestureDetector(onTap: ()
                      async{
                  DateTime? pickedDate = await showDatePicker(
                         context: context, 
                         firstDate: DateTime(2024), 
                          lastDate: DateTime(2025),
                          );
                        String formattedDate=DateFormat.yMMMd().format(pickedDate!);

                      setState(() {
                        dateController.text=formattedDate;
                      });
                },child: const Icon(Icons.calendar_month))
                    ),
                              
                    
                    
                    
                  ),
                ),
            
                const SizedBox(height: 18,),
            
                Text(
                  "Amount",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(33, 33, 33, 1)
                  ),
                ),
                const SizedBox(height: 10,),
            
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.95,
                  height: MediaQuery.of(context).size.width*0.10,
                  child: TextField(
                    controller: amountController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18,),

                Text(
                  "Category",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(33, 33, 33, 1)
                  ),
                ),
                const SizedBox(height: 10,),
            
               SizedBox(
                  width: MediaQuery.of(context).size.width*0.95,
                  height: MediaQuery.of(context).size.width*0.10,
                  child: TextField(
                    controller: categoryController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),

                 const SizedBox(height: 18,),
            
                 Text(
                  "Description",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(33, 33, 33, 1)
                  ),
                ),
                const SizedBox(height: 10,),
            
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.95,
                  height: MediaQuery.of(context).size.width*0.10,
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
            
                
                 const SizedBox(height:35),
            
                   Center(
                     child: SizedBox(
                      height: 40,
                      width: 123,
                       child: ElevatedButton(
                        onPressed: () {
                          
                        },
                       
                        style: const ButtonStyle(
                       
                          backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(14,161,125,1),
                       
                          ),
                         
                        ),
                       
                        child: Text(
                          "Add",
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                          ), 
                        ),
                       ),
                     ),
                   ),
              ],
            ),
          ),
        );
      }
      );

  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                      
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Container(
                        height: 43,
                        width: 43,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(214, 3, 3, 0.7),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              "assets/SVG/food_icon.svg",
                              height: 50,
                              width: 50,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Food",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.remove_circle,
                                          color: Color.fromRGBO(246, 113, 49, 1),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "500",
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                               
                                Text(
                                  "Lorem Ipsum is simply dummy text of the",
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      "3 June | 11:50 AM",
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: Color.fromRGBO(206, 206, 206, 1),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: GestureDetector(
              onTap: () {
                
              },
              child: GestureDetector(
                onTap:(){
                         showBottomSheet();
                },
                child: Container(
                  height:46,
                  width:166,
                  alignment: Alignment.center,
                             
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 3),
                        blurRadius: 10,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     const Icon(
                        Icons.add_circle,
                        size: 32,
                        color: Color.fromRGBO(14, 161, 125, 1),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Add Transaction",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
