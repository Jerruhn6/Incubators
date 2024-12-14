// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 3,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourite'),
//           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//         selectedItemColor: Colors.orange,
//         unselectedItemColor: Colors.grey,
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: NetworkImage(
//                 'https://via.placeholder.com/150', // Replace with the actual image URL
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Lora Roberts',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             IconButton(
//               icon: Icon(Icons.edit),
//               onPressed: () {
//                 // Edit name action
//               },
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Settings',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.phone),
//                     title: Text('+380483746375'),
//                     trailing: IconButton(
//                       icon: Icon(Icons.edit),
//                       onPressed: () {
//                         // Edit phone action
//                       },
//                     ),
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.location_on),
//                     title: Text('Ukraine, Ivano-Frankivsk, Kon...'),
//                     trailing: IconButton(
//                       icon: Icon(Icons.edit),
//                       onPressed: () {
//                         // Edit address action
//                       },
//                     ),
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.shopping_cart),
//                     title: Text('My Cart'),
//                     trailing: IconButton(
//                       icon: Icon(Icons.edit),
//                       onPressed: () {
//                         // Edit cart action
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(),
//             TextButton.icon(
//               onPressed: () {
//                 // Logout action
//               },
//               icon: Icon(Icons.logout, color: Colors.orange),
//               label: Text(
//                 'Logout',
//                 style: TextStyle(color: Colors.orange),
//               ),
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }