import PreventRecentScreenshots from "./PreventRecentScreenshotsModule";
import { PreventScreenshotsModuleType } from "./PreventRecentScreenshotsProps.types";
import { Platform } from "react-native";

export default {
  shouldPreventRecentScreenshot: Platform.select({
    ios: PreventRecentScreenshots.shouldPreventRecentScreenshot,
    default: () => Promise.resolve(),
  }),
} as PreventScreenshotsModuleType;
