
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:starbucks_in/register.dart';
// import 'package:starbucks_in/signup_screen.dart';
// import 'package:starbucks_in/welcome_screen.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   // State variables for user data
//   String userName = 'Ashish';
//   String userPhone = '+919325822114';
//   String userLocation = 'Ukraine, Ivano-Frankivsk, Kon...';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Profile',
//           style: GoogleFonts.lato(
//             fontSize: 26,
//             fontWeight: FontWeight.w800,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.brown[600],
//         elevation: 5,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 // Profile Picture
//                 const CircleAvatar(
//                   radius: 70,
//                   backgroundImage: NetworkImage(
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJQQb_a7dNJkCek_QcPIPlI3ZjqbdRLRAz-Q&s',
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 // User Name
//                 Text(
//                   userName,
//                   style: GoogleFonts.lato(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.brown[800],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton.icon(
//                   onPressed: () async {
//                     final updatedData = await Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => EditProfilePage(
//                           name: userName,
//                           phone: userPhone,
//                           location: userLocation,
//                         ),
//                       ),
//                     );
//                     if (updatedData != null) {
//                       setState(() {
//                         userName = updatedData['name'];
//                         userPhone = updatedData['phone'];
//                         userLocation = updatedData['location'];
//                       });
//                     }
//                   },
//                   icon: const Icon(Icons.edit_outlined),
//                   label: const Text('Edit Profile'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.brown[500],
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 // Settings Section
//                 _buildSectionHeader('Account Settings'),
//                 _buildSettingTile(
//                   context,
//                   Icons.phone_outlined,
//                   userPhone,
//                   'Edit Phone Number',
//                   () {},
//                 ),
//                 _buildSettingTile(
//                   context,
//                   Icons.location_on,
//                   userLocation,
//                   'Edit Location',
//                   () {},
//                 ),
//                 const SizedBox(height: 20),
//                 // Logout Button
//                 TextButton.icon(
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const WelcomeScreen(),
//                       ),
//                     );
//                   },
//                   icon: const Icon(Icons.logout, color: Colors.red),
//                   label: Text(
//                     'Logout',
//                     style: GoogleFonts.lato(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionHeader(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Text(
//           title,
//           style: GoogleFonts.lato(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.brown[700],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSettingTile(BuildContext context, IconData icon, String title,
//       String actionText, VoidCallback onTap) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: ListTile(
//         contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         leading: Icon(icon, color: Colors.brown[600]),
//         title: Text(
//           title,
//           style: GoogleFonts.lato(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ),
//         ),
//         subtitle: Text(
//           actionText,
//           style: GoogleFonts.lato(
//             fontSize: 14,
//             color: Colors.brown[500],
//           ),
//         ),
//         trailing: IconButton(
//           icon: const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.brown),
//           onPressed: onTap,
//         ),
//       ),
//     );
//   }
// }

// class EditProfilePage extends StatefulWidget {
//   final String name;
//   final String phone;
//   final String location;

//   const EditProfilePage({
//     Key? key,
//     required this.name,
//     required this.phone,
//     required this.location,
//   }) : super(key: key);

//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   final _formKey = GlobalKey<FormState>();
//   late String _name;
//   late String _phone;
//   late String _location;

//   @override
//   void initState() {
//     super.initState();
//     _name = widget.name;
//     _phone = widget.phone;
//     _location = widget.location;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Edit Profile',
//           style: GoogleFonts.lato(
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.brown[600],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 initialValue: _name,
//                 decoration: const InputDecoration(labelText: 'Name'),
//                 validator: (value) =>
//                     value!.isEmpty ? 'Name cannot be empty' : null,
//                 onSaved: (value) => _name = value!,
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 initialValue: _phone,
//                 decoration: const InputDecoration(labelText: 'Phone Number'),
//                 keyboardType: TextInputType.phone,
//                 validator: (value) =>
//                     value!.isEmpty ? 'Phone number cannot be empty' : null,
//                 onSaved: (value) => _phone = value!,
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 initialValue: _location,
//                 decoration: const InputDecoration(labelText: 'Location'),
//                 validator: (value) =>
//                     value!.isEmpty ? 'Location cannot be empty' : null,
//                 onSaved: (value) => _location = value!,
//               ),
//               const SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: _saveProfile,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.brown[500],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 child: const Text('Save Changes'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _saveProfile() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       Navigator.pop(context, {
//         'name': _name,
//         'phone': _phone,
//         'location': _location,
//       });
//     }
//   }
// }


/////////////////////////////////////////////////////////////////////////////////////
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:starbucks_in/ordersHistoryScreen.dart';

import 'package:starbucks_in/welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // State variables for user data
  String userName = 'Ashish Sonkamble';
  String ordersHistoryTitle = 'Orders History';
  String userPhone = '+919325822114';
  String userLocation = 'Ukraine, Ivano-Frankivsk, Kon...';
  File? _profileImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.lato(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown[600],
        elevation: 5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Profile Picture
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : const NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJQQb_a7dNJkCek_QcPIPlI3ZjqbdRLRAz-Q&s',
                          ) as ImageProvider,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.brown[600],
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // User Name
                Text(
                  userName,
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () async {
                    final updatedData = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(
                          name: userName,
                          phone: userPhone,
                          location: userLocation,
                        ),
                      ),
                    );
                    if (updatedData != null) {
                      setState(() {
                        userName = updatedData['name'];
                        userPhone = updatedData['phone'];
                        userLocation = updatedData['location'];
                      });
                    }
                  },
                  icon: const Icon(Icons.edit_outlined),
                  label: const Text('Edit Profile'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[500],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Settings Section
                _buildSectionHeader('Account Settings'),
                _buildSettingTile(
                  context,
                  Icons.phone_outlined,
                  userPhone,
                  'Edit Phone Number',
                  () {},
                ),
                _buildSettingTile(
                  context,
                  Icons.location_on,
                    userLocation,
                  'Edit Location',
                  () {},
                ),
                _buildSettingTile(
                  context,
                  Icons.history,
                'Orders History',
                  'Orders History',
                  () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return OrderHistoryPage();
                    }));
                    setState(() {
                      
                    });
                  },
                ),
                const SizedBox(height: 20),

                // Logout Button
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.brown[700],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingTile(BuildContext context, IconData icon, String title,
      String actionText, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Icon(icon, color: Colors.brown[600]),
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
            color: Colors.brown[500],
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.brown),
          onPressed: onTap,
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final String name;
  final String phone;
  final String location;

  const EditProfilePage({
    Key? key,
    required this.name,
    required this.phone,
    required this.location,
  }) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _phone;
  late String _location;

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _phone = widget.phone;
    _location = widget.location;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined,size: 25,
          color: Colors.white,),
          
        ),
        title: Text(
          'Edit Profile',
          style: GoogleFonts.lato(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Name cannot be empty' : null,
                onSaved: (value) => _name = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _phone,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? 'Phone number cannot be empty' : null,
                onSaved: (value) => _phone = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _location,
                decoration: const InputDecoration(labelText: 'Location'),
                validator: (value) =>
                    value!.isEmpty ? 'Location cannot be empty' : null,
                onSaved: (value) => _location = value!,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[500],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Save Changes',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(context, {
        'name': _name,
        'phone': _phone,
        'location': _location,
      });
    }
  }
}
