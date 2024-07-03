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
    if(!isEnabled()) {
      return
    }

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

func isEnabled() -> Bool {
  if let value = Bundle.main.object(forInfoDictionaryKey: "RN_PREVENT_RECENT_SCREENSHOTS") as? Bool {
    return value
  }
  return false
}

func getTopViewController() -> UIViewController {    
    var topController: UIViewController = UIApplication.shared.windows.first!.rootViewController!
    
    while (topController.presentedViewController != nil) {
      topController = topController.presentedViewController!
    }
    
    return topController
}
