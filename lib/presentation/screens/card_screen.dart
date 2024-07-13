import 'package:flutter/material.dart';


const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1' },
  {'elevation': 2.0, 'label': 'Elevation 2' },
  {'elevation': 3.0, 'label': 'Elevation 3' },
  {'elevation': 4.0, 'label': 'Elevation 4' },
  {'elevation': 5.0, 'label': 'Elevation 5' },
];


class CardScreen extends StatelessWidget {

  static const String routeName = 'cards';
  
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Screen'),
      ),
      body: _CardView(),
    );
  }
}

class _CardView extends StatelessWidget {
  
  const _CardView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card){
            return _CardType1(label: card['label'], elevation: card['elevation']);
          }),
          ...cards.map((card){
            return _CardType2(label: card['label'], elevation: card['elevation']);
          }),
          ...cards.map((card){
            return _CardType3(label: card['label'], elevation: card['elevation']);
          }),
          ...cards.map((card){
            return _CardType4(label: card['label'], elevation: card['elevation']);
          }),
          
          const SizedBox( height: 50 )
        ],
      ),
    );
  }

}

class _CardType1 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType1({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert_outlined)
              )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType2({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colorsTheme = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all( Radius.circular(12.0) ),
        side: BorderSide(
          color: colorsTheme.outline
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert_outlined)
              )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType3({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colorsTheme = Theme.of(context).colorScheme;

    return Card(
      color: colorsTheme.surfaceContainerHighest,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert_outlined)
              )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType4({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${ elevation.toInt() }/600/350',
            height: 350,
            fit: BoxFit.cover,
          ),
      
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only( bottomLeft: Radius.circular(20) )
              ),
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert_outlined)
              ),
            )
          ),
        ],
      ),
    );
  }
}
