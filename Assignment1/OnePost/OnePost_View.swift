import SwiftUI

struct OnePost_View: View {
    
    @StateObject var VM = OnePost_ViewModel()

    var body: some View {
        NavigationView {
            VStack {
                //List(VM.commentList) { comment in
                    
                ForEach(VM.commentList) { comment in
                    //Text("\(comment.id)")
                    OneComment_View(index: comment.id)
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
