import 'dart:async';

// import 'package:clean_tutorial1/app/home/presentation/component/photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/helper/focus_helper.dart';
import '../component/staggered_grid_view.dart';
import '../vm/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  StreamSubscription? _subscription;

  @override
  initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<HomeViewModel>();
      _subscription = viewModel.eventStream.listen((event) {
        event.when(
          showSnackBar: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          },
        );
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // vm
    final viewModel = context.watch<HomeViewModel>(); // provider watch
    final state = viewModel.state;

    return GestureDetector(
      onTap: () {
        hideKeyboard(context: context);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              // color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: const Text(
            '이미지 검색앱',
            // style: TextStyle(
            //   color: Colors.black,
            // ),
          ),
          centerTitle: true,
          // backgroundColor: Colors.white,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      viewModel.fetch(_controller.text);
                    },
                  ),
                ),
                onSubmitted: (value) async {
                  viewModel.fetch(value);
                },
              ),
            ),
            state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  )
                : Expanded(
                    child: StaggeredGridView(
                      photos: state.photos,
                    ),

                    // GridView.builder(
                    //   padding: const EdgeInsets.all(16.0),
                    //   itemCount: state.photos.length,
                    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisSpacing: 16,
                    //     mainAxisSpacing: 16,
                    //     crossAxisCount: 2,
                    //   ),
                    //   itemBuilder: (context, index) {
                    //     return PhotoWidget(
                    //       photo: state.photos[index],
                    //     );
                    //   },
                    // ),
                  ),
          ],
        ),
      ),
    );
  }
}
