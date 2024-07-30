import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatelessWidget {

  static const String routeName = 'infinite_scroll';
  
  const InfiniteScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _InfiniteScrollView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }

}

class _InfiniteScrollView extends StatefulWidget {
  const _InfiniteScrollView();

  @override
  State<_InfiniteScrollView> createState() => _InfiniteScrollViewState();
}

class _InfiniteScrollViewState extends State<_InfiniteScrollView> {

  List<int> imagesIds = [1,2,3,4,5];
  
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        itemCount: imagesIds.length,
        itemBuilder: (context, index){
          return FadeInImage(
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/id/${ imagesIds[index] }/500/300')
          );
        },
      ),
    );
  }
}