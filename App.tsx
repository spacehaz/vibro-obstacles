/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import { StatusBar, StyleSheet, useColorScheme, View, Text, Pressable } from 'react-native';
import {
  SafeAreaProvider,
  useSafeAreaInsets,
} from 'react-native-safe-area-context';
import ObstacleDetector from './specs/NativeObstacleDetector';
import { useState } from 'react';

function App() {
  const isDarkMode = useColorScheme() === 'dark';

  return (
    <SafeAreaProvider>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
      <AppContent />
    </SafeAreaProvider>
  );
}

function AppContent() {
  const [ isSupported, setIsSupported ] = useState<boolean>(true)

  return (
    <View style={styles.container}>
      <Text>HELLO WORLD: {isSupported}</Text>
      <Pressable onPress={() => {
        const isSupported = ObstacleDetector.isLidarSupported()
        setIsSupported(isSupported)
      }}>
        <Text style={styles.button}>PRESS ME {isSupported ? "TRUE" : "FALSE"}</Text>
      </Pressable>

    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center"
  },
  button: {
    color: '#000'
  }
});

export default App;
