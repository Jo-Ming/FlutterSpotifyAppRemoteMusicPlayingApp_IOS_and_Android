abstract class MotivSpotifyInterface {
  // function used to connect to requered spotify remote.
  Future connectToAppRemote();

  // This call will return the required spotify token for authentication.
  Future<String> getAccessToken();

  // This is used to play a song on spotify using the devices nativ player.
  void playSong(String trackID);

  // Will pause the devices native plater.
  void pauseSong();
}
