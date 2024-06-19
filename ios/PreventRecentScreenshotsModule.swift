import ExpoModulesCore

public class PreventRecentScreenshotsModule: Module {
  weak var delegate: PreventRecentScreenshotDelegate?

  // Each module class must implement the definition function. The definition consists of components
  // that describes the module's functionality and behavior.
  // See https://docs.expo.dev/modules/module-api for more details about available components.
  public func definition() -> ModuleDefinition {
    // Sets the name of the module that JavaScript code will use to refer to the module. Takes a string as an argument.
    // Can be inferred from module's class name, but it's recommended to set it explicitly for clarity.
    // The module will be accessible from `requireNativeModule('PreventRecentScreenshots')` in JavaScript.
    Name("PreventRecentScreenshots")
      
    AsyncFunction("shouldPreventRecentScreenshot") { (value: Bool) in
      splashScreenContext.shouldPreventRecentScreenshot(value)
    }
  }
}

public class PreventRecentScreenshot: PreventRecentScreenshotDelegate {
    private var preventsRecentScreenshot = true

    func getPreventRecentScreenshot() -> Bool {
        return self.preventsRecentScreenshot
    }
    
    func shouldPreventRecentScreenshot(_ canShow: Bool) {
      self.preventsRecentScreenshot = canShow
    }
}

let splashScreenContext = PreventRecentScreenshot()

protocol PreventRecentScreenshotDelegate: AnyObject {
  func shouldPreventRecentScreenshot(_ canShow: Bool)
  func getPreventRecentScreenshot() -> Bool
}
