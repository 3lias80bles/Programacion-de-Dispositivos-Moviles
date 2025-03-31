import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Función principal que inicia la aplicación
void main() {
  runApp(MyApp());
}

// Clase principal de la aplicación, extiende StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          MyAppState(), // Proveedor del estado de la aplicación
      child: MaterialApp(
        title: 'EXAMEN',
        theme: ThemeData(
          useMaterial3: true, // Habilita Material 3
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(
                  255, 34, 86, 255)), // Define el esquema de colores
        ),
        home: MyHomePage(), // Página de inicio
      ),
    );
  }
}

// Clase que maneja el estado de la aplicación
class MyAppState extends ChangeNotifier {
  var current = WordPair.random(); // Genera una nueva palabra aleatoria
  void getNext() {
    current = WordPair.random(); // Genera una nueva palabra aleatoria
    notifyListeners(); // Notifica a los widgets dependientes del cambio
  }

  var favorites = <WordPair>[]; // Lista de palabras favoritas

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current); // Elimina la palabra de favoritos si ya estaba
    } else {
      favorites.add(current); // Agrega la palabra a favoritos si no estaba
    }
    notifyListeners(); // Notifica a los widgets dependientes del cambio
  }
}

// ...
// Página principal de la aplicación
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //clase privada _  // Índice de la página seleccionada
  var selectedIndex =
      0; // Índice de la página seleccionada, caso0 es la donde esta el home y caso1 es donde estan los favoritos
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = PaginaPrincipal(); // Página principal
        break;
      case 1:
        page = PaginaFavoritos(); // Página de favoritos
        break;
      default:
        throw UnimplementedError('No hay widgets para $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >=
                    600, // Expande el menú si la pantalla es grande
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favoritos'),
                  ),
                ],
                selectedIndex: selectedIndex, // Página seleccionada
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value; // Cambia la página activa
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

// Página principal donde se muestra la palabra generada
class PaginaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();// Obtiene el estado de la aplicación
    var pair = appState.current;// Obtiene la palabra actual

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;// Ícono de favorito si la palabra está en favoritos
    } else {
      icon = Icons.favorite_border;// Ícono de no favorito si no está en favoritos
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),// Muestra la palabra en una tarjeta grande
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();// Agrega o quita la palabra de favoritos
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();// Obtiene una nueva palabra aleatoria
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Página donde se muestran las palabras favoritas
class PaginaFavoritos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();// Obtiene el estado de la aplicación

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('Aun no hay favoritos.'),// Mensaje si no hay favoritos
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Tu tienes '// Mensaje si no hay favoritos
              '${appState.favorites.length} favoritos:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),// Ícono de favorito
            title: Text(pair.asLowerCase),// Muestra la palabra favorita
          ),
      ],
    );
  }
}

// ...
// Widget que muestra la palabra en una tarjeta grande
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onSecondary,
    );
    return Card(
      color: theme.colorScheme.primary,// Color de la tarjeta
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,// Muestra la palabra en minúsculas
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
