// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:starbucks_in/register.dart';

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
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
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
//                   () async {
//                     final updatedLocation = await Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => EditLocationPage(initialLocation: userLocation),
//                       ),
//                     );
//                     if (updatedLocation != null) {
//                       setState(() {
//                         userLocation = updatedLocation;
//                       });
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 // Logout Button
//                 TextButton.icon(
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const RegisterPage(),
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

// class EditLocationPage extends StatefulWidget {
//   final String initialLocation;

//   const EditLocationPage({Key? key, required this.initialLocation}) : super(key: key);

//   @override
//   State<EditLocationPage> createState() => _EditLocationPageState();
// }

// class _EditLocationPageState extends State<EditLocationPage> {
//   late GoogleMapController mapController;
//   LatLng _currentPosition = const LatLng(48.9226, 24.7097); // Default coordinates

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Edit Location',
//           style: GoogleFonts.lato(
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.brown[600],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GoogleMap(
//               onMapCreated: _onMapCreated,
//               initialCameraPosition: CameraPosition(
//                 target: _currentPosition,
//                 zoom: 12.0,
//               ),
//               markers: {
//                 Marker(
//                   markerId: const MarkerId('currentLocation'),
//                   position: _currentPosition,
//                   draggable: true,
//                   onDragEnd: (newPosition) {
//                     setState(() {
//                       _currentPosition = newPosition;
//                     });
//                   },
//                 ),
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context, '${_currentPosition.latitude}, ${_currentPosition.longitude}');
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.brown[500],
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               child: const Text('Save Location'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }








import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/register.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // State variables for user data
  String userName = 'Ashish';
  String userPhone = '+919325822114';
  String userLocation = 'Ukraine, Ivano-Frankivsk, Kon...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.lato(
            fontSize: 22,
            fontWeight: FontWeight.bold,
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
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJQQb_a7dNJkCek_QcPIPlI3ZjqbdRLRAz-Q&s',
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
                const SizedBox(height: 20),
                // Logout Button
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
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
        title: Text(
          'Edit Profile',
          style: GoogleFonts.lato(
            fontSize: 22,
            fontWeight: FontWeight.bold,
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
                child: const Text('Save Changes'),
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


