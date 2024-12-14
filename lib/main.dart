import 'package:flutter/material.dart';
import 'package:streaming_music/config/app_routes.dart';
import 'package:streaming_music/service_locator.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: AppRoutePath.welcomePage,
    );
  }
}

// class MusicPlayer extends StatefulWidget {
//   @override
//   _MusicPlayerState createState() => _MusicPlayerState();
// }

// class _MusicPlayerState extends State<MusicPlayer> {
//   final AudioPlayer _audioPlayer = AudioPlayer();

//   Future<void> playSong(int songId) async {
//     final response = await http.get(
//       Uri.parse('http://10.0.2.2:8080/api/songs/play/$songId'),
//     );

//     if (response.statusCode == 200) {
//       Uint8List bytes = response.bodyBytes;
//       await _audioPlayer.play(BytesSource(bytes));
//     } else {
//       print('Không thể phát bài hát');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Music Player')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => playSong(2), // Phát bài hát với ID 1
//           child: const Text('Play Song'),
//         ),
//       ),
//     );
//   }
// }
