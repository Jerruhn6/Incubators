import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/register.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown[500],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJQQb_a7dNJkCek_QcPIPlI3ZjqbdRLRAz-Q&s',
                ),
              ),
              const SizedBox(height: 12),
              // User Name
              Text(
                'Ashish',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // Edit Button
              IconButton(
                icon: const Icon(Icons.edit_outlined, color: Colors.brown),
                onPressed: () {
                  // Add edit profile functionality here
                },
              ),
              const SizedBox(height: 20),
              // Settings Section
              Expanded(
                child: ListView(
                  children: [
                    _buildSettingTile(
                      context,
                      Icons.phone_outlined,
                      '+919325822114',
                      'Edit Phone Number',
                      () {},
                    ),
                    _buildSettingTile(
                      context,
                      Icons.location_on,
                      'Ukraine, Ivano-Frankivsk, Kon...',
                      'Edit Location',
                      () {},
                    ),

                    //  Future Scop
                    // _buildSettingTile(
                    //   context,
                    //   Icons.shopping_cart,
                    //   'My Cart',
                    //   'Go to Cart',
                    //   () {
                    //     // Navigate to cart screen
                    //   },
                    //),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: Text(
                    'Logout',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingTile(BuildContext context, IconData icon, String title,
      String actionText, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        leading: Icon(icon, color: Colors.brown),
        title: Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          actionText,
          style: GoogleFonts.lato(
            fontSize: 14,
            color: Colors.brown,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit_outlined, color: Colors.brown),
          onPressed: onTap,
        ),
      ),
    );
  }
}
