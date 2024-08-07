import {
  ConfigPlugin,
  withInfoPlist,
  withGradleProperties,
} from "@expo/config-plugins";
import { PreventScreenshotsConfig } from "./types";

const withPreventRecentScreenshots: ConfigPlugin<PreventScreenshotsConfig> = (
  config,
  props
) => {
  config = withInfoPlist(config, (config) => {
    const infoPlist = config.modResults;

    const isEnabled = props?.ios?.enabled ?? false;

    if (!isEnabled) {
      delete infoPlist.RN_PREVENT_RECENT_SCREENSHOTS;
      return config;
    }

    infoPlist.RN_PREVENT_RECENT_SCREENSHOTS = true;

    return config;
  });

  config = withGradleProperties(config, (config) => {
    const gradleProperties = config.modResults;

    const isEnabled = props?.android?.enabled ?? false;

    const existingIndex = gradleProperties.findIndex(
      (prop) =>
        prop.type === "property" && prop.key === "RN_PREVENT_RECENT_SCREENSHOTS"
    );
    if (existingIndex !== -1) {
      gradleProperties.splice(existingIndex, 1);
    }

    if (!isEnabled) {
      return config;
    }

    gradleProperties.push({
      type: "property",
      key: "RN_PREVENT_RECENT_SCREENSHOTS",
      value: "true",
    });

    return config;
  });

  return config;
};

export default withPreventRecentScreenshots;
