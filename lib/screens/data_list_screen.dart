import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/episode.dart';
import '../widgets/episode_card.dart';

class DataListScreen extends StatefulWidget {
  @override
  _DataListScreenState createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
  List<Episode> _episodes = []; // List to store fetched episodes

  // Fetch episodes from the API
  Future<void> fetchEpisodes() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List data = json.decode(response.body); // Parse the response as a list
      setState(() {
        _episodes = data
            .map((e) => Episode.fromJson(e))
            .toList(); // Convert the data to a list of Episode objects
      });
    } else {
      throw Exception('Failed to load episodes');
    }
  }

  // Delete an episode from the list
  void _deleteEpisode(int id) {
    setState(() {
      _episodes.removeWhere((episode) => episode.id == id);
    });
  }

  // Edit an episode: display a form for editing title and body
  void _editEpisode(Episode episode) {
    TextEditingController titleController =
        TextEditingController(text: episode.title);
    TextEditingController bodyController =
        TextEditingController(text: episode.body);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Episode'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: bodyController,
                decoration: InputDecoration(labelText: 'Body'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Update the episode with new values
                setState(() {
                  episode.update(titleController.text, bodyController.text);
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without saving
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchEpisodes(); // Fetch data when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Episodes'),
      ),
      body: _episodes.isEmpty
          ? Center(
              child:
                  CircularProgressIndicator()) // Show a loading spinner until data is fetched
          : ListView.builder(
              itemCount: _episodes.length, // Show the number of episodes
              itemBuilder: (context, index) {
                // Return an EpisodeCard widget for each episode
                return EpisodeCard(
                  episode: _episodes[index],
                  onDelete: _deleteEpisode,
                  onEdit: () => _editEpisode(_episodes[index]),
                );
              },
            ),
    );
  }
}
