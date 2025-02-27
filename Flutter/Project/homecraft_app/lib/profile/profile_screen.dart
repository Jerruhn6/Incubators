import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homecraft_app/Shipping/payment_screen.dart';
import 'package:homecraft_app/profile/AccountScreen.dart';
import 'package:homecraft_app/profile/SettingsScreen.dart';
import 'package:homecraft_app/profile/export_data_screen.dart';
import 'package:homecraft_app/screens/welcome_screen.dart';

PaymentScreen? objP;


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String profileName = '';
  String profileEmail = '';
  String profilePhone = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        profileName = user.displayName ?? 'User Name';
        profileEmail = user.email ?? 'user@example.com';
        profilePhone = user.phoneNumber ?? 'Not Provided';
      });
    }
  }

  // String profileName = 'Vishnu P V';
  // String profileEmail = 'vishnu@example.com';
  // String profilePhone = '123-456-7890';

  void updateProfileInfo(String newName, String newEmail, String newPhone) {
    setState(() {
      profileName = newName;
      profileEmail = newEmail;
      profilePhone = newPhone;
    });
  }

  void _logout() {
    // Perform logout actions here
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ), (route) {
                return false;
              }); // Close the dialog
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out successfully')),
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    const Stack(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.amber,
                          child: CircleAvatar(
                            radius: 42,
                            backgroundColor: const Color(0xFFFFE082),
                            child:  Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(profileName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(profileEmail,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey)),
                    Text(profilePhone,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ProfileListTile(
                      icon: Icons.account_box,
                      title: 'Account',
                      color: Colors.black,
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountScreen(
                              currentName: profileName,
                              currentEmail: profileEmail,
                              currentPhone: profilePhone,
                            ),
                          ),
                        );
                        if (result != null) {
                          updateProfileInfo(
                              result['name'], result['email'], result['phone']);
                        }
                      },
                    ),
                    Divider(color: Colors.grey[300]), // Divider between tiles
                    ProfileListTile(
                      icon: Icons.history_outlined,
                      title: 'Order History',
                      color: Colors.black,
                      onTap: () {
                        Navigator.of(context).push(
                         
                          MaterialPageRoute(
                              builder: (context) => OrderHistoryScreen()),//changed
                        );
                      },
                    ),
                    Divider(color: Colors.grey[300]),
                    ProfileListTile(
                      icon: Icons.settings,
                      title: 'Settings',
                      color: Colors.black,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()),
                        );
                      },
                    ),
                    Divider(color: Colors.grey[300]),
                    ProfileListTile(
                      icon: Icons.logout,
                      title: 'Logout',
                      color: Colors.red,
                      onTap: _logout, // Call the logout function
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color color;

  const ProfileListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        child: Icon(icon, color: color),
      ),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
