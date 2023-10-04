import 'package:flutter/material.dart';
import 'package:youtube_clone/video_widget.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Видео #1'),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: ListView(
        children: [
          VideoPreviewWidget(videoPath: 'assets/video/1.mp4', isAsset: true),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Видео #1',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('1M views • 3 months ago',
                    style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildIconButton(Icons.thumb_up, '1K'),
                    _buildIconButton(Icons.thumb_down, '50'),
                    _buildIconButton(Icons.share, 'Share'),
                    _buildIconButton(Icons.download_rounded, 'Download'),
                    _buildIconButton(Icons.library_add, 'Save'),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/youtube1.png')),
            title: const Text('Youtube Channel'),
            subtitle: const Text('1M subscribers'),
            trailing:
                ElevatedButton(onPressed: () {}, child: const Text('SUBSCRIBE')),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Comments (500)',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg')),
            title: Text('Maqsat'),
            subtitle: Text('Сool video'),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Recommended Videos',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ...List.generate(10, (index) => _buildRecommendedVideoItem(index))
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon),
          SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildRecommendedVideoItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Вы можете настроить отступы здесь
      child: InkWell(
        onTap: () {
          // Действие при нажатии на рекомендованное видео
        },
        child: Column(
          children: [
            Row(
              children: [
                // Миниатюра видео
                Container(
                  width: 130,
                  height: 73,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1685223895575-51957f4b5d5c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title of Video $index',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Channel Name',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '1M views • 3 months ago',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
