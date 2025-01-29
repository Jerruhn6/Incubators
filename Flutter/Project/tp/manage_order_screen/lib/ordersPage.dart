import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final List<Map<String, dynamic>> orders = [
    {'orderId': '1', 'productName': 'Profiterol', 'status': '--', 'isConfirmed': false},
    {'orderId': '2', 'productName': 'Expresso', 'status': '--', 'isConfirmed': false},
    {'orderId': '3', 'productName': 'Cappuccino', 'status': '--', 'isConfirmed': false},
  ];

  final bool isHotelOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
    // backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Manage Orders',
          style: GoogleFonts.lato(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: orders.isEmpty
            ? Center(
                child: Text(
                  'No orders available.',
                  style: GoogleFonts.lato(color: Colors.black54, fontSize: 20),
                ),
              )
            : ListView(
                children: orders.map((order) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order['productName'],
                            style: GoogleFonts.lato(color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Order ID: ${order['orderId']}',
                            style: GoogleFonts.lato(color: Colors.black87, fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status: ${order['status']}',
                                style: GoogleFonts.lato(
                                  color: _getStatusColor(order['status']),
                                  fontSize: 18,
                                ),
                              ),
                              if (!isHotelOpen)
                                _buildStatusWidget(order),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
      ),
    );
  }

  Widget _buildStatusWidget(Map<String, dynamic> order) {
    return ElevatedButton(
      onPressed: () => _showOrderActionDialog(context, order),
      child: const Text('Manage Order'),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Confirmed':
        return Colors.green;
      case 'Preparing':
        return Colors.orange;
      case 'On the Way':
        return Colors.blue;
      case 'Delivered':
        return Colors.teal;
      case 'Declined':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _showOrderActionDialog(BuildContext context, Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Order Action'),
          content: const Text('Do you want to confirm or decline this order?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _updateOrderStatus(order, 'Declined', false);
              },
              child: const Text('Decline'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _updateOrderStatus(order, 'Confirmed', true);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _updateOrderStatus(Map<String, dynamic> order, String newStatus, bool isConfirmed) {
    setState(() {
      final index = orders.indexWhere((o) => o['orderId'] == order['orderId']);
      if (index != -1) {
        orders[index]['status'] = newStatus;
        orders[index]['isConfirmed'] = isConfirmed;
      }
    });
  }
}
