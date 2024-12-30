import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/ADMIN_SIDE/inventoryScreen.dart';
import 'package:starbucks_in/ADMIN_SIDE/manageOrder.dart';
import 'package:starbucks_in/ADMIN_SIDE/shopDetail.dart';
import 'package:starbucks_in/profileScreen.dart';
import 'package:starbucks_in/signin_screen.dart';
import 'package:starbucks_in/welcome_screen.dart';

class AdminScreen extends StatefulWidget {
  String userName;
  String mNo;
  AdminScreen({super.key,required this.mNo,required this.userName});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
    File? _profileImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const ProfileScreen();
            }));
          },
          child: Padding(
            padding:EdgeInsets.all(8.0),
            child:  CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : const NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJQQb_a7dNJkCek_QcPIPlI3ZjqbdRLRAz-Q&s',
                          ) as ImageProvider
                              ),
                            ),
          ),
        ),
        title: Text(
          'Admin Panel',
          style: GoogleFonts.lato(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown[600],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: constraints.maxWidth > 600
                  ? _buildWideScreenUI()
                  : _buildMobileUI(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMobileUI() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSectionHeader('Shop Overview'),
          _buildSettingTile(
            Icons.storefront,
            'Manage Shop Details',
            () => _navigateToShopDetails(),
          ),
          _buildSettingTile(
            Icons.inventory,
            'Manage Inventory',
            () => _navigateToInventory(),
          ),
          _buildSettingTile(
            Icons.receipt_long,
            'View Orders',
            () => _navigateToOrders(),
          ),
          const SizedBox(height: 20),
          _logoutButton(),
        ],
      ),
    );
  }

  Widget _buildWideScreenUI() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              _buildSectionHeader('Shop Overview'),
              _buildSettingTile(
                Icons.storefront,
                'Manage Shop Details',
                () => _navigateToShopDetails(),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            children: [
              _buildSettingTile(
                Icons.inventory,
                'Manage Inventory',
                () => _navigateToInventory(),
              ),
              _buildSettingTile(
                Icons.receipt_long,
                'View Orders',
                () => _navigateToOrders(),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            children: [
              _logoutButton(),
            ],
          ),
        ),
      ],
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

  Widget _buildSettingTile(IconData icon, String title, VoidCallback onTap) {
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
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 20,
          color: Colors.brown[600],
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _logoutButton() {
    return TextButton.icon(
      onPressed: () {
        // Implement logout functionality
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const WelcomeScreen(),),
        (route){
          return false;
        }
        
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
    );
  }

  void _navigateToShopDetails() {
    // Navigate to Shop Details Screen
     Navigator.push(context, MaterialPageRoute(builder: (context) => ShopDetailsPage()));
  }

  void _navigateToInventory() {
    // Navigate to Inventory Management Screen
     Navigator.push(context, MaterialPageRoute(builder: (context) =>  InventoryScreen()));
  }

  void _navigateToOrders() {
    // Navigate to Orders Management Screen
     Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersPage()));
  }
}
