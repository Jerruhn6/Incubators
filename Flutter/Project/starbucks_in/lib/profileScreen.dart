import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 3,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite), label: 'Favourite'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_cart), label: 'Cart'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //   ],
      //   selectedItemColor: Colors.orange,
      //   unselectedItemColor: Colors.grey,
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJQQb_a7dNJkCek_QcPIPlI3ZjqbdRLRAz-Q&s',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Jerry',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black, 
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
              
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black, 
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 5), 
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, 
                        width: 1, 
                      ),
                      borderRadius:
                          BorderRadius.circular(10), 
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.phone_outlined),
                      title: Text(
                        '+919325822114',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.black, 
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit_outlined),
                        onPressed: () {
                          
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, 
                        width: 1, 
                      ),
                      borderRadius:
                          BorderRadius.circular(10), 
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text('Ukraine, Ivano-Frankivsk, Kon...',style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.black, 
                        ),),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit_outlined),
                        onPressed: () {
                        
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 5), 
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, 
                        width: 1, 
                      ),
                      borderRadius:
                          BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.shopping_cart),
                      title: Text('My Cart',style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.black, 
                        ),),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit_outlined),
                        onPressed: () {
                          
                        },
                      ),
                    ),
                  ),

                  // ListTile(
                  //   leading: Icon(Icons.location_on),
                  //   title: Text('Ukraine, Ivano-Frankivsk, Kon...'),
                  //   trailing: IconButton(
                  //     icon: Icon(Icons.edit),
                  //     onPressed: () {
                  //       // Edit address action
                  //     },
                  //   ),
                  // ),
                  // ListTile(
                  //   leading: Icon(Icons.shopping_cart),
                  //   title: Text('My Cart'),
                  //   trailing: IconButton(
                  //     icon: Icon(Icons.edit),
                  //     onPressed: () {
                  //       // Edit cart action
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
            // Spacer(),
            const SizedBox(
              width: 400,
              height: 30,
            ),
            TextButton.icon(
              onPressed: () {
                
              },
              icon: Icon(Icons.logout, color: Colors.orange),
              label: Text(
                'Logout',
                style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.orange, 
                        ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
