import 'package:flutter/material.dart';

class ArtistDashboard extends StatefulWidget {
  const ArtistDashboard({super.key});

  @override
  State<ArtistDashboard> createState() => _ArtistDashboardState();
}

class _ArtistDashboardState extends State<ArtistDashboard> {
  int selectedIndex = 0;

  final List<String> menuTitles = [
    "Dashboard",
    "Upload Music",
    "My Songs",
    "Analytics",
    "Earnings",
    "Promotions",
    "Notifications",
    "Profile",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuTitles[selectedIndex]),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green.shade700,
              ),
              accountName: const Text("Kemal Artist"),
              accountEmail: const Text("artist@tunelyafrica.com"),
              currentAccountPicture: const CircleAvatar(
                child: Icon(Icons.person, size: 40),
              ),
            ),

            drawerItem(Icons.dashboard, "Dashboard", 0),
            drawerItem(Icons.upload_file, "Upload Music", 1),
            drawerItem(Icons.library_music, "My Songs", 2),
            drawerItem(Icons.bar_chart, "Analytics", 3),
            drawerItem(Icons.account_balance_wallet, "Earnings", 4),
            drawerItem(Icons.campaign, "Promotions", 5),
            drawerItem(Icons.notifications, "Notifications", 6),
            drawerItem(Icons.person, "Profile", 7),
            drawerItem(Icons.settings, "Settings", 8),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: getScreen(),
    );
  }

  Widget drawerItem(
    IconData icon,
    String title,
    int index,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        Navigator.pop(context);
      },
    );
  }

  Widget getScreen() {
    switch (selectedIndex) {
      case 0:
        return dashboardScreen();

      case 1:
        return uploadMusicScreen();

      case 2:
        return mySongsScreen();

      case 3:
        return analyticsScreen();

      case 4:
        return earningsScreen();

      case 5:
        return promotionsScreen();

      case 6:
        return notificationsScreen();

      case 7:
        return profileScreen();

      case 8:
        return settingsScreen();

      default:
        return dashboardScreen();
    }
  }

  Widget dashboardScreen() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: const [
          DashboardCard(
            title: "Streams",
            value: "125K",
            icon: Icons.play_circle_fill,
          ),
          DashboardCard(
            title: "Followers",
            value: "8,420",
            icon: Icons.people,
          ),
          DashboardCard(
            title: "Songs",
            value: "24",
            icon: Icons.music_note,
          ),
          DashboardCard(
            title: "Revenue",
            value: "\$1,250",
            icon: Icons.attach_money,
          ),
        ],
      ),
    );
  }

  Widget uploadMusicScreen() {
    return const Center(
      child: Text(
        "UPLOAD MUSIC SCREEN",
        style: TextStyle(fontSize: 28),
      ),
    );
  }

  Widget mySongsScreen() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        ListTile(
          leading: Icon(Icons.music_note),
          title: Text("My First Song"),
          subtitle: Text("12,000 Streams"),
        ),
        ListTile(
          leading: Icon(Icons.music_note),
          title: Text("African Vibes"),
          subtitle: Text("8,400 Streams"),
        ),
      ],
    );
  }

  Widget analyticsScreen() {
    return const Center(
      child: Text(
        "ANALYTICS SCREEN",
        style: TextStyle(fontSize: 28),
      ),
    );
  }

  Widget earningsScreen() {
    return const Center(
      child: Text(
        "TOTAL EARNINGS: \$1,250",
        style: TextStyle(fontSize: 28),
      ),
    );
  }

  Widget promotionsScreen() {
    return const Center(
      child: Text(
        "PROMOTIONS SCREEN",
        style: TextStyle(fontSize: 28),
      ),
    );
  }

  Widget notificationsScreen() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Your song reached 10,000 streams"),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("New follower joined"),
        ),
      ],
    );
  }

  Widget profileScreen() {
    return const Center(
      child: Text(
        "ARTIST PROFILE",
        style: TextStyle(fontSize: 28),
      ),
    );
  }

  Widget settingsScreen() {
    return const Center(
      child: Text(
        "SETTINGS",
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 45),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}