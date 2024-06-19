export type SetShouldPreventRecentScreenshot = (
  shouldPreventRecentScreenshot: boolean
) => Promise<void>;

export type PreventScreenshotsModuleType = {
  shouldPreventRecentScreenshot: SetShouldPreventRecentScreenshot;
};
