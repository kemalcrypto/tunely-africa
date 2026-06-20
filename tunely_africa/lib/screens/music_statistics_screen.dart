import 'package:flutter/material.dart';

class MusicStatisticsScreen extends StatelessWidget {
  const MusicStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      {
        "region": "East Africa",
        "streams": "12,500",
        "likes": "4,200",
        "downloads": "1,900",
      },
      {
        "region": "West Africa",
        "streams": "8,300",
        "likes": "2,700",
        "downloads": "1,100",
      },
      {
        "region": "South Africa",
        "streams": "6,900",
        "likes": "2,100",
        "downloads": "980",
      },
      {
        "region": "Asia",
        "streams": "5,700",
        "likes": "1,800",
        "downloads": "850",
      },
      {
        "region": "Europe",
        "streams": "4,800",
        "likes": "1,400",
        "downloads": "720",
      },
      {
        "region": "USA",
        "streams": "3,600",
        "likes": "900",
        "downloads": "500",
      },
    ];

    final growthData = [
      {"month": "Jan", "streams": 1200},
      {"month": "Feb", "streams": 1800},
      {"month": "Mar", "streams": 1500},
      {"month": "Apr", "streams": 2400},
      {"month": "May", "streams": 3100},
      {"month": "Jun", "streams": 2800},
      {"month": "Jul", "streams": 4200},
    ];

    final ageData = [
      {"age": "13-17", "listeners": "1,200"},
      {"age": "18-24", "listeners": "8,500"},
      {"age": "25-34", "listeners": "6,200"},
      {"age": "35-44", "listeners": "2,900"},
      {"age": "45+", "listeners": "1,100"},
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Music Statistics"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Statistics by Region",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: stats.length,
              itemBuilder: (context, index) {
                final item = stats[index];

                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.public, color: Colors.green),
                    title: Text(item["region"]!),
                    subtitle: Text(
                      "Streams: ${item["streams"]}\nLikes: ${item["likes"]}\nDownloads: ${item["downloads"]}",
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Total Summary",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: const [
                SummaryCard(
                  title: "Streams",
                  value: "41,800",
                  icon: Icons.headphones,
                ),
                SummaryCard(
                  title: "Likes",
                  value: "13,100",
                  icon: Icons.favorite,
                ),
                SummaryCard(
                  title: "Downloads",
                  value: "6,050",
                  icon: Icons.download,
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Monthly Growth Chart",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 220,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: growthData.map((item) {
                      final streams = item["streams"] as int;
                      final height = streams / 4200 * 170;

                      return Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              streams.toString(),
                              style: const TextStyle(fontSize: 11),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              height: height,
                              width: 22,
                              decoration: BoxDecoration(
                                color: streams >= 2500
                                    ? Colors.green
                                    : Colors.orange,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              item["month"].toString(),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Card(
              child: ListTile(
                leading: Icon(Icons.trending_up, color: Colors.green),
                title: Text("Trend Analysis"),
                subtitle: Text(
                  "Muziki ulipanda zaidi mwezi Jul baada ya kushuka kidogo mwezi Jun. Growth nzuri ilionekana Apr, May na Jul.",
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Audience Age",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ageData.length,
              itemBuilder: (context, index) {
                final item = ageData[index];

                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.people, color: Colors.green),
                    title: Text("Age ${item["age"]}"),
                    trailing: Text(
                      item["listeners"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("Listeners"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.green, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}