import { requireNativeModule } from "expo-modules-core";
import { PreventScreenshotsModuleType } from "./PreventRecentScreenshotsProps.types";

// It loads the native module object from the JSI or falls back to
// the bridge module (from NativeModulesProxy) if the remote debugger is on.
const PreventRecentScreenshotsModule = requireNativeModule(
  "PreventRecentScreenshots"
);

export async function setCanShowSplashScreen() {
  return await PreventRecentScreenshotsModule.asyncFunction(
    "setCanShowSplashScreen"
  );
}

export default PreventRecentScreenshotsModule;
