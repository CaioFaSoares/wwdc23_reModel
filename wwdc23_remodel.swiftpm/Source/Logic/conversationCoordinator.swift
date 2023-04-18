//
//  File.swift
//  
//
//  Created by Caio Soares on 17/04/23.
//

import Foundation

class conversationsCoordinator: ObservableObject {
	
	@Published var isForwardBlocked: Bool = false
	@Published var isBackwardBlocked: Bool = true
	@Published var isCanvasBlocked: Bool = true
	
	@Published var currentGameState: gameStates = .chatting
	
	@Published var conversationIndex: Int = 0
	
	@Published var collectionOfChats = chatsManager()
	@Published var currentPhase: phase = .q1
	@Published var currentChat: [(String, String, typeOfChat)] = chat1
	
	@Published var strokeSwitch: Bool = false
	
	@Published var answers: [answerArchetypes] = []
	@Published var timesPlayerAnswered = 1
	
	@Published var colors = strokeColors()
	
	var endingDialogueNext: Bool = false
	
	var updatePhase: ((phase) -> Void)?
	
}

extension conversationsCoordinator {
	
	func afterAnsweringHasEndedPrepareStroke() {
		self.isCanvasBlocked = false
		self.currentGameState = .painting
	}
	
	func afterPaintingPrepareNextDialogue() {
		
		switch currentPhase {
		case .q1:
			self.currentPhase = .q2
			self.currentGameState = .chatting
			self.isCanvasBlocked = true
			conversationIndex = 0
			currentChat = collectionOfChats.defaultChats[1]
			releaseChatBinders()
		case .q2:
			self.currentPhase = .q3
		case .q3:
			self.currentPhase = .q4
		case .q4:
			endingDialogueNext = true
		}
	}
	
	func releaseChatBinders() {
		self.conversationIndex = 0
		self.isBackwardBlocked = true
		self.isForwardBlocked = false
	}
	
	func afterChattingHasEndedProcessAnswer(choice: answerOptions, currentPhase: phase) {
		switch choice {
		case .answerTA:
			switch currentPhase {
			case .q1:
				currentChat = collectionOfChats.contextualChats[0]
				answers.append(.q1_welcoming)
				releaseChatBinders()
				self.currentGameState = .answering
			case .q2:
				currentChat = collectionOfChats.contextualChats[2]
				answers.append(.q2_content)
				releaseChatBinders()
				self.currentGameState = .answering
			case .q3:
				currentChat = collectionOfChats.contextualChats[4]
				answers.append(.q3_optimistic)
				releaseChatBinders()
				self.currentGameState = .answering
			case .q4:
				currentChat = collectionOfChats.contextualChats[6]
				answers.append(.q4_socialHappiness)
				releaseChatBinders()
				self.currentGameState = .answering
			}
		case .answerTB:
			switch currentPhase {
			case .q1:
				currentChat = collectionOfChats.contextualChats[1]
				answers.append(.q1_distant)
				releaseChatBinders()
				self.currentGameState = .answering
			case .q2:
				currentChat = collectionOfChats.contextualChats[3]
				answers.append(.q2_dissatisfied)
				releaseChatBinders()
				self.currentGameState = .answering
			case .q3:
				currentChat = collectionOfChats.contextualChats[5]
				answers.append(.q3_cautious)
				releaseChatBinders()
				self.currentGameState = .answering
			case .q4:
				currentChat = collectionOfChats.contextualChats[7]
				answers.append(.q4_achievments)
				releaseChatBinders()
				self.currentGameState = .answering
			}
		}
		
	}
}
