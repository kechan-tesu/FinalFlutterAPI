import 'package:flutter/material.dart';
import '../models/episode.dart';

class EpisodeCard extends StatelessWidget {
  final Episode episode;
  final Function(int) onDelete; // Callback for delete action
  final VoidCallback onEdit; // Callback for edit action

  EpisodeCard(
      {required this.episode, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title of the episode inside a Container for padding and dynamic layout
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                episode.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Body/content of the episode
            Container(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(episode.body),
            ),
            // Buttons for Edit and Delete inside a Row with Expanded widgets
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: onEdit,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => onDelete(episode.id),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
