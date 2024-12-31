import 'package:flutter/material.dart';

class TopSongsPage extends StatelessWidget {
  const TopSongsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock data: danh sách bài hát
    final topSongs = [
      {
        'title': 'We don''t talk anymore',
        'artist': 'Charlie Puth',
        'plays': '1,000',
      },
      {
        'title': 'Love Yourself',
        'artist': 'Justin Bieber',
        'plays': '950',
      },
      {
        'title': 'Shape of You',
        'artist': 'Ed Sheeran',
        'plays': '900',
      },
      {
        'title': 'Dance Monkey',
        'artist': 'Tones and I',
        'plays': '850',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Songs of the Week'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: topSongs.length,
        itemBuilder: (context, index) {
          final song = topSongs[index];
          return ListTile(
              leading: CircleAvatar(
                child: Text(
                  (index + 1).toString(), // Hiển thị số thứ tự
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                song['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Artist: ${song['artist']}'),
              trailing: Text('${song['plays']} plays'),
            );
        },
      ),
    );
  }
}
