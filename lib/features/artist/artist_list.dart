import 'package:flutter/material.dart';

import '../../core/configs/constants/app_urls.dart';

class ArtistsGridPage extends StatelessWidget {
  final List<Artist> artists = [
    Artist(
      name: "Taylor Swift",
      avatarUrl: "${AppURLs.coverFirestorage}products%2Fimages%2FTaylorSwift.jpg?${AppURLs.mediaAlt}",
      bio: "Taylor Swift is an American singer-songwriter.",
      songs: [
        Song(title: "Love Story", album: "Fearless"),
        Song(title: "Shake It Off", album: "1989"),
        Song(title: "All Too Well", album: "Red"),
      ], albums: [
        Album(
          name: "Fearless",
          coverUrl: "https://via.placeholder.com/120",
        ),
        Album(
          name: "1989",
          coverUrl: "https://via.placeholder.com/120",
        ),
        Album(
          name: "Red",
          coverUrl: "https://via.placeholder.com/120",
        ),
      ],
    ),
    Artist(
      name: "Ed Sheeran",
      avatarUrl: "${AppURLs.coverFirestorage}products%2Fimages%2FEd.jpg?${AppURLs.mediaAlt}",
      bio: "Ed Sheeran (born February 17, 1991, Halifax, West Yorkshire, England) is a British singer-songwriter known for his genre-crossing style infused with elements of folk, rock, rhythm and blues (R&B), pop, and hip-hop.",
      songs: [
        Song(title: "Shape of You", album: "Divide"),
        Song(title: "Perfect", album: "Divide"),
        Song(title: "Thinking Out Loud", album: "Multiply"),
      ], albums: [
        Album(
          name: "Fearless",
          coverUrl: "https://via.placeholder.com/120",
        ),
        Album(
          name: "1989",
          coverUrl: "https://via.placeholder.com/120",
        ),
        Album(
          name: "Red",
          coverUrl: "https://via.placeholder.com/120",
        ),
      ],
    ),
    Artist(
      name: "Adele",
      avatarUrl: "${AppURLs.coverFirestorage}products%2Fimages%2FAdele.jpg?${AppURLs.mediaAlt}",
      bio: "Adele is a British singer known for her powerful voice.",
      songs: [
        Song(title: "Hello", album: "25"),
        Song(title: "Someone Like You", album: "21"),
        Song(title: "Rolling in the Deep", album: "21"),
      ], albums: [
        Album(
          name: "Fearless",
          coverUrl: "https://via.placeholder.com/120",
        ),
        Album(
          name: "1989",
          coverUrl: "https://via.placeholder.com/120",
        ),
        Album(
          name: "Red",
          coverUrl: "https://via.placeholder.com/120",
        ),
      ],
    ),
    Artist(
      name: "Son Tung M-TP",
      avatarUrl: "${AppURLs.coverFirestorage}products%2Fimages%2FMTP.jpg?${AppURLs.mediaAlt}",
      bio: "Son Tung M-TP was born on 5 July 1994 in Thái Bình, Vietnam. He is an actor and composer, known for Dandelion (2014), Sky Tour: The Movie (2020) and Son Tung M-TP: Noi nay co anh (2017).",
      songs: [
        Song(title: "Chung ta khong thuoc ve nhau", album: "Chung ta"),
        Song(title: "Tien len Viet Nam", album: "Chung ta"),
        Song(title: "Noi nay co anh", album: "Chung ta"),
      ], albums: [
        Album(
          name: "Fearless",
          coverUrl: "https://via.placeholder.com/120",
        ),
        Album(
          name: "1989",
          coverUrl: "https://via.placeholder.com/120",
        ),
        Album(
          name: "Red",
          coverUrl: "https://via.placeholder.com/120",
        ),
      ],
    ),
    Artist(
      name: "Binz",
      avatarUrl: "${AppURLs.coverFirestorage}products%2Fimages%2FBinz.jpg?${AppURLs.mediaAlt}",
      bio: "Adele is a British singer known for her powerful voice.",
      songs: [
        Song(title: "Hello", album: "25"),
        Song(title: "Someone Like You", album: "21"),
        Song(title: "Rolling in the Deep", album: "21"),
      ], albums: [
        Album(
          name: "Fearless",
          coverUrl: "https://via.placeholder.com/120",
        ),
        Album(
          name: "1989",
          coverUrl: "https://via.placeholder.com/120",
        ),
        Album(
          name: "Red",
          coverUrl: "https://via.placeholder.com/120",
        ),
      ],
    ),
    Artist(
      name: "Rhyder",
      avatarUrl: "${AppURLs.coverFirestorage}products%2Fimages%2FRhyder.jpg?${AppURLs.mediaAlt}",
      bio: "Adele is a British singer known for her powerful voice.",
      songs: [
        Song(title: "Hello", album: "25"),
        Song(title: "Someone Like You", album: "21"),
        Song(title: "Rolling in the Deep", album: "21"),
      ], albums: [
        Album(
          name: "Fearless",
          coverUrl: "https://via.placeholder.com/120",
        ),
        Album(
          name: "1989",
          coverUrl: "https://via.placeholder.com/120",
        ),
        Album(
          name: "Red",
          coverUrl: "https://via.placeholder.com/120",
        ),
      ],
    ),
  ];

  ArtistsGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          itemCount: artists.length,
          itemBuilder: (context, index) {
            final artist = artists[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArtistDetailPage(artist: artist),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(artist.avatarUrl),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    artist.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ArtistDetailPage extends StatelessWidget {
  final Artist artist;

  const ArtistDetailPage({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artist.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(artist.avatarUrl),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    artist.bio,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Songs",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 280,
              child: ListView.builder(
                itemCount: artist.songs.length,
                itemBuilder: (context, index) {
                  final song = artist.songs[index];
                  return ListTile(
                    title: Text(song.title),
                    subtitle: Text(song.album),
                    leading: const Icon(Icons.music_note),
                  );
                },
              ),
            ),

            // Albums List
            const Text(
              "Albums",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150, // Fixed height for the horizontal list
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Album 1
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  '${AppURLs.coverFirestorage}products%2Fimages%2Fed1.jpg?${AppURLs.mediaAlt}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Hi - Fi",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    // Album 2
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  '${AppURLs.coverFirestorage}products%2Fimages%2Fed2.jpg?${AppURLs.mediaAlt}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Get X",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    // Album 3
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  '${AppURLs.coverFirestorage}products%2Fimages%2Fed3.jpg?${AppURLs.mediaAlt}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Boat",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Artist {
  final String name;
  final String avatarUrl;
  final String bio;
  final List<Song> songs;
  final List<Album> albums;

  Artist({
    required this.name,
    required this.avatarUrl,
    required this.bio,
    required this.songs,
    required this.albums,
  });
}

class Song {
  final String title;
  final String album;

  Song({required this.title, required this.album});
}

class Album {
  final String name;
  final String coverUrl;

  Album({required this.name, required this.coverUrl});
}
