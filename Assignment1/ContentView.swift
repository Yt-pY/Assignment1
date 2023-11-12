import SwiftUI

struct Comment: Identifiable {
    var id = UUID()
    var username: String
    var content: String
    var time: String
    var likes: Int
    var comments: Int
}

struct ContentView: View {
    
    @State private var isLoading = false
    
    @State private var commentList: [Comment] = [
        Comment(username: "User1", content: "Great post!", time: "10:00 AM", likes: 5, comments: 2),
        Comment(username: "User2", content: "Interesting discussion.", time: "11:30 AM", likes: 10, comments: 3),
        Comment(username: "User3", content: "I agree with you.", time: "1:45 PM", likes: 7, comments: 1)
    ]

    var body: some View {
        NavigationView {
            List(commentList) { comment in
                VStack {
                    Text(comment.username)
                    Text(comment.time)
                    Text(String(comment.likes))
                    Text(comment.content)
                        .onTapGesture {
                            Task {
                                await startIterator(for: comment)
                                /*if isLoading {
                                    ProgressView("Loading...")
                                        .progressViewStyle(CircularProgressViewStyle())
                                }*/
                            }
                        }
                }
                .alert(isPresented: $isLoading) {
                    Alert(title: Text("更改中..."))
                    //message: Text("Please wait...")
                    //dismissButton: .none
                }
            }
            .navigationBarTitle("Comments")
        }
    }

    func startIterator(for comment: Comment) async {
        // 在异步线程中更新评论内容
        //await Task.sleep(nanoseconds: 1_000_000_000)
        
        isLoading = true
        // 模拟异步操作，等待1秒后关闭加载框
        
        await Task.sleep(1_000_000_000)
        
        var updatedComment = comment
        updatedComment.content += " UGUESS"
        
        // 使用 @State 更新评论列表
        if let index = commentList.firstIndex(where: { $0.id == updatedComment.id }) {
                commentList[index] = updatedComment
        }
        
        isLoading = false
    }

    func updateCommentList(_ comment: Comment) {
        // 使用 @State 更新评论列表
        if let index = commentList.firstIndex(where: { $0.id == comment.id }) {
            commentList[index] = comment
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView1: View {
    var body: some View {
        ContentView()
    }
}

// 使用Playground中的Live View来预览
