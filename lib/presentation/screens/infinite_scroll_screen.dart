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
  final ScrollController scrollController = ScrollController();
  bool isLoadingNextPage = false;
  bool isMounted = true;


  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if( (scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent && !isLoadingNextPage ){
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }


  Future loadNextPage() async {
    isLoadingNextPage = true;
    setState(() {});

    await Future.delayed(const Duration( seconds: 2 ));

    addFiveImages();
    isLoadingNextPage = false;

    if(!isMounted) return;
    setState(() {});
    moveScrollToBottom();
    
  }

  void moveScrollToBottom(){
    if( scrollController.position.pixels + 100 >= scrollController.position.maxScrollExtent ){
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 70,
        duration: const Duration( milliseconds: 700 ),
        curve: Curves.easeOut
      );
    }
  }

  void addFiveImages(){
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => e + lastId )
    );
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 3));

    final int lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    if(!isMounted) return;
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Stack(
        children: [
          RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(
              controller: scrollController,
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
          ),

          isLoadingNextPage 
          ? const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: CircularProgressIndicator( color: Colors.red ),
              ),
              SizedBox(height: 20,)
            ],
          )
          : const SizedBox()
        ],
      ),
    );
  }
}