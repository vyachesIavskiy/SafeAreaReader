# SafeAreaReader
This is a simple wrapper to read safe area of iOS app.

## Usage
You can wrap any view with `SafeAreaReader` to obtain a safe area of the current context. The best approach is to wrap the main view that is declared inside `<YouAppName>App.swift file`.

```swift
@main
struct SafeAreaReaderApp: App {
    var body: some Scene {
        WindowGroup {
            SafeAreaReader {
                ContentView()
            }
        }
    }
}

struct ContentView: View {
    @Environment(\.safeAreaInsets) var safeAreaInsets
    
    var body: some View {
        Text("Top safe area inset: \(safeAreaInsets.top)")
    }
}
```

This wrapper will populate safe area insets inside `safeAreaInsets` environment variable.
