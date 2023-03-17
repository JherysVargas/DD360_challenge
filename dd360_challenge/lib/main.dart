import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Config project
import 'core/config/inital_config.dart';

// Routes
import 'core/paths/app_paths.dart';
import 'core/view_models/view_models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HeroViewModel>(
          create: (BuildContext context) => HeroViewModel(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}
