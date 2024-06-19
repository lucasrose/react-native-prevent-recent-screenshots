## React Native Prevent Recent Screenshots
This is an expo module which will prevent screenshots being taken when the application is backgrounded.

### Usage
- Android: import `import "react-native-prevent-recent-screenshots"`
- iOS, import `import PreventRecentScreenshots from "react-native-prevent-recent-screenshots";`, call `shouldPreventRecentScreenshot(true | false)` whenever this functionality needs to be disabled. The default behavior is set to true.
