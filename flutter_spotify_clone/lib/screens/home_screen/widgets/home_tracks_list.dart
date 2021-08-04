import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/models/song_model.dart';
import 'package:flutter_spotify_clone/models/current_track_model.dart';
import 'package:provider/provider.dart';

class HomeTracksList extends StatelessWidget {
  const HomeTracksList({required this.tracks, Key? key}) : super(key: key);

  final List<Song> tracks;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle:
          Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
      dataRowHeight: 54.0,
      showCheckboxColumn: false,
      columns: const [
        DataColumn(
          label: Text('TITLE'),
        ),
        DataColumn(
          label: Text('ARTIST'),
        ),
        DataColumn(
          label: Text('ALBUM'),
        ),
        DataColumn(
          label: Icon(Icons.access_time),
        ),
      ],
      rows: tracks.map(
        (track) {
          final selected =
              context.watch<CurrentTrack>().selected?.id == track.id;
          final textStyle = TextStyle(
            color: selected
                ? Theme.of(context).accentColor
                : Theme.of(context).iconTheme.color,
          );

          return DataRow(
            cells: [
              DataCell(
                Text(
                  track.title,
                  style: textStyle,
                ),
              ),
              DataCell(
                Text(
                  track.artist,
                  style: textStyle,
                ),
              ),
              DataCell(
                Text(
                  track.album,
                  style: textStyle,
                ),
              ),
              DataCell(
                Text(
                  track.duration,
                  style: textStyle,
                ),
              ),
            ],
            selected: selected,
            onSelectChanged: (_) =>
                context.read<CurrentTrack>().selectTrack(track),
          );
        },
      ).toList(),
    );
  }
}
