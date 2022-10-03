import 'package:flutter/material.dart';
import 'package:peliculas/widgets/casting_cards.dart';

class DetailScreen extends StatelessWidget {
   
  const DetailScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              CastingCards(),
              
            ])
          )
        ],
      ),
      );
  }
}

class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.redAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'movie titutlo',
            style:  TextStyle(fontSize: 16),
            ),
        ),

        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
          ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
              ),            
          ),

          SizedBox(width: 20, ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('titulo pelicula', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text('titulo original', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 1,),

              Row(
                children: [
                  Icon(Icons.star_outline, size: 15, color: Colors.grey,),
                  Text('Calificacion de pelicula', style:textTheme.caption,),

                ],
              )
            ],
          )
        ],
      ),


    );
  }
}

class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Veniam fugiat eu anim duis eiusmod occaecat fugiat esse labore. Cupidatat magna nostrud eu sint sunt excepteur. Proident officia cillum nostrud anim sit nulla velit. Cillum duis ullamco occaecat ea. Ipsum voluptate adipisicing dolor minim pariatur est excepteur nostrud nostrud.Culpa proident amet aute id eiusmod enim ut laboris enim incididunt officia incididunt.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
        ),
    );
  }
}

