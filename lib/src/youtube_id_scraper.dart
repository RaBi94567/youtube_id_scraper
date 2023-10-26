// A class for extracting YouTube video IDs and related information from URLs.
class YouTubeIDScraper {
  String?
      videoURL; // The URL of the YouTube video provided bu user or programmer.
  String? id; // The extracted ID of the YouTube video.
  String?
      errorLog; // A log to store errors encountered during the extraction process.
  String?
      errorDescription; // A description of any errors encountered during the extraction process.
  String?
      urlType; // The type of URL extracted, whether it's a full YouTube URL, a shortened URL, or a YouTube shorts URL.

  // Method to extract video details based on the provided URL.
  YouTubeIDScraper getVideoID(String url) {
    videoURL = url;
    try {
      // Check if the URL is empty.
      if (url.isNotEmpty) {
        if (url.contains("https://") || url.contains("http://")) {
          // Check line by line for different URL types.
          // For long URLs.
          if (url.contains("youtube.com/watch?v=") && url.length > 38) {
            // For long links (valid ID).
            String tempID = url.split("?v=")[1];
            if (tempID.length >= 11) {
              id = tempID.substring(0, 11);
              errorLog = null;
              errorDescription = null;
              urlType = "Full YouTube URL";
            } else {
              // Length is smaller than 11.
              setInvalidData();
            }
          } else {
            // For shortened URLs.
            if (url.contains("youtu.be/") && url.length > 25) {
              // For shortened links (valid ID).
              String tempID = url.split(".be/")[1];
              if (tempID.length >= 11) {
                id = tempID.substring(0, 11);
                errorLog = null;
                errorDescription = null;
                urlType = "Shorten YouTube URL";
              } else {
                // Length is smaller than 11.
                setInvalidData();
              }
            } else {
              // For YouTube shorts URLs.
              if (url.contains("youtube.com/shorts/") && url.length > 30) {
                // For shortened links (valid ID).
                String tempID = url.split("/shorts/")[1];
                if (tempID.length >= 11) {
                  id = tempID.substring(0, 11);
                  errorLog = null;
                  errorDescription = null;
                  urlType = "YouTube Shorts URL";
                } else {
                  // Length is smaller than 11. making id null and providing error message
                  setInvalidData();
                }
              } else {
                // For shortened links (invalid ID). making id null and providing error message
                id = null;
                errorLog = "Invalid URL";
                errorDescription = "Provided URL is Invalid";
                urlType = null;
              }
            }
          }
        } else {
          // If the URL does not contain http or https. making id null and providing error message
          id = null;
          errorLog = "Invalid URL";
          errorDescription = "Provided URL should contain http:// or https://";
          urlType = null;
        }
      } else {
        // If the URL is empty. making id null and providing error message
        id = null;
        errorLog = "Invalid URL";
        errorDescription = "Provided URL is Empty";
        urlType = null;
      }
    } catch (e) {
      // An unknown error occurred. making id null and providing error message
      id = null;
      errorLog = "Unknown Error";
      errorDescription = e.toString();
      urlType = null;
    }
    return this;
  }

  // Method to handle the case of invalid data. making id null and providing error message
  setInvalidData() {
    id = null;
    errorLog = "Invalid Video ID";
    errorDescription = "Provided YouTube Video URL Contains Invalid Video ID";
    urlType = null;
  }
}
