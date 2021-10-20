import 'package:flutter/material.dart';
import 'package:youtube_favorites/delegates/data_search.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 25,
          child: Image.asset("assets/images/yt_logo_rgb_dark.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          const Align(
            alignment: Alignment.center,
            child: Text("0"),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.star)),
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                var result =
                    await showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      body: Container(),
    );
  }
}
