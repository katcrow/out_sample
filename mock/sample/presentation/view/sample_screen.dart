import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/global_widgets/custom_text.dart';
import '../../../core/helper/focus_helper.dart';
import '../component/photo_widget.dart';
import '../vm/sample_view_model.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  final TextEditingController _controller = TextEditingController();
  StreamSubscription? _subscription;

  @override
  initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<SampleViewModel>();
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
    final viewModel = context.watch<SampleViewModel>();
    final state = viewModel.state;

    return GestureDetector(
      onTap: () {
        hideKeyboard(context: context);
      },
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: subHeadingTextLarge(
                  text: 'Drawer Header',
                  context: context,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.note_add_outlined,
                  size: 30,
                ),
                title: subHeadingTextMedium(
                  text: 'Note App',
                  context: context,
                ),
                onTap: () {
                  // Update the state of the app.
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.food_bank_outlined,
                  size: 30,
                ),
                title: subHeadingTextMedium(
                  text: 'restaurant App',
                  context: context,
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0.0,
          title: mainHeading(
            text: '샘플 이미지 검색앱',
            context: context,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                style: Theme.of(context).textTheme.titleLarge,
                onSubmitted: (value) async {
                  viewModel.fetch(value);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16.0),
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
              ),
            ),
            state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: state.photos.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return SamplePhotoWidget(
                          photo: state.photos[index],
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
