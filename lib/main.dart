import 'package:flutter/material.dart';
import 'package:youtube_clone/video_page.dart';

void main() => runApp(YouTubeCloneApp());

class YouTubeCloneApp extends StatelessWidget {
  const YouTubeCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark().copyWith(
        iconTheme: const IconThemeData(color: Colors.white),
        primaryIconTheme: const IconThemeData(color: Colors.white),
      ),
      themeMode: ThemeMode.system,
      home: YouTubeHomePage(),
    );
  }
}

class YouTubeHomePage extends StatelessWidget {
  final List<String> videoImages = [
    'assets/images/youtube0.png',
    'assets/images/youtube1.png',
    'assets/images/youtube2.png',
    'assets/images/youtube3.png',
    'assets/images/youtube4.png',
    'assets/images/youtube5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/youtube_icon.png', height: 30.0),
            const SizedBox(width: 10),
            const Text('YouTube', style: TextStyle(color: Color(0xFFF9F9F9))),
          ],
        ),
        actions: const [
          Icon(Icons.videocam, color: Color(0xFFF9F9F9)),
          SizedBox(width: 15),
          Icon(Icons.search, color: Color(0xFFF9F9F9)),
          SizedBox(width: 15),
          CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg')),
          SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        itemCount: videoImages.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 4,
            child: Column(
              children: [
                Image.asset(videoImages[index]),
                ListTile(
                  leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/youtube1.png')),
                  title: Text('Видео #${index + 1}'),
                  subtitle: const Text(
                      'YouTube Channel • 1M просмотров • 3 дня назад'),
                  trailing: const Icon(Icons.more_vert),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VideoPage(),  // Переход на страницу видео
                    ));
                  },
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: const Color(0xFFF9F9F9),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Обзор'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: 'Добавить'),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions), label: 'Подписки'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: 'Библиотека'),
        ],
      ),
    );
  }
}
