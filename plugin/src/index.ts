import { ConfigPlugin } from "@expo/config-plugins";
import { PreventScreenshotsConfig } from "./types";
import withPreventRecentScreenshots from "./withPreventRecentScreenshots";

const withPreventScreenshots: ConfigPlugin<PreventScreenshotsConfig> = (
  config,
  props
) => {
  config = withPreventRecentScreenshots(config, props);

  return config;
};

export default withPreventScreenshots;

export type { PreventScreenshotsConfig };
