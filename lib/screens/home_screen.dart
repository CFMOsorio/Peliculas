import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.search_outlined),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //tarjetas principales
            CardSwiper( movies: moviesProvider.onDisplayMovies ),
            //slider de peliculas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares', 

            ),
            
          ],
        ),
      )
    );
  }
}