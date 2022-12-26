import SwiftUI

private struct SafeAreaInsetsEnvironmentKey: EnvironmentKey {
    static var defaultValue = EdgeInsets()
}

extension EnvironmentValues {
    var safeAreaInsets: EdgeInsets {
        get { self[SafeAreaInsetsEnvironmentKey.self] }
        set { self[SafeAreaInsetsEnvironmentKey.self] = newValue }
    }
}

struct SafeAreaReader<Content: View>: View {
    @ViewBuilder var content: () -> Content
    @State private var safeAreaInsets = EdgeInsets()
    
    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            GeometryReader { g in
                Color.clear
                    .onAppear {
                        safeAreaInsets = g.safeAreaInsets
                    }
                    .onChange(of: g.safeAreaInsets) { newValue in
                        safeAreaInsets = newValue
                    }
            }
            
            content()
                .environment(\.safeAreaInsets, safeAreaInsets)
        }
    }
}

struct SafeAreaReader_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaReader {
            SafeAreaValuesOverlay()
        }
        .previewDisplayName("Safe area reader with overlay")
    }
    
    private struct SafeAreaValuesOverlay: View {
        @Environment(\.safeAreaInsets) private var safeAreaInsets
        
        var body: some View {
            VStack {
                Text("Top: \(safeAreaInsets.top, format: .number)")
                
                Spacer()
                
                HStack {
                    Text("Leading: \(safeAreaInsets.leading, format: .number)")
                    
                    Spacer()
                    
                    Text("Trailing: \(safeAreaInsets.trailing, format: .number)")
                }
                
                Spacer()
                
                Text("Bottom: \(safeAreaInsets.bottom, format: .number)")
            }
        }
    }
}
