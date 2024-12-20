import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:streaming_music/features/splash/pages/splash.dart';
import 'package:streaming_music/service_locator.dart';
import 'package:path_provider/path_provider.dart';

import 'core/configs/theme/app_theme.dart';
import 'features/choose_mode/bloc/theme_cubit.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo HydratedStorage
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  // Gán storage cho HydratedBloc
  HydratedBloc.storage = storage;

  setupDependencies();
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

// @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) =>
//           ThemeCubit(), // Thay thế ThemeCubit bằng Bloc bạn muốn sử dụng
//       child: BlocBuilder<ThemeCubit, ThemeMode>(
//         builder: (context, mode) => MaterialApp(
//           theme: AppTheme.lightTheme,
//           darkTheme: AppTheme.darkTheme,
//           themeMode: mode,
//           debugShowCheckedModeBanner: false,
//           home: const SplashPage(),
//         )
//     ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ThemeCubit())],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) => MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode,
            debugShowCheckedModeBanner: false,
            home: const SplashPage()),
      ),
    );
  }
}
