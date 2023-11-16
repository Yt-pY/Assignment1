import SwiftUI

struct OnePost_View: View {
    
    @StateObject var VM = OnePost_ViewModel()

    var body: some View {
        NavigationView {
            VStack {
                //List(VM.commentList) { comment in
                    
                ForEach(VM.commentList) { comment in
                    Text("\(comment.id)")
                    OneComment_View(comment: OnePost_ViewModel.Comment(
                            id: comment.id,
                            avatar: comment.avatar,
                            username: comment.username,
                            content: comment.content,
                            time: comment.time,
                            likes: comment.likes,
                            comments: comment.comments))
                    //}
                    /*Text(comment.username)
                    Text(comment.time)
                    Text(String(comment.likes))
                    Text(comment.content)
                        .onTapGesture {
                            VM.updateCommentList(comment: comment)
                                /*if isLoading {
                                    ProgressView("Loading...")
                                        .progressViewStyle(CircularProgressViewStyle())
                                }*/
                        }
                        .alert(isPresented: $VM.isLoading) {
                            Alert(title: Text("更改中..."))
                            //message: Text("Please wait...")
                            //dismissButton: .none
                        }
                     */
                }
            }
            .navigationBarTitle("Comments")
        }
    }
}
#Preview() {
    OnePost_View()
}
