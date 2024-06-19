import ExpoModulesCore

public class AppLifecycleDelegate: ExpoAppDelegateSubscriber {
  private var splashScreenViewController: UIViewController?
  private var canShowSplashScreen = true

    
  public func applicationDidBecomeActive(_ application: UIApplication) {
    // The app has become active.
    splashScreenViewController?.dismiss(animated: false) {
      self.splashScreenViewController = nil
    }
  }

  public func applicationWillResignActive(_ application: UIApplication) {
      if splashScreenContext.getPreventRecentScreenshot() {
      if let launchScreen = UIStoryboard(name: "SplashScreen", bundle: nil).instantiateInitialViewController() {
        launchScreen.modalPresentationStyle = .overFullScreen
        getTopViewController().present(launchScreen, animated: false)
        splashScreenViewController = launchScreen
      }
    }
  }

  public func applicationDidEnterBackground(_ application: UIApplication) {
    // The app is now in the background.
  }

  public func applicationWillEnterForeground(_ application: UIApplication) {
    // The app is about to enter the foreground.
  }

  public func applicationWillTerminate(_ application: UIApplication) {
    // The app is about to terminate.
  }
}

func getTopViewController() -> UIViewController {    
    var topController: UIViewController = UIApplication.shared.windows.first!.rootViewController!
    
    while (topController.presentedViewController != nil) {
      topController = topController.presentedViewController!
    }
    
    return topController
}
