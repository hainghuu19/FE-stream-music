import 'package:flutter/material.dart';

import '../../core/configs/constants/app_urls.dart';

class MusicNewsPage extends StatelessWidget {
  const MusicNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock data: danh sách tin tức âm nhạc
    final musicNews = [
      {
        'image': '${AppURLs.coverFirestorage}products%2Fimages%2FTaylorSwift.jpg?${AppURLs.mediaAlt}', // Placeholder image
        'title': 'Taylor Swift Breaks Records Again',
        'description':
            'The pop icon becomes the first artist to dominate the Billboard charts for 10 weeks straight.',
      },
      {
        'image': '${AppURLs.coverFirestorage}products%2Fimages%2FBTS.jpg?${AppURLs.mediaAlt}',
        'title': 'BTS Announces New World Tour',
        'description':
            'The global superstars reveal dates for their highly anticipated 2024 world tour.',
      },
      {
        'image': '${AppURLs.coverFirestorage}products%2Fimages%2FAdele.jpg?${AppURLs.mediaAlt}',
        'title': 'New Album From Adele Drops Soon',
        'description':
            'The singer-songwriter teases fans with a snippet of her upcoming album.',
      },
      {
        'image': '${AppURLs.coverFirestorage}products%2Fimages%2FGrammy.jpg?${AppURLs.mediaAlt}',
        'title': 'Grammy Nominations 2024',
        'description':
            'A look at the top contenders for the biggest night in music.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('News today'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: musicNews.length,
        itemBuilder: (context, index) {
          final news = musicNews[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            child: InkWell(
              onTap: () {
                // Navigate to detailed news page (placeholder for now)
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(news['title']!),
                    content: Text(news['description']!),
                  ),
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image thumbnail
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      news['image']!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Title and description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news['title']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          news['description']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
