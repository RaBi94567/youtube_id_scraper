# YouTube ID Scraper Example

Below is an example of how to use the `youtube_id_scraper` package in a simple Flutter application. This example demonstrates how to extract YouTube video IDs and other details from URLs using the package.

```dart
import 'package:flutter/material.dart';

// Import the package
import 'package:youtube_id_scraper/youtube_id_scraper.dart';

// The main function
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("YouTube ID Scraper"),
      ),
      body: MainAppStart(),
    ),
  ));
}

// A stateful widget to define the application's main start point
class MainAppStart extends StatefulWidget {
  const MainAppStart({Key? key}) : super(key: key);

  @override
  State<MainAppStart> createState() => _MainAppStartState();
}

// The state class
class _MainAppStartState extends State<MainAppStart> {
  // Create an instance of the YouTubeIDScraper
  YouTubeIDScraper ytscrab = YouTubeIDScraper();

  // Define the YouTube video URL
  String url = "https://www.youtube.com/watch?v=abcdefghijk";

  @override
  Widget build(BuildContext context) {
    // Access the getVideoID method to extract video details
    var videoDetails = ytscrab.getVideoID(url);
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              const Text("Video ID: "),
              Text(videoDetails.id ??
                  "Unable to get Video ID"), // Print "Unable to get Video ID" if video id is null
            ],
          ),
          Row(
            children: [
              const Text("Video URL: "),
              Text(videoDetails.videoURL ??
                  "Unable to get Video URL"), // Print "Unable to get Video URL" if video URL is null
            ],
          ),
          Row(
            children: [
              const Text("Error Log: "),
              Text(videoDetails.errorLog ??
                  "No Error"), // Print "No Error" if it's a valid URL; otherwise, print the error log
            ],
          ),
          Row(
            children: [
              const Text("Error Description: "),
              Text(videoDetails.errorDescription ??
                  "No Error"), // Print "No Error" if it's a valid URL; otherwise, print the error description
            ],
          ),
          Row(
            children: [
              const Text("URL Type: "),
              Text(videoDetails.urlType ??
                  "Unable to get URL Type"), // Print "Unable to get URL Type" if any error occurs
            ],
          ),
        ],
      ),
    );
  }
}
