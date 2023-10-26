# YouTube ID Scraper

A simple and efficient Flutter package to extract YouTube video IDs and other details from URLs. This package allows you to retrieve important information from YouTube video links, making it easier to work with YouTube URLs in your Flutter applications.

## Installation

To use this package, add `youtube_id_scraper` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  youtube_id_scraper: ^1.0.0
  ```


## Usage

To use the package, follow these steps.

//1. Import the package in your Dart code.
import 'package:youtube_id_scraper/youtube_id_scraper.dart';

//2. Create an instance of the YouTubeIDScraper class.
YouTubeIDScraper ytscrab = YouTubeIDScraper();

//3. Define a YouTube video URL.
String url = "https://www.youtube.com/watch?v=abcdefghijk";

//4. Access the getVideoID method to extract video details.
var videoDetails = ytscrab.getVideoID(url);

//5. Retrieve and use the extracted details, for example.
print(videoDetails.id); // Print the ID // Print null if no id found
print(videoDetails.errorLog); // Print the Error Log // Print null if no error found
print(videoDetails.errorDescription); // Print the Error Description // Print null if no error found
print(videoDetails.urlType); // Print the url type like, long or shorten or youtube shorts url  // Print null if any error found
print(videoDetails.videoURL); // Print the video url provided by user or programmer```



