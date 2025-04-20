import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';

class ChatbotScreen extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();
  final ChatController controller = Get.find<ChatController>();

  ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chatbot",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),backgroundColor: Colors.black,
      ),
      
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/baground image.jpg', // Make sure this image is in your assets folder
            fit: BoxFit.cover,
          ),

          // Semi-transparent overlay to improve readability
          Container(color: Colors.black.withOpacity(0.3)),

          // Chat UI
          Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          controller.messages[index],
                          style: TextStyle(
                            color: Colors.white,
                          ), // Make text readable
                        ),
                      );
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        controller.addMessage(
                          "User: ${messageController.text}",
                        );
                        controller.addMessage("Bot: I'm here to help!");
                        messageController.clear();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
