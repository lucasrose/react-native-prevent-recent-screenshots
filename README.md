## React Native Prevent Recent Screenshots
This is an expo module which will prevent screenshots being taken when the application is backgrounded.


### Installation
1. Install `yarn install react-native-prevent-recent-screenshots`
2. Run expo prebuild `npx expo prebuild`

### Usage
- Android: import `import "react-native-prevent-recent-screenshots"`
- iOS, import `import PreventRecentScreenshots from "react-native-prevent-recent-screenshots";`, call `shouldPreventRecentScreenshot(true | false)` whenever this functionality needs to be disabled. The default behavior is set to true.
