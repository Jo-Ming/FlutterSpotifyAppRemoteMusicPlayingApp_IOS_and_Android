import UIKit
import Flutter
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, SPTSessionManagerDelegate, SPTAppRemoteDelegate, SPTAppRemotePlayerStateDelegate {
    
    //pass these in if you want
    let SpotifyClientID = "Spotify CLient Id"
    let SpotifyRedirectURL = URL(string: "Runner://")!
    var accessToken: String?
    var refreshToken: String?
    
    lazy var configuration = SPTConfiguration(
          clientID: SpotifyClientID,
          redirectURL: SpotifyRedirectURL
        )

        lazy var sessionManager: SPTSessionManager = {
            print("Initialize sessionmanager")
            if let tokenSwapURL = URL(string: "https://accounts.spotify.com/api/token"),
               let tokenRefreshURL = URL(string: "https://accounts.spotify.com/api/refresh_token") {
                self.configuration.tokenSwapURL = tokenSwapURL
                self.configuration.tokenRefreshURL = tokenRefreshURL
                self.configuration.playURI = ""
            }
            let manager = SPTSessionManager(configuration: self.configuration, delegate: self)
            return manager
        }()

        lazy var appRemote: SPTAppRemote = {
            debugPrint("Stp remote activateeeeee")
            let appRemote = SPTAppRemote(configuration: self.configuration, logLevel: .debug)
            debugPrint([SPTAppRemoteAccessTokenKey])
            debugPrint(appRemote.authorizationParameters)
            appRemote.connectionParameters.accessToken = ""
            appRemote.delegate = self
            debugPrint("stp remote created.")
            debugPrint(appRemote)
            return appRemote
        }()
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        
        let motivMethodChannel = FlutterMethodChannel(
            name: "com.ifloops.motiv/iOSChannel", binaryMessenger: controller.binaryMessenger)
        
        motivMethodChannel.setMethodCallHandler({(call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch call.method {
            case "connectToSpotifyAppRemote":
                self.connectSpotifyAppRemote()
                result(true) // Return success to the Flutter side             
            case "playSpotifySong":
                guard let args = call.arguments as? [String: String],
                      let trackID = args["trackID"] else {
                    result(FlutterError(code: "INVALID_ARGS",
                                        message: "Invalid arguments for playSpotifySong",
                                        details: nil))
                    return
                }
                debugPrint("TrackID: " + trackID)
                self.playSpotifySong(trackID: trackID)
                result(true)
            case "getCurrentAccessToken":
                result(self.getCurrentAccessToken())
            case "getCurrentRefreshToken":
                result(self.getCurrentRefreshToken())
            default:
                result(FlutterMethodNotImplemented)
            }
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    // this is the callback funcitonality i.e where we are redirected to after spotify auth.
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        debugPrint("Application 2 session manager")
        self.sessionManager.application(app, open: url, options: options)
        debugPrint("Done.")
        debugPrint(self.sessionManager)
        
        debugPrint("Can application get access token?")
        if let parameters = appRemote.authorizationParameters(from: url) {
            debugPrint(parameters)
            if let accessToken = parameters["access_token"] {
                appRemote.connectionParameters.accessToken = accessToken
                self.accessToken = accessToken
            } else if let code = parameters["code"] {
                let accessToken = getAccessToken(code)
                appRemote.connectionParameters.accessToken = accessToken
                self.accessToken = accessToken
            }
        }
        return true
    }
    
    private func connectSpotifyAppRemote() {
        debugPrint("Connect Spotify Remote called.")
        debugPrint("Initiating session")
        
        let requestedScopes: SPTScope = [
            .appRemoteControl,
            .userReadPrivate,
            .playlistReadPrivate,
            .userReadPlaybackState,
            .userModifyPlaybackState,
            .userReadCurrentlyPlaying,
            .appRemoteControl,
            .userReadRecentlyPlayed
        ]
        
        self.sessionManager.initiateSession(with: requestedScopes, options: .default)
        debugPrint("Session started")
        debugPrint(self.sessionManager.initiateSession(with: requestedScopes, options: .default))
    }
    
    private func playSpotifySong(trackID: String) {
        debugPrint("play song is called")
        debugPrint(trackID)
        self.appRemote.playerAPI?.play(trackID, callback: { (result, error) in
        if let error = error {
            debugPrint(error.localizedDescription)
        }
        })
    }
    private func getCurrentAccessToken() -> String? {
        return accessToken;
    }
    
    private func getCurrentRefreshToken() -> String? {
        return refreshToken;
    }
    
    func sessionManager(manager: SPTSessionManager, didFailWith error: Error) {
            debugPrint(error)
        }
        
    func sessionManager(manager: SPTSessionManager, didInitiate session: SPTSession) {
            debugPrint(session)
        }
        
        func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
            debugPrint("connected")
            debugPrint("App remote did establish connection starting...")
            self.appRemote.playerAPI?.delegate = self
            self.appRemote.playerAPI?.subscribe(toPlayerState: { (result, error) in
                if let error = error {
                    debugPrint(error.localizedDescription)
                }
            })
            debugPrint("Pre wait for music play")
            //DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            // Put your code which should be executed with a delay here
            // Want to play a new track?
                self.appRemote.playerAPI?.play("", callback: { (result, error) in
                if let error = error {
                    debugPrint(error.localizedDescription)
                }
                })
            //}
            //debugPrint("music playing...")
        }
        
        func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
            debugPrint("disconnected")
        }
        
        func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
            debugPrint("failed")
        }

        func playerStateDidChange(_ playerState: SPTAppRemotePlayerState) {
            debugPrint("player state changed")
            debugPrint("isPaused", playerState.isPaused)
            debugPrint("track.uri", playerState.track.uri)
            debugPrint("track.name", playerState.track.name)
            debugPrint("track.imageIdentifier", playerState.track.imageIdentifier)
            debugPrint("track.artist.name", playerState.track.artist.name)
            debugPrint("track.album.name", playerState.track.album.name)
            debugPrint("track.isSaved", playerState.track.isSaved)
            debugPrint("playbackSpeed", playerState.playbackSpeed)
            debugPrint("playbackOptions.isShuffling", playerState.playbackOptions.isShuffling)
            debugPrint("playbackOptions.repeatMode", playerState.playbackOptions.repeatMode.hashValue)
            debugPrint("playbackPosition", playerState.playbackPosition)
        }
        
    override func applicationWillResignActive(_ application: UIApplication) {
            // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
            // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
            debugPrint("Application will resign active.")
            if self.appRemote.isConnected {
                debugPrint("Calling disconnect")
                self.appRemote.disconnect()
                debugPrint("Disconnected.")
            }
        }

    override func applicationDidEnterBackground(_ application: UIApplication) {
            // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
            // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        }

    override func applicationWillEnterForeground(_ application: UIApplication) {
            // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        }

    override func applicationDidBecomeActive(_ application: UIApplication) {
            // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
            debugPrint("Did become active?")
            if let _ = self.appRemote.connectionParameters.accessToken {
              debugPrint("inside if statement.")
              self.appRemote.connect()
            }
            debugPrint("Did become active end.")
        }

    override func applicationWillTerminate(_ application: UIApplication) {
            // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        }

        func debugPrintProperties(_ object: Any) {
          var properties = [String: Any]()
          Mirror(reflecting: object).children.forEach { (child) in
              if let property = child.label {
                  properties[property] = child.value
              }
          }

          debugPrint(object)
          debugPrint(type(of: object))
          debugPrint(properties)
      }

        func getAccessToken(_ code: String) -> String{
            var semaphore = DispatchSemaphore (value: 0)
            let parameters = "grant_type=authorization_code&code=" + code + "&redirect_uri=Runner%3A%2F%2F"
            let postData =  parameters.data(using: .utf8)

            var request = URLRequest(url: URL(string: "https://accounts.spotify.com/api/token")!,timeoutInterval: Double.infinity)
            var b64encodedcidsecret = "MGNmNTBkNTEzZTRkNGUyNGEyMjZiMmVmNGE1YzdmMTg6ZjAxNDA5ODhkYjFjNDJmYTkyZGJjMzIzZmViN2YxMDA=";
            request.addValue("Basic " + b64encodedcidsecret, forHTTPHeaderField: "Authorization")
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            //request.addValue("__Host-device_id=AQDYES6tA616MMjYwcnY5MabCX7zNF3K66rcXVQoOqJzXizW1EPhwgWEUC8FPnJmlPsIvAq4tn2PH0i1Nkv0rwXs_mP8V6MStzE; __Secure-TPASESSION=AQBkvXdeyC5Jwaq0V5kUZOHYxvCH8WwA0uP3J+I9Vk6GfrR7GckF8WC0gvUGHlnV9OwoPzoVUTu+krh+lpHU3T8cnYA0ardRBw4=; sp_sso_csrf_token=013acda719f5742bc0f51c1caa61d9ea4b86f03ee531363732333332373834353738; sp_tr=false", forHTTPHeaderField: "Cookie")

            request.httpMethod = "POST"
            request.httpBody = postData

            var accessToken = ""
            var refreshToken = ""

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                debugPrint(String(describing: error))
                semaphore.signal()
                return
            }
            debugPrint(String(data: data, encoding: .utf8)!)
            let youVirgin = String(data: data, encoding: .utf8)!
            debugPrint(youVirgin)
            let responseDict = self.convertStringToDictionary(youVirgin)!
            debugPrint("inside task")
            debugPrint((responseDict["access_token"]!))
            accessToken = String(describing: responseDict["access_token"]!)
            refreshToken = String(describing: responseDict["refresh_token"]!)

            semaphore.signal()
            }

            task.resume()
            semaphore.wait()
            debugPrint("outside task")
            debugPrint(accessToken)
            self.accessToken = accessToken
            self.refreshToken = refreshToken
            return accessToken
            
        }
        func convertStringToDictionary(_ text: String) -> [String:AnyObject]? {
            if let data = text.data(using: .utf8) {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                    return json
                } catch {
                    debugPrint("Something went wrong")
                }
            }
            return nil
    }
}
