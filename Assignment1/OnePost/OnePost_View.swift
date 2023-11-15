import SwiftUI

struct OnePost_View: View {
    
    @StateObject var viewmodel = OnePost_ViewModel()

    var body: some View {
        NavigationView {
            List(viewmodel.commentList) { comment in
                VStack {
                    Text(comment.username)
                    Text(comment.time)
                    Text(String(comment.likes))
                    Text(comment.content)
                        .onTapGesture {
                            viewmodel.updateCommentList(comment: comment)
                                /*if isLoading {
                                    ProgressView("Loading...")
                                        .progressViewStyle(CircularProgressViewStyle())
                                }*/
                        }
                        .alert(isPresented: $viewmodel.isLoading) {
                            Alert(title: Text("更改中..."))
                            //message: Text("Please wait...")
                            //dismissButton: .none
                        }
                }
            }
            .navigationBarTitle("Comments")
        }
    }
}
#Preview() {
    OnePost_View()
}
