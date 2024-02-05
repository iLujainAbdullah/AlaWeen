//
//  CommentView.swift
//  MC3Project
//
//  Created by Hasna Ahmad on 16/07/1445 AH.
//

import SwiftUI

struct CommentView: View {
    @State private var newComment: String = ""
    
    @State private var comments: [Comment] = [
        Comment(userName: "User1", userImage: "person", text: "Comment 1"),
        Comment(userName: "User2", userImage: "person", text: "Commbnmjbjbj nmb .bjbbmnbnb,mb,jb,jjb,vhvnjbmnjkbhhbhjbbvjhvgvhjbvbjhjbent 2"),
        Comment(userName: "User3", userImage: "person", text: "Comment 3")
    ]

    var body: some View {
        VStack {

            HStack{

                Button(action: {
                    self.addComment()
                }) {
                    Text("إضافة")
                        .foregroundColor(Color("OurPurple"))
               
                }
                
                TextField("اترك تعليقًا", text: $newComment)
                    .multilineTextAlignment(TextAlignment.trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
            }
            
            List(comments.indices, id: \.self) { index in
                CommentRow(
                    userImage: comments[index].userImage,
                    userName: comments[index].userName,
                    text: comments[index].text
                )
                .listRowSeparator(.hidden)
                
            }.listStyle(PlainListStyle())
                



            Spacer() // Add Spacer to push content to the top of the screen
            
        }

        .padding()
    }

    func addComment() {
        // Add the new comment to the list
        comments.append(Comment(userName: "New User", userImage: "newUser", text: newComment))
        // Clear the text field
        newComment = ""
    }
}




#Preview {
    CommentView()
}
