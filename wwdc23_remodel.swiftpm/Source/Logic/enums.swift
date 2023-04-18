//
//  File.swift
//  
//
//  Created by Caio Soares on 17/04/23.
//

import Foundation

enum answerOptions {
	case answerTA
	case answerTB
}

enum answerArchetypes {
	case q1_welcoming
	case q1_distant
	case q2_content
	case q2_dissatisfied
	case q3_optimistic
	case q3_cautious
	case q4_socialHappiness
	case q4_achievments
}

enum phase {
	case q1
	case q2
	case q3
	case q4
}

enum gameStates {
	case chatting
	case answering
	case painting
}
