import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/settings_provider.dart';
import 'package:weatherapp/widgets/forecast/forecast_tab_widget.dart';
import 'package:weatherapp/widgets/location/location_tab_widget.dart';
import 'package:weatherapp/providers/location_provider.dart';
import 'package:weatherapp/providers/forecast_provider.dart';
import 'package:weatherapp/themes/themes.dart' as themes;

// TODOS: The TODOs are located in Assignment8-1 in canvas assignments
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ForecastProvider()),
    ChangeNotifierProvider(
        create: (context) => LocationProvider(
            Provider.of<ForecastProvider>(context, listen: false))),
    ChangeNotifierProvider(create: (context) => SettingsProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = 'CS492 Weather App';

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      title: title,
      theme: themes.lightTheme(Color(settingsProvider.darkModeColor)),
      darkTheme: themes.darkTheme(Color(settingsProvider.darkModeColor)),
      themeMode: settingsProvider.darkMode ? ThemeMode.dark : ThemeMode.light,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        endDrawer: SettingsDrawer(settingsProvider: settingsProvider),
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [SettingsButton()],
            title: Text(widget.title),
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.sunny_snowing)),
              Tab(icon: Icon(Icons.edit_location_alt))
            ])),
        body: TabBarView(children: [ForecastTabWidget(), LocationTabWidget()]),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.settings),
        onPressed: () {
          Scaffold.of(context).openEndDrawer();
        });
  }
}

class SettingsDrawer extends StatefulWidget {
  const SettingsDrawer({
    super.key,
    required this.settingsProvider,
  });

  final SettingsProvider settingsProvider;

  @override
  _SettingsDrawerState createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  Color pickerColor = Colors.yellow; // Default color

  @override
  void initState() {
    super.initState();
    pickerColor = Color(widget.settingsProvider.darkModeColor);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: (color) {
              setState(() {
                pickerColor = color;
              });
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              widget.settingsProvider.setSeedColor(pickerColor);
            });
          },
          child: Text('Update Color'),
        ),
        Switch(
            value: widget.settingsProvider.darkMode,
            onChanged: (bool value) {
              widget.settingsProvider.toggleMode();
            }),
      ],
    ));
  }
}
