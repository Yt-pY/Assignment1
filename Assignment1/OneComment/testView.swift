import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            // 使用Image视图并提供内置图像的名称
            Image(systemName: "star") // 替换"imageName"为你实际的图像名称
                .resizable()
                .frame(width: 50, height: 50)
                .border(.black)
            Text("hello")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
