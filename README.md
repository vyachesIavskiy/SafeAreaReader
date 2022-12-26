# SafeAreaReader
This is a simple wrapper to read safe area of iOS app.

## Usage
You can wrap any view with `SafeAreaReader` to obtain a safe area of the current context. The best approach is to wrap the main view that is declared inside `<YouAppName>App.swift file`.

```swift
var body: some Scene {
    WindowGroup {
        SafeAreaReader {
            ContentView()
        }
    }
}
```

This wrapper will populate safe area insets inside `safeAreaInsets` environment variable.
