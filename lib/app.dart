import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stellar/src/presentation/global_bloc.dart';

import 'src/presentation/screens/intro/splash_screen.dart';
import 'src/presentation/ui/config/routes.dart';
import 'src/presentation/ui/config/theme.dart';

const themeColor = Color(0xff1560BD);

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late GlobalBloc globalBloc;

  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc,
      child: MaterialApp(
        // locale: state.locale,
        // localizationsDelegates: const [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        // ],
        // supportedLocales: translations.supportedLocales(),
        debugShowCheckedModeBanner: false,
        theme: robotheme,
        routes: routes,
        home: const SplashScreen(),
      ),
    );
  }
}
