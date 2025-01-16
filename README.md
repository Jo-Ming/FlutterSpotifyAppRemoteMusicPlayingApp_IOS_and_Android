# Motiv

A while ago I was working on a project for group controlled music streaming application because Spotify party sucks. Spotify doesn't let you monetise their API anymore, SoundCloud has been closed to new developer applications for 3 years and Apple Music.... well who uses it?

Anyway, I saw online countless people unable to authenticate the Spotify app remote for iOS and I couldn't find any for Flutter anywhere. Even the flutter library only works for android. So I created some native Swift code and a flutter method handles to call native code in Flutter which fixes this. This application has full Spotify API functionality, searching for songs, get playlists, songs, play and pause music etc. even adding to queue and such. Look at my Spotify testing service or my music demo screen for examples on how to authenticate and initialise the app remote as well as an interface that ties these together for android and iOS.

You will need your own Spotify client ID and API tokens etc.
Also on spotify Auth I was using different redirect Urls.
IOS_REDIRECT_URL=Runner://

ANDROID_REDIRECT_URL=http://localhost:5000/callback

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
