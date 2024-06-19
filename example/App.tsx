import { Button, Platform, StyleSheet, Text, View } from "react-native";
import PreventRecentScreenshots from "react-native-prevent-recent-screenshots";

export default function App() {
  return (
    <View style={styles.container}>
      {Platform.OS === "ios" ? (
        <>
          <Button
            onPress={() =>
              PreventRecentScreenshots.shouldPreventRecentScreenshot(true)
            }
            title="Hide splash screen"
          />
          <Button
            onPress={() =>
              PreventRecentScreenshots.shouldPreventRecentScreenshot(false)
            }
            title="Don't hide splash screen"
          />
        </>
      ) : (
        <Text>Try to screenshot me</Text>
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
