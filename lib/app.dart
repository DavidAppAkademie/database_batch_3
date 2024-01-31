import 'package:database_batch_3/features/crud/data/mock/mock_data_source.dart';
import 'package:database_batch_3/features/crud/data/mock/mock_repository.dart';
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
  // die von MockRepository, JsonRepository und SharedPrefsRepository implementiert wird.
  //
  // je nachdem, welche Implementierung wir hier verwenden,
  // nutzt die App als Datenquelle entweder eine lokale Variablen, JSON-Datei oder
  // die SharedPreferences.
  //
  late MockDataSource mockDataSource;
  late DatabaseRepository databaseRepository;
  @override
  void initState() {
    super.initState();
    mockDataSource = MockDataSource();

    databaseRepository //= JsonRepository(JsonDataSource());
        //               = SharedPrefsRepository(SharedPrefsDataSource());
        = MockRepository(mockDataSource);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // unsere App hat nur eine Seite, die ParticipantsPage
      // dieser geben wir das databaseRepository mit
      // (ob es nun MockRepository, JsonRepository oder SharedPrefsRepository ist, ist egal)
      home: ParticipantsPage(
        databaseRepository: databaseRepository,
      ),
    );
  }
}
