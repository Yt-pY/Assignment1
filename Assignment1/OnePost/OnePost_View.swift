import SwiftUI
import Foundation

struct OnePost_View: View {
    
    @StateObject var VM = OnePost_ViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                //帖子标题
                Text("标题")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom, 5)
                
                //帖子内容
                Text("正文内容正文内容正文内容正文内容正文内容正文内容正文内容正文内容正文内容正文内容正文内容！!1")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
                    .padding(.bottom)
                    .padding(.horizontal)
                
                //回复
                Text("回复 114")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .foregroundStyle(.purple)
                ForEach(VM.commentList) { comment in
                    OneComment_View(index: comment.id)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "heart")
                        VStack(alignment: .leading) {
                            Text("发布人")
                                .font(.body)
                            Text("最近更新于 昨天 11:45:14")
                                .font(.footnote)
                        }
                    }
                    .tint(.accentColor)
                }
            }
        }
    }
}

#Preview() {
    OnePost_View()
}
