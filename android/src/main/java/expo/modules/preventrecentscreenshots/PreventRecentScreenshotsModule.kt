package expo.modules.preventrecentscreenshots

import expo.modules.kotlin.modules.Module
import expo.modules.kotlin.modules.ModuleDefinition

class PreventRecentScreenshotsModule : Module() {
  // Each module class must implement the definition function. The definition consists of components
  // that describes the module's functionality and behavior.
  // See https://docs.expo.dev/modules/module-api for more details about available components.
  override fun definition() = ModuleDefinition {
    // Sets the name of the module that JavaScript code will use to refer to the module. Takes a string as an argument.
    // Can be inferred from module's class name, but it's recommended to set it explicitly for clarity.
    // The module will be accessible from `requireNativeModule('PreventRecentScreenshots')` in JavaScript.
    Name("PreventRecentScreenshots")

    AsyncFunction("shouldPreventRecentScreenshot") { value: Boolean ->
     // Stubbed out as it is not needed here
    }
  }
}
