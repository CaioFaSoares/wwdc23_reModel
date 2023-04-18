//
//  File.swift
//  
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation
import SwiftUI

struct firstPaitingView: View {
	
	@ObservedObject var coordinator = conversationsCoordinator()
	
	var body: some View {
		ZStack {
			firstPaintingRepresentable(coordinator: coordinator)
				.ignoresSafeArea()
				.disabled(coordinator.isCanvasBlocked)
			VStack {
				Spacer()
				ZStack {
					Color(.black)
						.opacity(0.25)
						.padding(.all)
						.cornerRadius(CGFloat.pi)
					VStack {
						ChatFactory(coordinator: coordinator)
						Spacer()
						HStack {
							Spacer()
							ReverseChatButton(coordinator: coordinator)
							Text("\(coordinator.conversationIndex + 1) | \(coordinator.currentChat.count)")
							ChatButton(coordinator: coordinator)
							Spacer()
						}
					}
					.padding(.all)
				}.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/4)
			}
			.hiddenNavigationBarStyle()
		}
	}
}

struct ChatButton: View {
	
	@ObservedObject var coordinator: conversationsCoordinator
	
	var body: some View {
		if coordinator.isForwardBlocked == false && coordinator.currentGameState != .painting {
			Button {
				if coordinator.conversationIndex != coordinator.currentChat.count - 1 {
					coordinator.conversationIndex += 1
					coordinator.isBackwardBlocked = false
					if coordinator.conversationIndex == coordinator.currentChat.count - 1 {
						coordinator.isForwardBlocked = true
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

struct ReverseChatButton: View {
	
	@ObservedObject var coordinator: conversationsCoordinator
	
	var body: some View {
		if coordinator.isBackwardBlocked == false && coordinator.currentGameState != .painting {
			Button {
				if coordinator.conversationIndex != 0 {
					coordinator.conversationIndex -= 1
					if coordinator.conversationIndex == 0 {
						coordinator.isBackwardBlocked = true
					}
				}
			} label: {
				Image(systemName: "arrowshape.left.fill")
					.font(.title)
					.foregroundColor(.black)
			}
			.padding(.all)
		} else {
			Button {
				
			} label: {
			Image(systemName: "arrowshape.left")
				.font(.title)
				.foregroundColor(.black)
			}
			.padding(.all)
		}
	}
}

struct ChatFactory: View {
	
	@ObservedObject var coordinator: conversationsCoordinator
	
	var body: some View {
		VStack {
			switch coordinator.currentChat[coordinator.conversationIndex].2 {
			case .normalChat:
				HStack {
					Text(coordinator.currentChat[coordinator.conversationIndex].1)
						.font(.title)
						.foregroundColor(.black)
						.padding(.all)
						.italic()
						.bold()
					Spacer()
				}
				HStack {
					Text(coordinator.currentChat[coordinator.conversationIndex].0)
						.font(.title2)
						.foregroundColor(.black)
						.padding(.horizontal)
						.multilineTextAlignment(.leading)
					Spacer()
				}
			case .question:
				HStack {
					Button("\(coordinator.currentChat[coordinator.conversationIndex].0)") {
						coordinator.afterChattingHasEndedProcessAnswer(choice: .answerTA, currentPhase: coordinator.currentPhase)
					}	.buttonStyle(.bordered)
						.font(.title)
						.multilineTextAlignment(.center)
						.foregroundColor(.black)
						.tint(.orange)
						.padding(.all)
					Button("\(coordinator.currentChat[coordinator.conversationIndex].1)") {
						coordinator.afterChattingHasEndedProcessAnswer(choice: .answerTB, currentPhase: coordinator.currentPhase)
					}	.buttonStyle(.bordered)
						.multilineTextAlignment(.center)
						.font(.title)
						.foregroundColor(.black)
						.tint(.blue)
						.padding(.all)
				}.frame(alignment: .top)
			case .emptyChat:
				Text("...")
					.font(.title)
					.foregroundColor(.black)
					.padding(.all)
			case .promptToDraw:
				VStack {
					Text(coordinator.currentChat[coordinator.conversationIndex].0)
						.font(.title)
						.foregroundColor(.black)
						.padding(.all)
					Button(coordinator.currentChat[coordinator.conversationIndex].1) {
						
					}	.buttonStyle(.bordered)
						.multilineTextAlignment(.center)
						.font(.title)
						.foregroundColor(.black)
						.tint(.blue)
						.padding(.all)
				}.task {
					coordinator.afterAnsweringHasEndedPrepareStroke()
				}
			}
		}
	}
 }
