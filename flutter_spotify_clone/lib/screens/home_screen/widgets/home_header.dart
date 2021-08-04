import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/models/playlist_model.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({required this.playlist, Key? key}) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                playlist.imageURL,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PLAYLIST',
                      style: Theme.of(context)
                          .textTheme
                          .overline!
                          .copyWith(fontSize: 12.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      playlist.name,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(height: 24.0),
                    Text(
                      playlist.description,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      'Created by ${playlist.creator} • ${playlist.songs.length} songs, ${playlist.duration}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          _PlaylistButton(followers: playlist.followers)
        ],
      ),
    );
  }
}

class _PlaylistButton extends StatelessWidget {
  const _PlaylistButton({required this.followers, Key? key}) : super(key: key);

  final String followers;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('PLAY'),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 48.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Theme.of(context).accentColor,
            primary: Theme.of(context).iconTheme.color,
            textStyle: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 12.0, letterSpacing: 2.0),
          ),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          icon: const Icon(Icons.favorite_border),
          iconSize: 30.0,
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          iconSize: 30.0,
          onPressed: () {},
        ),
        const Spacer(),
        Text(
          'FOLLOWERS\n$followers',
          style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
