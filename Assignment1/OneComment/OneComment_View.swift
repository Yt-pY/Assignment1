//
//  OneComment_View.swift
//  Assignment1
//
//  Created by lpy on 2023/11/15.
//

import SwiftUI

struct OneComment_View: View {
    
    @StateObject var VM = OnePost_ViewModel()
    
    /*struct Comment {
        var avatar: String
        var username: String
        var content: String
        var time: String
        var likes: Int
        var comments: Int
    }*/
    var comment: OnePost_ViewModel.Comment
    init(comment: OnePost_ViewModel.Comment) {
        self.comment = comment
    }
    
    /*var avatar: String
    var username: String
    var content: String
    var time: String
    var likes: Int
    var comments: Int*/
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            //头像和剩余部分
            Image(systemName: comment.avatar)
                .resizable()
                .frame(width: 30, height: 30)
                .border(.black)
            VStack(alignment: .leading) {
                //用户名，内容，和剩余部分
                Text(comment.username)
                    .font(.system(size: 18))
                    .foregroundColor(.purple)
                Text(comment.content)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(.bottom, 4)
                    .border(.black)
                    //异步更新
                    .onTapGesture {
                        VM.updateCommentList(comment: comment)
                    }
                    .alert(isPresented: $VM.isLoading) {
                        Alert(title: Text("更改中..."))
                    }
                HStack() {
                    //时间
                    Text(comment.time)
                        .foregroundStyle(.gray)
                        .font(.footnote)
                    Spacer()
                    //点赞和评论
                    HStack(spacing: 20) {
                        HStack {
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("\(comment.likes)")
                        }
                        HStack {
                            Image(systemName: "arrowshape.turn.up.left")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("\(comment.comments)")
                        }
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
        .border(Color.black)
        .padding(.horizontal, 10)
    }
}

#Preview {
    //OneComment_View(avatar:"star", username: "Test", content: "Test", time: "1小时前", likes: 10, comments: 10)
    OneComment_View(comment: OnePost_ViewModel.Comment(
                        id: 1, 
                        avatar: "star",
                        username: "Test",
                        content: "Test",
                        time: "1小时前",
                        likes: 10,
                        comments: 10
                    ))
}
