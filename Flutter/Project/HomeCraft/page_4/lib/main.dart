import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      //   appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {},
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.shopping_cart),
      //       onPressed: () {},
      //     ),
      //     IconButton(
      //       icon:const Icon(Icons.more_vert),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Stack(
                children: [
                  Image.network("https://img.freepik.com/free-photo/armchair-green-living-room-with-copy-space_43614-910.jpg?t=st=1731570144~exp=1731573744~hmac=f6cc7264a2e4991b86d995cc0ddcde0fb7568a9d9af738b958f47a8f05e20bd6&w=996",fit:BoxFit.cover),
                  const Positioned(
                    bottom: 130,
                    left: 120,
                    child: Text(
                      "Kelly Thulstrup",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 40
                      ),
                      child: const Icon(
                        Icons.arrow_back,color:Colors.white,
                      ),
                  ),
                  Container(
                    padding: const  EdgeInsets.only(
                      left: 330,
                      top: 40,
                      ),
                      child: const Icon(
                        Icons.shopping_cart,color: Colors.white,
                      ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 375,
                      top: 40
                      ),
                      child: const Icon(
                        Icons.more_vert,color: Colors.white,
                      ),
                  ),
                ]
              ),
              const SizedBox(
                height: 30,
              ),
              
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Great design is the shape bye passion and wish to make a real difference",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 80,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 150,
                              width: 300,
                            child: Text("This handy tool helps you create dummy text for all your layout needs. We are gradually adding new functionality and we welcome your suggestions and feedback.Please feel free to send us any additional dummy texts.",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Text("Kelly's Designs",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      ),
                      const Spacer(),
                      GestureDetector(
                        child: const Text("View All",
                          style: TextStyle(
                            fontSize: 14,fontWeight:FontWeight.bold,
                            color: Color.fromARGB(255, 231, 56, 43),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:[
                      Container(
                        padding:const EdgeInsets.all(5),
                        height: 300,
                        width: 200,
                        child: Image.network("https://img.freepik.com/free-photo/interior-room-decor-with-potted-plants_23-2149427974.jpg?t=st=1732170074~exp=1732173674~hmac=78e2449e0ca2ee8993595a42b5f62293d5b6bdf502c9d81c3558bed5db33fc0a&w=360",fit:BoxFit.cover),
                      ),
                      Container(
                        padding:const EdgeInsets.all(5),
                        height: 300,
                        width: 200,
                        child: Image.network("https://img.freepik.com/free-photo/view-potted-plant-room-with-chair-shelf_23-2149427964.jpg?t=st=1732170406~exp=1732174006~hmac=83d2358fdfdcc98052d4ecfb4650d714486b1b703fb8e09c6022734e266681db&w=360",fit:BoxFit.cover),
                      ),
                      Container(
                        padding:const EdgeInsets.all(5),
                        height: 300,
                        width: 200,
                        child: Image.network("https://img.freepik.com/free-photo/high-angle-photo-camera-plant_23-2149678921.jpg?t=st=1732171035~exp=1732174635~hmac=e4fc029dba713c06c7fa81d37e554d9e7218369b38b4f58ca410caf444204140&w=360",fit:BoxFit.cover),
                      ),
                      Container(
                        padding:const EdgeInsets.all(5),
                        height: 300,
                        width: 200,
                        child: Image.network("https://img.freepik.com/free-photo/interior-design-with-armchair-potted-plant_23-2149427983.jpg?t=st=1732171200~exp=1732174800~hmac=da798cba8e55bb90b9e0e96523e5bda90edbe623b948bf7be9f73c3d66cf6231&w=360",fit:BoxFit.cover),
                      ),
                      Container(
                        padding:const EdgeInsets.all(5),
                        height: 300,
                        width: 200,
                        child: Image.network("https://img.freepik.com/free-photo/digital-art-interior-lamp-design_23-2151153924.jpg?t=st=1732171419~exp=1732175019~hmac=21ca729a6a584f6722f09f053be631c3278a3e30fbbdd1fd0c1afc25f2953f5f&w=360",fit:BoxFit.cover),
                      ),
                      Container(
                        padding:const EdgeInsets.all(5),
                        height: 300,
                        width: 200,
                        child: Image.network("https://img.freepik.com/free-photo/view-potted-plant-room-metal-shelf_23-2149427963.jpg?t=st=1732171472~exp=1732175072~hmac=d9472473e582800edeb8267e2b3faf62fa5c6fb4105cf48accefeca84cae41d8&w=360",fit:BoxFit.cover),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
}
