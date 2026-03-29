import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fist_bump_screen.dart';

class AppsToBlockScreen extends StatefulWidget {
  const AppsToBlockScreen({super.key});

  @override
  State<AppsToBlockScreen> createState() => _AppsToBlockScreenState();
}

class _AppsToBlockScreenState extends State<AppsToBlockScreen> {
  bool isAppsTab = true;
  
  // Dummy data
  final List<Map<String, dynamic>> appsList = [
    {'name': 'TikTok', 'icon': 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a9/TikTok_logo.svg/1024px-TikTok_logo.svg.png', 'blocked': true},
    {'name': 'Facebook', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/512px-2021_Facebook_icon.svg.png', 'blocked': true},
    {'name': 'YouTube', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/512px-YouTube_full-color_icon_%282017%29.svg.png', 'blocked': true},
    {'name': 'Snapchat', 'icon': 'https://upload.wikimedia.org/wikipedia/en/thumb/c/c4/Snapchat_logo.svg/512px-Snapchat_logo.svg.png', 'blocked': true},
    {'name': 'Instagram', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/132px-Instagram_logo_2016.svg.png', 'blocked': true},
    {'name': 'WhatsApp', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/512px-WhatsApp.svg.png', 'blocked': false},
    {'name': 'Chrome', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Google_Chrome_icon_%28February_2022%29.svg/512px-Google_Chrome_icon_%28February_2022%29.svg.png', 'blocked': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text(
              'Social Apps will be\nBlocked by Default',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Don\'t worry, you can change this later',
              style: GoogleFonts.inter(
                color: Colors.grey[400],
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            
            // Segment Control
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => isAppsTab = true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: isAppsTab ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                        border: isAppsTab ? null : Border.all(color: Colors.grey[800]!),
                      ),
                      child: Text(
                        'Apps 5',
                        style: GoogleFonts.inter(
                          color: isAppsTab ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => setState(() => isAppsTab = false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: !isAppsTab ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                        border: !isAppsTab ? null : Border.all(color: Colors.grey[800]!),
                      ),
                      child: Text(
                        'Websites 7',
                        style: GoogleFonts.inter(
                          color: !isAppsTab ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.grey[400]),
                    hintText: 'Search apps',
                    hintStyle: GoogleFonts.inter(color: Colors.grey[400]),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                itemCount: appsList.length,
                separatorBuilder: (context, index) => Divider(color: Colors.grey[900], height: 1),
                itemBuilder: (context, index) {
                  final app = appsList[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.network(
                          app['icon'],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.app_shortcut, color: Colors.black, size: 20),
                        ),
                      ),
                    ),
                    title: Text(
                      app['name'],
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.grey[600],
                      ),
                      child: Checkbox(
                        value: app['blocked'],
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onChanged: (bool? value) {
                          setState(() {
                            app['blocked'] = value ?? false;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // Confirm Button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FistBumpScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
