import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

//Config project
import 'core/config/inital_config.dart';

// Routes
import 'core/paths/app_paths.dart';
import 'core/repositories/hero_repository/hero_impl.dart';
import 'core/view_models/view_models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalConfig();
  runApp(const MyApp());
}

final injector = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MarvelViewModel>(
          create: (BuildContext context) => MarvelViewModel(
            injector.get<HeroInterfaceImpl>(),
          ),
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
