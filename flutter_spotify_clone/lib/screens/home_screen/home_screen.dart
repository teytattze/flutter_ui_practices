import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/models/playlist_model.dart';
import 'package:flutter_spotify_clone/screens/home_screen/widgets/home_header.dart';
import 'package:flutter_spotify_clone/screens/home_screen/widgets/home_tracks_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.playlist, Key? key}) : super(key: key);

  final Playlist playlist;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 140.0,
            leading: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        size: 28.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        size: 28.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_circle_outlined, size: 28.0),
                label: const Text('Tey'),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  primary: Theme.of(context).iconTheme.color,
                ),
              ),
              const SizedBox(width: 8.0),
              IconButton(
                splashRadius: 20,
                padding: const EdgeInsets.only(),
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 28.0,
                ),
              ),
              const SizedBox(width: 20.0),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFAF1018),
              Theme.of(context).backgroundColor,
            ],
            stops: const [0, 0.3],
          ),
        ),
        child: Scrollbar(
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 20.0),
            children: [
              HomeHeader(playlist: widget.playlist),
              HomeTracksList(
                tracks: widget.playlist.songs,
              )
            ],
          ),
        ),
      ),
    );
  }
}
