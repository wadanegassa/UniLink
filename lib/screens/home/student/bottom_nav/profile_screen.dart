import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // User info
  String userName = 'Wada Negassa';
  String userEmail = 'wada@haramaya.edu';
  String userCampus = 'Haramaya University';
  File? profileImage;

  final ImagePicker _picker = ImagePicker();

  // Pick new profile image
  Future<void> pickProfileImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBBF24),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left_2, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ===== Profile Avatar with gradient ring =====
            GestureDetector(
              onTap: pickProfileImage,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFFFBBF24), Color(0xFFFFE082)],
                  ),
                ),
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.black12,
                  backgroundImage:
                      profileImage != null ? FileImage(profileImage!) : null,
                  child: profileImage == null
                      ? const Icon(Iconsax.user,
                          size: 50, color: Colors.black38)
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ===== User Info Card =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(userName,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(userEmail,
                      style: const TextStyle(color: Colors.black54)),
                  const SizedBox(height: 4),
                  Text(userCampus,
                      style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // ===== Unique Edit Profile Button =====
            ElevatedButton.icon(
              onPressed: () async {
                final updated = await Navigator.push<Map<String, String>>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(
                      currentName: userName,
                      currentEmail: userEmail,
                      currentCampus: userCampus,
                    ),
                  ),
                );

                if (updated != null) {
                  setState(() {
                    userName = updated['name']!;
                    userEmail = updated['email']!;
                    userCampus = updated['campus']!;
                  });
                }
              },
              icon: const Icon(Iconsax.edit_2, color: Colors.white),
              label: const Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFBBA00),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 6,
                shadowColor: Colors.black45,
              ),
            ),
            const SizedBox(height: 15),

            // ===== Logout Button =====
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close dialog
                          Navigator.pop(context); // Navigate back to login
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Iconsax.logout, color: Colors.white),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= Edit Profile =================
class EditProfile extends StatefulWidget {
  final String currentName;
  final String currentEmail;
  final String currentCampus;

  const EditProfile({
    super.key,
    required this.currentName,
    required this.currentEmail,
    required this.currentCampus,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController campusController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.currentName);
    emailController = TextEditingController(text: widget.currentEmail);
    campusController = TextEditingController(text: widget.currentCampus);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    campusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBBA00),
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: campusController,
              decoration: InputDecoration(
                labelText: 'Campus',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'name': nameController.text,
                  'email': emailController.text,
                  'campus': campusController.text,
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFBBA00),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
