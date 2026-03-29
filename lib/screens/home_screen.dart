import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'timer_screen.dart';
import 'stats_screen.dart';
import 'block_config_screen.dart';
import 'time_limit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _hasShownDialog = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasShownDialog) {
        _showNotificationDialog();
        _hasShownDialog = true;
      }
    });
  }

  void _showNotificationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Why not block notifications\nas well?',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Distracting Apps also send distracting\nnotifications',
                  style: GoogleFonts.inter(
                    color: Colors.grey[300],
                    fontSize: 14,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                    child: Text('Let\'s do this', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Maybe Later', style: GoogleFonts.inter(color: Colors.grey[400])),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBlockTypeSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              Text('Select your block type', style: GoogleFonts.inter(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              _buildSheetOption(Icons.schedule, 'Block Now', 'Start a 30min focus timer', () {
                Navigator.pop(context); // Close sheet
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BlockConfigScreen(isInitialSchedule: false)));
              }),
              const SizedBox(height: 12),
              _buildSheetOption(Icons.calendar_month, 'Create Schedule', 'e.g. Work Hours from 9am to 5pm', () {
                Navigator.pop(context); // Close sheet
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BlockConfigScreen(isInitialSchedule: true)));
              }),
              const SizedBox(height: 12),
              _buildSheetOption(Icons.hourglass_bottom, 'Set Time Limit', 'e.g. 30min per day', () {
                Navigator.pop(context); // Close sheet
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TimeLimitScreen()));
              }),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSheetOption(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                Text(subtitle, style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            _buildHomeContent(),
            const TimerScreen(),
            const StatsScreen(),
          ],
        ),
      ),
      floatingActionButton: _selectedIndex == 0 ? Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFA5FFEA), Color(0xFF6EDFFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6EDFFF).withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: FloatingActionButton.extended(
            onPressed: _showBlockTypeSheet,
            backgroundColor: Colors.transparent,
            elevation: 0,
            icon: const Icon(Icons.add, color: Colors.black),
            label: Text(
              'New Block',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[600],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.blur_circular), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.timer_outlined), label: 'Timer'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return Stack(
      children: [
        SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100), // Space for FAB and Nav
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App Bar / Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 2),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text('pal', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey[800]!),
                          ),
                          child: const Icon(Icons.person_outline, color: Colors.grey, size: 20),
                        ),
                      ],
                    ),
                  ),

                  // Streak Section
                  const SizedBox(height: 32),
                  Center(
                    child: Column(
                      children: [
                        Flexible(
                          flex: 0,
                          child: ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [Colors.white, Colors.grey],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds),
                            child: Text(
                              '0',
                              style: GoogleFonts.inter(
                                fontSize: 80,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                height: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'DAY STREAK',
                          style: GoogleFonts.oswald(
                            color: const Color(0xFFFFCC00), // Gold yellow
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Stats Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey[900]!),
                          bottom: BorderSide(color: Colors.grey[900]!),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatColumn('FOCUS SCORE', '83%'),
                          _buildStatColumn('SCREEN TIME', '2h 55m'),
                          Column(
                            children: [
                              Text('CULPRITS', style: GoogleFonts.inter(color: Colors.grey[500], fontSize: 10, letterSpacing: 1.0)),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  _buildCulpritIcon(Icons.message, Colors.green),
                                  const SizedBox(width: -8),
                                  _buildCulpritIcon(Icons.public, Colors.orange),
                                  const SizedBox(width: -8),
                                  _buildCulpritIcon(Icons.music_note, Colors.black, border: Colors.white),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Upcoming Section
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text('Upcoming', style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: _buildUpcomingCard('Work Hours', 'Weekdays\n8:00 AM - 5:00 PM', 'Starting in 9h •', '💻'),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: _buildUpcomingCard('Weekend Zen', 'Weekends\n9:00 AM - 11:00 AM', 'Starting Saturday •', '🧘‍♀️'),
                  ),

                  // More Ideas Section
                  const SizedBox(height: 48),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text('More Ideas:', style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 16),
                  _buildIdeaCard('Morning', 'Every day, 6:00 AM - 9:00 AM', '☀️'),
                  _buildIdeaCard('Deep Work Hour', 'Every day, 2:00 PM - 3:00 PM', '🕯️'),
                  _buildIdeaCard('Wind Down', 'Weekdays, 5:00 PM - 6:00 PM', '🛋️'),
                  _buildIdeaCard('Good Sleep, Good Life', 'Every day, 10:30 PM - 6:30 AM', '🛌'),
                  _buildIdeaCard('Dinner With Family', 'Sunday - Sunday, 6:00 PM - 7:00 PM', '🍽️'),
                  _buildIdeaCard('Digital Sabbath', 'Sunday - Sunday, 6:00 AM - 6:00 PM', '🧘'),
                  _buildIdeaCard('Deep Efficient Morning', 'Weekdays, 6:30 AM - 9:00 AM', '🌅'),
                  _buildIdeaCard('Gym Time', 'Monday, Wednesday, Friday, 4:00 PM - 5:30 PM', '🏋️'),
                  _buildIdeaCard('4 Hour Limit', 'Every day, 4h/day', '⏳'),
                  _buildIdeaCard('Weekend Limit', 'Weekends, 1h/day', '⌛'),
                  
                ],
              ),
            ),
          ],
        );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(label, style: GoogleFonts.inter(color: Colors.grey[500], fontSize: 10, letterSpacing: 1.0)),
        const SizedBox(height: 8),
        Text(value, style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildCulpritIcon(IconData icon, Color bg, {Color? border}) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: border != null ? Border.all(color: border, width: 1.5) : null,
      ),
      child: Center(
        child: Icon(icon, color: Colors.white, size: 12),
      ),
    );
  }

  Widget _buildUpcomingCard(String title, String subtitle, String status, String emoji) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Dark gray card background
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(subtitle, style: GoogleFonts.inter(color: Colors.grey[500], fontSize: 14)),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.schedule, color: Colors.grey[400], size: 14),
                      const SizedBox(width: 4),
                      Text(status, style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildIdeaCard(String title, String subtitle, String emoji) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[800]!),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                  Text(subtitle, style: GoogleFonts.inter(color: Colors.grey[500], fontSize: 12)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '+ Add',
                style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
