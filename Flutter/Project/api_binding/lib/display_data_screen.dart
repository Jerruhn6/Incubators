import 'package:flutter/material.dart';

class DisplayDataScreen extends StatefulWidget {
  dynamic data = [];
  DisplayDataScreen({super.key,required this.data});

  @override
  State<DisplayDataScreen> createState() => _DisplayDataScreenState();
}

class _DisplayDataScreenState extends State<DisplayDataScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Dispaly Data Screen",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.bottomCenter,
                height: 250,
                //width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue, width: 2),
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 3.5,
                          blurRadius: 4,
                          offset: const Offset(4, 4))
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 200,
                        width: 350,
                        child: Image.network(
                          "https://www.apple.com/newsroom/images/2024/09/apple-debuts-iphone-16-pro-and-iphone-16-pro-max/article/Apple-iPhone-16-Pro-finish-lineup-240909_big.jpg.large.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      widget.data[index]["name"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
