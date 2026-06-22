import 'package:flutter/material.dart';
import 'upload_song_page.dart';

class ArtistDashboard extends StatefulWidget {
  const ArtistDashboard({super.key});

  @override
  State<ArtistDashboard> createState() => _ArtistDashboardState();
}

class _ArtistDashboardState extends State<ArtistDashboard> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    DashboardHomePage(),
    UploadSongPage(),
    MySongsPage(),
    EarningsPage(),
    ProfilePage(),
    StatisticsPage(),
  ];

  final List<String> titles = const [
    'Home',
    'Upload Song',
    'My Songs',
    'Earnings',
    'Profile',
    'Statistics',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      appBar: AppBar(
        backgroundColor: const Color(0xFF050505),
        elevation: 0,
        title: Text(
          titles[currentIndex],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex > 4 ? 0 : currentIndex,
        backgroundColor: const Color(0xFF0B0B0B),
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud_upload), label: 'Upload'),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Songs'),
          BottomNavigationBarItem(icon: Icon(Icons.payments), label: 'Earnings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        onPressed: () {
          setState(() {
            currentIndex = 5;
          });
        },
        icon: const Icon(Icons.bar_chart),
        label: const Text('Stats'),
      ),
    );
  }
}

class DashboardHomePage extends StatelessWidget {
  const DashboardHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome Artist 👋',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Manage your music, fans, earnings and growth.',
            style: TextStyle(color: Colors.white60),
          ),
          const SizedBox(height: 24),

          Row(
            children: const [
              Expanded(
                child: StatCard(
                  title: 'Songs',
                  value: '12',
                  icon: Icons.music_note,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  title: 'Streams',
                  value: '24.5K',
                  icon: Icons.headphones,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: const [
              Expanded(
                child: StatCard(
                  title: 'Earnings',
                  value: 'TZS 85K',
                  icon: Icons.payments,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  title: 'Fans',
                  value: '1.2K',
                  icon: Icons.people,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          const BoostSongCard(),

          const SizedBox(height: 28),

          const Text(
            'Recent Activity',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 14),

          const ActivityTile(
            icon: Icons.cloud_upload,
            title: 'New song uploaded',
            subtitle: 'Your latest song is now live.',
          ),
          const ActivityTile(
            icon: Icons.trending_up,
            title: 'Streams increased',
            subtitle: 'Your music gained more listeners today.',
          ),
          const ActivityTile(
            icon: Icons.payments,
            title: 'New earning update',
            subtitle: 'Your monthly earnings are growing.',
          ),
        ],
      ),
    );
  }
}

class BoostSongCard extends StatelessWidget {
  const BoostSongCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFA726),
            Color(0xFFFF7043),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.25),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.rocket_launch,
            color: Colors.white,
            size: 42,
          ),
          const SizedBox(height: 12),
          const Text(
            'Boost Your Song',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Promote your song to reach more fans, streams and visibility across Tunely Africa.',
            style: TextStyle(
              color: Colors.white,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _boostMiniCard('Bronze', 'TZS 2K'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _boostMiniCard('Silver', 'TZS 5K'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _boostMiniCard('Gold', 'TZS 10K'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Boost feature coming soon'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              icon: const Icon(Icons.flash_on),
              label: const Text(
                'BOOST NOW',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _boostMiniCard(String title, String price) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.22),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white30),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class MySongsPage extends StatelessWidget {
  const MySongsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final songs = [
      'African Love',
      'Dar City Vibes',
      'Mama Africa',
      'Night Melody',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(18),
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF101010),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.white12),
          ),
          child: Row(
            children: [
              Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.music_note, color: Colors.black),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songs[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Kemal Artist • Bongo Flava',
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit, color: Colors.greenAccent),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete, color: Colors.redAccent),
              ),
            ],
          ),
        );
      },
    );
  }
}

class EarningsPage extends StatelessWidget {
  const EarningsPage({super.key});

  void _showWithdrawSheet(BuildContext context) {
    final amountController = TextEditingController();
    final phoneController = TextEditingController();

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF101010),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 18,
            right: 18,
            top: 22,
            bottom: MediaQuery.of(context).viewInsets.bottom + 22,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Withdraw Earnings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18),
              _withdrawInput(
                controller: amountController,
                label: 'Amount',
                icon: Icons.payments,
              ),
              const SizedBox(height: 14),
              _withdrawInput(
                controller: phoneController,
                label: 'Mobile Money Number',
                icon: Icons.phone_android,
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Withdrawal request submitted'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  icon: const Icon(Icons.send),
                  label: const Text(
                    'SUBMIT REQUEST',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget _withdrawInput({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: label == 'Amount' ? TextInputType.number : TextInputType.phone,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF050505),
        prefixIcon: Icon(icon, color: Colors.greenAccent),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.greenAccent),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          const BigInfoCard(
            title: 'Available Balance',
            value: 'TZS 73,000',
            icon: Icons.account_balance_wallet,
          ),
          const SizedBox(height: 16),
          const BigInfoCard(
            title: 'This Month',
            value: 'TZS 23,500',
            icon: Icons.calendar_month,
          ),
          const SizedBox(height: 16),
          const BigInfoCard(
            title: 'Pending Payment',
            value: 'TZS 12,000',
            icon: Icons.timer,
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton.icon(
              onPressed: () => _showWithdrawSheet(context),
              icon: const Icon(Icons.account_balance),
              label: const Text(
                'WITHDRAW EARNINGS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Withdrawal History',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 14),
          const ActivityTile(
            icon: Icons.check_circle,
            title: 'TZS 20,000 Paid',
            subtitle: 'Sent to mobile money • Completed',
          ),
          const ActivityTile(
            icon: Icons.timer,
            title: 'TZS 12,000 Pending',
            subtitle: 'Your request is being reviewed',
          ),
        ],
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: const [
          BigInfoCard(
            title: 'Total Earnings',
            value: 'TZS 85,000',
            icon: Icons.account_balance_wallet,
          ),
          SizedBox(height: 16),
          BigInfoCard(
            title: 'This Month',
            value: 'TZS 23,500',
            icon: Icons.calendar_month,
          ),
          SizedBox(height: 16),
          BigInfoCard(
            title: 'Pending Payment',
            value: 'TZS 12,000',
            icon: Icons.timer,
          ),
        ],
      ),
    );
  }


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.greenAccent,
            child: Icon(Icons.person, size: 60, color: Colors.black),
          ),
          const SizedBox(height: 16),
          const Text(
            'Kemal Artist',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Bongo Flava • Tanzania',
            style: TextStyle(color: Colors.white54),
          ),
          const SizedBox(height: 28),
          _profileTile(Icons.email, 'Email', 'artist@tunelyafrica.com'),
          _profileTile(Icons.phone, 'Phone', '+255 XXX XXX XXX'),
          _profileTile(Icons.location_on, 'Country', 'Tanzania'),
        ],
      ),
    );
  }

  static Widget _profileTile(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF101010),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.greenAccent),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white54),
            ),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: const [
          BigInfoCard(
            title: 'Total Streams',
            value: '24,500',
            icon: Icons.play_circle,
          ),
          SizedBox(height: 16),
          BigInfoCard(
            title: 'Total Fans',
            value: '1,250',
            icon: Icons.people,
          ),
          SizedBox(height: 16),
          BigInfoCard(
            title: 'Top Song',
            value: 'African Love',
            icon: Icons.star,
          ),
          SizedBox(height: 16),
          BigInfoCard(
            title: 'Boost Views',
            value: '12,500',
            icon: Icons.rocket_launch,
          ),
          SizedBox(height: 16),
          BigInfoCard(
            title: 'Growth Rate',
            value: '+18%',
            icon: Icons.trending_up,
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF101010),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.greenAccent),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }
}

class ActivityTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ActivityTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF101010),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.greenAccent),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class BigInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const BigInfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF101010),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.greenAccent, size: 34),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white54),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}