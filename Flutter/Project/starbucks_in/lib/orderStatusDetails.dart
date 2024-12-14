import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderStatusDetails extends StatefulWidget {
  const OrderStatusDetails({super.key});

  @override
  State<OrderStatusDetails> createState() => _OrderStatusDetailsState();
}

class _OrderStatusDetailsState extends State<OrderStatusDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Status Details",
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.black, 
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              // child: Text(
              //   "Order Status Details",
              //   style: GoogleFonts.lato(
              //     textStyle: Theme.of(context).textTheme.displayLarge,
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     fontStyle: FontStyle.italic,
              //     color: Colors.black, 
              //   ),
              // ),
            ),
            OrderStatusItem(
              status: "Order Confirmed",
              date: "20-12-2022",
              time: "11:00 PM",
              isLast: false,
            ),
            OrderStatusItem(
              status: "Order Processed",
              date: "20-12-2022",
              time: "10:00 PM",
              isLast: false,
            ),
            OrderStatusItem(
              status: "On Delivery",
              date: "20-12-2022",
              time: "12:00 PM",
              isLast: false,
            ),
            OrderStatusItem(
              status: "Order Completed",
              date: "",
              time: "",
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderStatusItem extends StatelessWidget {
  final String status;
  final String date;
  final String time;
  final bool isLast;

  const OrderStatusItem({
    super.key,
    required this.status,
    required this.date,
    required this.time,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white, 
          border: Border.all(
            color: Colors.grey.shade300, 
            width: 1.0, 
          ),
          borderRadius: BorderRadius.circular(12), 
          boxShadow: const [
            BoxShadow(
              color: Colors.black12, 
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: const Center(
                    child: Icon(Icons.check, color: Colors.green),
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 50,
                    color: Colors.grey[300], 
                  ),
              ],
            ),
            const SizedBox(width: 16.0),

           
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (date.isNotEmpty && time.isNotEmpty)
                  Text(
                    "$date, $time",
                    style: const TextStyle(color: Colors.grey),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
