import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/data/home_data.dart';
import 'package:flutter_spotify_clone/screens/home_screen/home_screen.dart';
import 'package:flutter_spotify_clone/widgets/controller.dart';
import 'package:flutter_spotify_clone/widgets/sidebar.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 920) Sidebar(),
                const Expanded(
                  child: HomeScreen(
                    playlist: lofihiphopPlaylist,
                  ),
                ),
              ],
            ),
          ),
          Controller(),
        ],
      ),
    );
  }
}
