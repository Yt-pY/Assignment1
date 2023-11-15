//
//  OnePost_ViewModel.swift
//  Assignment1
//
//  Created by lpy on 2023/11/15.
//

import SwiftUI

struct Comment: Identifiable {
    let id = UUID()
    var username: String
    var content: String
    var time: String
    var likes: Int
    var comments: Int
}

class OnePost_ViewModel: ObservableObject {

    @Published var isLoading = false
    
    @Published var commentList: [Comment] = [
        Comment(username: "User1", content: "Great post!", time: "10:00 AM", likes: 5, comments: 2),
        Comment(username: "User2", content: "Interesting discussion.", time: "11:30 AM", likes: 10, comments: 3),
        Comment(username: "User3", content: "I agree with you.", time: "1:45 PM", likes: 7, comments: 1)
    ]
    
    // 更新评论内容
    func updateCommentList(comment: Comment){
        isLoading = true
        // 异步获取更新数据
        Task {
            let updatedComment = await startIterator(comment: comment)
            
            // 主线程更新评论列表
            DispatchQueue.main.async {
                if let index = self.commentList.firstIndex(where: { $0.id == updatedComment.id }) {
                    self.commentList[index] = updatedComment
                }
                self.isLoading = false
            }
        }
    }
    
    // 异步获取更新数据
    func startIterator(comment: Comment) async -> Comment{
        var updatedComment = comment
        // 模拟数据加载，等待1秒
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        updatedComment.content += " UGUESS."
        return updatedComment
    }
}
