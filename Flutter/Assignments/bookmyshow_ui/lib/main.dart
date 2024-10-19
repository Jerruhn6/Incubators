import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookMyShowHomePage(),
    );
  }
}

class BookMyShowHomePage extends StatefulWidget {
  const BookMyShowHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookMyShowHomePageState createState() => _BookMyShowHomePageState();
}

class _BookMyShowHomePageState extends State<BookMyShowHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('It All Starts Here!'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon:Icon(Icons.qr_code),onPressed:() {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 35,
              width: 500,
              color: Colors.blue,
              child: const Center(
                child: Text("Enable location to discover nearby events, movies and more.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                 child: Row(
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  // ),
                  children: [
                    Column(
                      children: [
                      Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZYxFJkhD9fETA1MOeajc9NpGQeWUL0XFMrA&s",
                      height: 35,
                      width: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Movies",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                      ),
                    ],
                    ),
                    Column(
                      children: [
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpEf81tSnuTNA0ffGFpucXe60UF6t9Qh7uzw&s",
                        height: 30,
                        width: 50,
                        ),
                        const SizedBox(
                        height: 10,
                      ),
                        const Text("HSBC ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          //wordSpacing: BorderSide.strokeAlignCenter
                          ),
                        ),
                        const Text("Lounge",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          //wordSpacing: BorderSide.strokeAlignCenter
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children:[
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrkGr8h-IBRUfub-_zO9RgScWaVOjWMV3MkQ&s",
                        height: 35,
                        width: 50
                        ),
                        const Text("Music",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                          ),
                        ),
                        const Text("Shows",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          //wordSpacing: BorderSide.strokeAlignCenter
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children:[
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1U7z0sqmYLmT9BuairWDarC4WcEBLl5YYjA&s",
                        height: 40,
                        width: 50
                        ),
                        const Text("Comedy Shows",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                          ),
                        ),
                        // const Text("Shows",
                        // style: TextStyle(
                        //   fontSize: 12,
                        //   fontWeight: FontWeight.bold,
                        //   //wordSpacing: BorderSide.strokeAlignCenter
                        //   ),
                        // ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuKgqmz2TqQicRq9-K9LGKZxSbHjMFJhvZeg&s",
                        height: 40,
                        width: 50,
                        ),
                        const Text("Plays",
                        style: TextStyle(
                        fontSize: 12,
                        fontWeight:FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF2RddRokM7f6Vq39uK8Dx37aD6QLB3U5tOg&s",
                        height: 30,
                        width: 50,
                        ),
                        const Text("Sports",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children:[
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3QAriNY42uWF5h2EDTtKuby4VZOp4j0r4pw&s",
                        height: 30,
                        width: 50,
                        ),
                        const Text("See All",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ],
                             ),
               ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:[
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXlFlUoc2VWtshC-LSoXAYrzeiplliSoR2hw&s",fit: BoxFit.fitWidth,height: 200,width: MediaQuery.of(context).size.width,),
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFKib9rzPK3XPyb3HwxF2aFZGf5VzkIGj-vA&s",fit: BoxFit.fitWidth,height: 200,width: MediaQuery.of(context).size.width,),
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0k78OvtPoHDr2NVZs3JIfLagDqf2KPdqvUA&s",fit: BoxFit.fitWidth,height: 200,width: MediaQuery.of(context).size.width,),
                        Image.network("https://i.pinimg.com/originals/f0/ad/45/f0ad4511b150c5f5d2cd1cf2d000c7df.png",fit: BoxFit.fitWidth,height: 200,width: MediaQuery.of(context).size.width,),
                      //   Container(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0k78OvtPoHDr2NVZs3JIfLagDqf2KPdqvUA&s
                      //  // padding:const EdgeInsets.all(0.5),
                      //   height: 300,
                      //   width: 300,
                      //   child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0k78OvtPoHDr2NVZs3JIfLagDqf2KPdqvUA&s"),
                      // ),
                      // Container(
                      // // padding:const EdgeInsets.all(0.5),
                      //   height: 500,
                      //   width: 300,
                      //   child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7utH2P4eA0FTr99hjE_1nUzub4QF-HAOnOQ&s"),
                      // ),
                      // Container(
                      //  //padding:const EdgeInsets.all(0.5),
                      //   height: 500,
                      //   width: 300,
                      //   child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStS4ZK7KcI60t_ynejmksp12ARFbW1lEcC-w&s"),
                      // ),
                      // Container(
                      // //  padding:const EdgeInsets.all(0.5),
                      //   height: 500,
                      //   width: 300,
                      //   child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs3tVg7M6XQyGNv3wrc8rqHLPmSZs6rBVtpg&s"),
                      // ),
                      // Container(
                      //  // padding:const EdgeInsets.all(0.5),
                      //   height: 500,
                      //   width: 300,
                      //   child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDOJNKg7sndqb4FbnC7p8C86j11QsuUOxWKg&s"),
                      // ),
                      // Container(
                      //  // padding:const EdgeInsets.all(0.5),
                      //   height: 500,
                      //   width: 300,
                      //   child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi90VNmtJ409-_ERzqY8r7JXBzgo4rliei5w&s"),
                      // ),
                      ],
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("assets/bookmyshow.jpg",fit: BoxFit.fitWidth,height: 100,),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text("Recommended Movies",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                  ),
                  Spacer(),
                  Text("See All",style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold,
                  color: Color.fromARGB(255, 231, 56, 43)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:[
                        Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding:const EdgeInsets.only(right: 5.5,left: 11,top: 5.5,bottom: 5.5),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            ),
                            
                          height: 250,
                          width: 150,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJru4nlVSH50IWcSCGEF2q8TdnwE_Ba1BauQ&s",
                          fit: BoxFit.cover,),
                                                ),
                        ),
                       Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding:const EdgeInsets.only(right: 5.5,left: 5.5,top: 5.5,bottom: 5.5),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            ),
                        // height: 500,
                        // width: 300,
                         height: 250,
                        width: 150,
                        clipBehavior:Clip.antiAlias,

                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7utH2P4eA0FTr99hjE_1nUzub4QF-HAOnOQ&s",fit: BoxFit.cover,),
                      ),
                       ),
                       Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding:const EdgeInsets.only(right: 5.5,left: 5.5,top: 5.5,bottom: 5.5),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            ),
                        // height: 500,
                        // width: 300,
                         height: 250,
                        width: 150,
                        clipBehavior:Clip.antiAlias,
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStS4ZK7KcI60t_ynejmksp12ARFbW1lEcC-w&s",fit: BoxFit.cover,),
                      ),),
                       Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding:const EdgeInsets.only(right: 5.5,left: 5.5,top: 5.5,bottom: 5.5),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            ),
                        // height: 500,
                        // width: 300,
                         height: 250,
                        width: 150,
                        clipBehavior:Clip.antiAlias,
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs3tVg7M6XQyGNv3wrc8rqHLPmSZs6rBVtpg&s",fit: BoxFit.cover,),
                      ),
                      ),
                       Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding:const EdgeInsets.only(right: 5.5,left: 5.5,top: 5.5,bottom: 5.5),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            ),
                        // height: 500,
                        // width: 300,
                         height: 250,
                        width: 150,
                        clipBehavior:Clip.antiAlias,
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDOJNKg7sndqb4FbnC7p8C86j11QsuUOxWKg&s",fit: BoxFit.cover,),
                      ),
                      ),
                       Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding:const EdgeInsets.only(right: 5.5,left: 5.5,top: 5.5,bottom: 5.5),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            ),
                              height: 250,
                              width: 150,
                              clipBehavior:Clip.antiAlias,
                              child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi90VNmtJ409-_ERzqY8r7JXBzgo4rliei5w&s",fit: BoxFit.cover,),
                          ),
                        ),
                      ],
                    ),
              ),
              const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text("Now Showing ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                  ),
                  Spacer(),
                  Text("See All",style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold,
                  color: Color.fromARGB(255, 231, 56, 43)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:[
                        Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding:const EdgeInsets.only(right: 5.5,left: 11,top: 5.5,bottom: 5.5),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            ),
                            
                          height: 250,
                          width: 150,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyEZZegVtthvAl2KfQR2h_O1ob1MXuoBrX0w&s",
                          fit: BoxFit.cover,),
                                                ),
                        ),
                       Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding:const EdgeInsets.only(right: 5.5,left: 5.5,top: 5.5,bottom: 5.5),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            ),
                        // height: 500,
                        // width: 300,
                         height: 250,
                        width: 150,
                        clipBehavior:Clip.antiAlias,

                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOCgNxb2bm4YccYhwI78osVdkm9o10HSk7DFrR5NJwFXkU8FE2VXRNgjxSZDRzptLttzA&usqp=CAU",
                        fit: BoxFit.cover,),
                      ),
                       ),
                       Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding:const EdgeInsets.only(right: 5.5,left: 5.5,top: 5.5,bottom: 5.5),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            ),
                        // height: 500,
                        // width: 300,
                         height: 250,
                        width: 150,
                        clipBehavior:Clip.antiAlias,
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMQnJ6FaZ_9z6ZP1jFg-uEqm9JXiknht4kiO0LpReNbS_C7iZ2_I_hv6XMHhB_UFGDOzo&usqp=CAU",fit: BoxFit.cover,),
                      ),),
                       Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding:const EdgeInsets.only(right: 5.5,left: 5.5,top: 5.5,bottom: 5.5),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            ),
                        // height: 500,
                        // width: 300,
                         height: 250,
                        width: 150,
                        clipBehavior:Clip.antiAlias,
                        child: Image.network("https://m.media-amazon.com/images/M/MV5BZGUxMjVmNGUtZGI4Zi00MmUxLWE1NGItOWE1MDhkOThiYmFhXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg",fit: BoxFit.cover,),
                      ),
                      ),
                       Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding:const EdgeInsets.only(right: 5.5,left: 5.5,top: 5.5,bottom: 5.5),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            ),
                        // height: 500,
                        // width: 300,
                         height: 250,
                        width: 150,
                        clipBehavior:Clip.antiAlias,
                        child: Image.network("https://i.pinimg.com/736x/88/a0/2d/88a02d1fcf4465bbb6524c9ce11031bd.jpg",fit: BoxFit.cover,),
                      ),
                      ),
                       Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding:const EdgeInsets.only(right: 5.5,left: 5.5,top: 5.5,bottom: 5.5),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            ),
                              height: 250,
                              width: 150,
                              clipBehavior:Clip.antiAlias,
                              child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi90VNmtJ409-_ERzqY8r7JXBzgo4rliei5w&s",fit: BoxFit.cover,),
                          ),
                        ),
                      ],
                    ),
              ),
                  
          ],
        ),
      ),
    );
  }
}