import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppsBlockedScreen extends StatefulWidget {
  const AppsBlockedScreen({super.key});

  @override
  State<AppsBlockedScreen> createState() => _AppsBlockedScreenState();
}

class _AppsBlockedScreenState extends State<AppsBlockedScreen> {
  bool isAppsTab = true;
  
  // Dummy data
  final List<Map<String, dynamic>> appsList = [
    {'name': 'WhatsApp', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/512px-WhatsApp.svg.png', 'blocked': false},
    {'name': 'Chrome', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Google_Chrome_icon_%28February_2022%29.svg/512px-Google_Chrome_icon_%28February_2022%29.svg.png', 'blocked': false},
    {'name': 'Opal', 'icon': '', 'blocked': false, 'isOpal': true},
    {'name': 'TikTok', 'icon': 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a9/TikTok_logo.svg/1024px-TikTok_logo.svg.png', 'blocked': false},
    {'name': 'SaveVideo', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Download_Icon.png/512px-Download_Icon.png', 'blocked': false},
    {'name': 'Phone', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Font_Awesome_5_solid_phone-alt.svg/512px-Font_Awesome_5_solid_phone-alt.svg.png', 'blocked': false},
    {'name': 'Photos', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Google_Photos_icon_%282020%29.svg/512px-Google_Photos_icon_%282020%29.svg.png', 'blocked': false},
    {'name': 'Maps', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Google_Maps_icon_%282020%29.svg/512px-Google_Maps_icon_%282020%29.svg.png', 'blocked': false},
    {'name': 'JazzCash', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/JazzCash_logo.png/512px-JazzCash_logo.png', 'blocked': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Header
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  child: Text(
                    'Apps Blocked',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 48), // Balance for centering
              ],
            ),
            const SizedBox(height: 24),
            
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
                        'Apps 0',
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
                        'Websites 0',
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
                      decoration: BoxDecoration(
                        color: app['isOpal'] == true ? Colors.black : Colors.white,
                        shape: BoxShape.circle,
                        border: app['isOpal'] == true ? Border.all(color: Colors.white, width: 3) : null,
                      ),
                      child: app['isOpal'] == true
                          ? null
                          : ClipOval(
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
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey[900]!)),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E1E1E), // Dark button
                    foregroundColor: Colors.grey[400],
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
