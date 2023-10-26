class YouTubeIDScraper {
  String? videoURL;
  String? id;
  String? errorLog;
  String? errorDescription;
  String? urlType;

  YouTubeIDScraper getVideoID(String url) {
    videoURL = url;
    try {
      //check if url is empty
      if (url.isNotEmpty) {
        if (url.contains("https://") || url.contains("http://")) {
          // check line by line for three url type
          //for long url
          if (url.contains("youtube.com/watch?v=") && url.length > 38) {
            // for long link (valid id)
            String tempID = url.split("?v=")[1];
            if (tempID.length >= 11) {
              id = tempID.substring(0, 11);
              errorLog = null;
              errorDescription = null;
              urlType = "Full YouTube URL";
            } else {
              // length is smaller then 11
              setInvalidData();
            }
          } else {
            // for shorten url
            if (url.contains("youtu.be/") && url.length > 25) {
              // for shorten link (valid id)
              String tempID = url.split(".be/")[1];
              if (tempID.length >= 11) {
                id = tempID.substring(0, 11);
                errorLog = null;
                errorDescription = null;
                urlType = "Shorten YouTube URL";
              } else {
                // length is smaller then 11
                setInvalidData();
              }
            } else {
              //yor yt shorts
              if (url.contains("youtube.com/shorts/") && url.length > 30) {
                // for shorten link (valid id)
                String tempID = url.split("/shorts/")[1];
                if (tempID.length >= 11) {
                  id = tempID.substring(0, 11);
                  errorLog = null;
                  errorDescription = null;
                  urlType = "YouTube Shorts URL";
                } else {
                  // length is smaller then 11
                  setInvalidData();
                }
              } else {
                // for shorten link (invalid ID)
                id = null;
                errorLog = "Invalid URL";
                errorDescription = "Provided URL is Invalid";
                urlType = null;
              }
            }
          }
        } else {
          // if url doesnot contain http or https
          id = null;
          errorLog = "Invalid URL";
          errorDescription = "Provided URL should contain http:// or https://";
          urlType = null;
        }
      } else {
        // if url is empty
        id = null;
        errorLog = "Invalid URL";
        errorDescription = "Provided URL is Empty";
        urlType = null;
      }
    } catch (e) {
      // some error occured
      id = null;
      errorLog = "Unknown Error";
      errorDescription = e.toString();
      urlType = null;
    }
    return this;
  }

  setInvalidData() {
    id = null;
    errorLog = "Invalid Video ID";
    errorDescription = "Provided YouTube Video URL Contains Invalid Video ID";
    urlType = null;
  }
}
