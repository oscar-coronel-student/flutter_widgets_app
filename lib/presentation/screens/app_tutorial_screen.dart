import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;
  SlideInfo({required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(title: 'Busca la comida', caption: 'Magna dolor deserunt officia adipisicing amet.', imageUrl: 'assets/images/1.png'),
  SlideInfo(title: 'Entrega rápida', caption: 'Et culpa ipsum adipisicing velit excepteur ad.', imageUrl: 'assets/images/2.png'),
  SlideInfo(title: 'Disfruta la comida', caption: 'Aute ad ullamco exercitation adipisicing ullamco.', imageUrl: 'assets/images/3.png'),
];


class AppTutorialScreen extends StatelessWidget {

  static const String routeName = 'app_tutorial';
  
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: _AppTutorialView(),
    );
  }

}

class _AppTutorialView extends StatefulWidget {

  const _AppTutorialView();

  @override
  State<_AppTutorialView> createState() => _AppTutorialViewState();
}

class _AppTutorialViewState extends State<_AppTutorialView> {

  late final PageController pageViewController;
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController = PageController();
    pageViewController.addListener((){
      final page = pageViewController.page ?? 0;
      if(!endReached && page >= (slides.length - 1.5)){
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageViewController,
          physics: const BouncingScrollPhysics(),
          children: slides.map((slide){
            return _Slide(title: slide.title, caption: slide.caption, imageUrl: slide.imageUrl);
          }).toList(),
        ),

        Positioned(
          right: 20,
          top: 50,
          child: TextButton(
            onPressed: (){
              context.pop();
            },
            child: const Text('Salir')
          )
        ),

        endReached 
          ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: () => context.pop(),
                child: const Text('Comenzar')
              ),
            )
          )
          : const SizedBox()
      ],
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 30 ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imageUrl)
            ),
            const SizedBox(height: 20,),
            Text(title, style: titleStyle),
            const SizedBox(height: 10,),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}