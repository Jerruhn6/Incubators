import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIBinding extends StatefulWidget {
  const APIBinding({super.key});

  @override
  State<APIBinding> createState() => _APIBindingState();

}
class _APIBindingState extends State<APIBinding> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Binding"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: getAllDeviceData,
              child: const Text("Get All Device Data"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: getSingleDeviceDataById,
            child: const Text("Get Single Device Data"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: getAllDeviceDataById,
            child: const Text("Get All Device Data By Id"),
            ),
            ElevatedButton(
              onPressed: postDeviceData,
              child: const Text("Post Device Data"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: putDeviceData,
            child: const Text("Put Device Data"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: deleteDeviceData,
            child: const Text("Delete Device Data"),
            ),
            ElevatedButton(onPressed: patchDeviceData,
            child: const Text("Patch Device Data"),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
  //GET ALL DEVICE DATA
  void getAllDeviceData()async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects");
    http.Response response = await http.get(url);
    log(response.body);
    List<dynamic>jsonData = json.decode(response.body);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context){
          return getAllDeviceData(
            deviceData: jsonData,
          );
        },
      ),
    );
  }
  //GET DEVICE DATA BY ID
  void getAllDeviceDataById()async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects?id=3&id=5&id=10");
    http.Response response = await http.get(url);
    log(responce.body);
    List<dynamic> jsonData = json.decode(response.body);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AllDeviceData(
            deviceData: jsonData,
          );
        },
      ),
    );
  }

  //GET SINGLE DEVICE DATA BY ID
  void getSingleDeviceDataById()async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects/7");
    http.Response response = await http.get(url);
    log(response.body)
  }
}