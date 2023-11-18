//
//  OnePost_ViewModel.swift
//  Assignment1
//
//  Created by lpy on 2023/11/15.
//

import SwiftUI
/*
struct Comment: Identifiable {
    let id = UUID()
    var avatar: String
    var username: String
    var content: String
    var time: String
    var likes: Int
    var comments: Int
}*/

class OnePost_ViewModel: ObservableObject {

    
    struct Comment: Identifiable {
        var id: Int
        var avatar: String
        var username: String
        var content: String
        var time: String
        var likes: Int
        var comments: Int
    }
    
    @Published var isLoading = false
    
    @Published var commentList: [Comment] = [
        Comment(id: 0,avatar: "star", username: "用户1", content: "Hello World", time: "昨天 10:00", likes: 1, comments: 1),
        Comment(id: 1, avatar: "heart", username: "用户2", content: "Hello Swift", time: "昨天 10:10", likes: 9, comments: 0),
        Comment(id: 2,avatar: "circle", username: "用户3", content: "楼上好帅，cpdd", time: "昨天 13:45", likes: 1, comments: 0),
        Comment(id: 3, avatar: "square", username: "用户4", content: "你说的对，但是《原神》是由米哈游自主研发的一款全新开放世界冒险游戏。游戏发生在一个被称作「提瓦特」的幻想世界，在这里，被神选中的人将被授予「神之眼」，导引元素之力。你将扮演一位名为「旅行者」的神秘角色，在自由的旅行中邂逅性格各异、能力独特的同伴们，和他们一起击败强敌，找回失散的亲人——同时，逐步发掘「原神」的真相。", time: "今天 0:00", likes: 9, comments: 0),
        Comment(id: 4, avatar: "checkmark", username: "用户5", content: "我超，原", time: "今天 0:01", likes: 8, comments: 0),
        Comment(id: 5, avatar: "plus", username: "用户6", content: "Interesting discussion.", time: "11:45 AM", likes: 1, comments: 0),
        Comment(id: 6, avatar: "minus", username: "用户7", content: "有趣的讨论", time: "今天 19:19", likes: 0, comments: 0),
        Comment(id: 7, avatar: "person", username: "用户8", content: "抽象的评论", time: "今天 23:23", likes: 1919810, comments: 0)
    ]
    
    // 更新评论内容
    func updateCommentList(index: Int){
        
        isLoading = true
        // 异步获取更新数据
        Task {
            let updatedComment = await startIterator(comment: commentList[index])
            // 主线程更新评论列表
            //await Task.yield()
            DispatchQueue.main.async {
                //if let index = self.commentList.firstIndex(where: { $0.id == updatedComment.id }) {
                    //print(updatedComment.content)
                    self.commentList[index] = updatedComment
                    //print(self.commentList[index].content)
                //}
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
