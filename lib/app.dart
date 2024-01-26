import 'package:database_batch_3/features/crud/data/shared_prefs/shared_prefs_service.dart';
import 'package:database_batch_3/features/crud/presentation/participants_page.dart';
import 'package:flutter/material.dart';
import 'features/crud/data/shared_prefs/shared_prefs_repository.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // DatabaseRepository ist eine abstrakte Klasse,
  // die von JsonRepository und SharedPrefsRepository implementiert wird.
  //
  // je nachdem, welche Implementierung wir hier verwenden,
  // nutzt die App als Datenquelle entweder eine JSON-Datei oder
  // die SharedPreferences.
  //
  final DatabaseRepository databaseRepository //= JsonRepository(JsonService());
      = SharedPrefsRepository(SharedPrefsService());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // unsere App hat nur eine Seite, die ParticipantsPage
      // dieser geben wir das databaseRepository mit
      // (ob es nun JsonRepository oder SharedPrefsRepository ist, ist egal)
      home: ParticipantsPage(
        databaseRepository: databaseRepository,
      ),
    );
  }
}
