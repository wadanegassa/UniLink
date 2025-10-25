import 'package:campus_connect/widgets/lost_found_item.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LostFoundScreen extends StatefulWidget {
  const LostFoundScreen({super.key});

  @override
  State<LostFoundScreen> createState() => _LostFoundScreenState();
}

class _LostFoundScreenState extends State<LostFoundScreen> {
  String selectedFilter = 'All';
  String searchQuery = '';

  // ===== Sample posts =====
  final List<Map<String, String>> _items = [
    {
      'title': 'Lost Keys',
      'description':
          'I lost my car keys near the library. Please contact me if found.',
      'location': 'Main Library',
      'date': '24 Oct 2025',
      'imageUrl': 'assets/images/flutter_lecture.jpg',
      'status': 'Lost',
      'phone': '+251911234567',
    },
    {
      'title': 'Found Backpack',
      'description':
          'Found a blue backpack near the cafeteria. Asking for the owner to claim it.',
      'location': 'Cafeteria',
      'date': '23 Oct 2025',
      'imageUrl': 'assets/images/cleaning.jpg',
      'status': 'Found',
      'phone': '+251912345678',
    },
    {
      'title': 'Lost Notebook',
      'description': 'Lost my math notebook. Last seen in lecture hall A.',
      'location': 'Lecture Hall A',
      'date': '22 Oct 2025',
      'imageUrl': 'assets/images/library.jpg',
      'status': 'Lost',
      'phone': '+251913456789',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredItems = _items.where((item) {
      final matchesFilter =
          selectedFilter == 'All' || item['status'] == selectedFilter;
      final matchesSearch = searchQuery.isEmpty ||
          item['title']!.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB),
      body: SafeArea(
        child: Column(
          children: [
            // ===== Header with search =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFBBF24), Color(0xFFFFE082)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== Header row =====
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Lost & Found',
                        style: TextStyle(
                          fontFamily: 'PirataOne',
                          fontSize: 26,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // ===== Search bar =====
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (val) => setState(() => searchQuery = val),
                      decoration: const InputDecoration(
                        hintText: 'Search items...',
                        prefixIcon: Icon(Iconsax.search_normal),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // ===== Filter buttons =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _filterButton('All'),
                  const SizedBox(width: 10),
                  _filterButton('Lost'),
                  const SizedBox(width: 10),
                  _filterButton('Found'),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // ===== Report Lost & Found buttons =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/report_lost'),
                      icon: const Icon(Iconsax.add, color: Colors.white),
                      label: const Text('Report Lost',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/report_found'),
                      icon: const Icon(Iconsax.add, color: Colors.white),
                      label: const Text('Report Found',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // ===== Posts feed =====
            Expanded(
              child: filteredItems.isEmpty
                  ? const Center(child: Text('No items reported yet.'))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        return LostFoundItemCard(
                          title: item['title']!,
                          desc: item['description']!,
                          location: item['location']!,
                          date: item['date']!,
                          imageUrl: item['imageUrl']!,
                          status: item['status']!,
                          phone: item['phone']!,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterButton(String label) {
    final isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () => setState(() => selectedFilter = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFBBF24) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.black : Colors.black54,
          ),
        ),
      ),
    );
  }
}
