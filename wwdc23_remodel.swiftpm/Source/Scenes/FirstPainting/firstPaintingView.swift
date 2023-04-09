//
//  File.swift
//  
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation
import SwiftUI

struct firstPaitingView: View {
	
	@State var changingBackgroundColor: UIColor = .systemPink
	@State var conversationIndex: Int = 0
	@State var chatBlocked: Bool = false
	@State var choiceOffered: Bool = false
	
	var body: some View {
		ZStack {
			firstPaintingRepresentable(backgroundColor: $changingBackgroundColor)
				.ignoresSafeArea()
			VStack {
				Spacer()
				ZStack {
					Color(.black)
						.opacity(0.25)
						.padding(.all)
					VStack {
						ChatFactory(conversationIndex: $conversationIndex)
						Spacer()
						HStack {
							Spacer()
							ChatButton(chatBlocked: $chatBlocked, conversationIndex: $conversationIndex, choiceOffered: $choiceOffered)
						}
					}
					.padding(.all)
				}.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
			}
			.hiddenNavigationBarStyle()
		}
	}
}

struct ChatButton: View {
	
	@Binding var chatBlocked: Bool
	@Binding var conversationIndex: Int
	@Binding var choiceOffered: Bool
	
	var body: some View {
		if chatBlocked == false {
			Button {
				if conversationIndex != chat1.count - 1 {
					conversationIndex += 1
					if conversationIndex == chat1.count - 1 {
						chatBlocked = true
					}
				}
			} label: {
				Image(systemName: "arrowshape.right.fill")
					.font(.title)
					.foregroundColor(.black)
			}
			.padding(.all)
		} else {
			Button {
				
			} label: {
			Image(systemName: "arrowshape.right")
				.font(.title)
				.foregroundColor(.black)
			}
			.padding(.all)
		}
	}
}

struct ChatFactory: View {
	
	@Binding var conversationIndex: Int
	var body: some View {
		VStack {
			HStack {
				Text(chat1[conversationIndex].1)
					.font(.title)
					.foregroundColor(.black)
					.padding(.all)
					.italic()
					.bold()
				Spacer()
			}
			HStack {
				Text(chat1[conversationIndex].0)
					.font(.title2)
					.foregroundColor(.black)
					.padding(.horizontal)
					.multilineTextAlignment(.leading)
				Spacer()
			}
		}
	}
	
}
