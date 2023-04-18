//
//  File.swift
//  
//
//  Created by Caio Soares on 09/04/23.
//

import Foundation

var chat1: [(String, String, typeOfChat)] = [
	("Hi! You can proceed to the next chat by clicking that little arrow in the corner.", "The Narrator", .normalChat),
	("Sometimes there will be choices for you to choose, experiment!", "The Narrator", .normalChat),
	("", "", .emptyChat),
	("Here I am again.", "You", .normalChat),
	("Staring at this blank canvas until something comes to it", "You", .normalChat),
	("Ah, painting again.", "The Narrator", .normalChat),
	("Oh, hello me.", "You", .normalChat),
	("Excellent choise of hobby. But what exactly do you expect of that blank canvas?", "The Narrator", .normalChat),
	("...", "You", .normalChat),
	("Already with the hard questions?", "You", .normalChat),
	("Well, it isn't often you have time all to youself.", "Narrator", .normalChat),
	("I don't really know", "You", .normalChat),
	("You're right, though. I don't really have that much 'me' time...", "You", .normalChat),
	("What's on your mind, though?", "The Narrator", .normalChat),
	("You've been keeping yourself pretty busy, but you still haven't told me what you think about university.", "The Narrator", .normalChat),
	("Do I really have to? It isn't like you're insi-", "You", .normalChat),
	("Yup you need to.", "The Narrator", .normalChat),
	("How do you like the university life?", "The Narrator", .normalChat),
	("Oh", "You", .normalChat),
	("I've met so many interesting people at university. It's been great getting to know them.", "I've been really focused on my studies. It's been challenging, but I'm determined to succeed.", .question),
]

var q1a: [(String, String, typeOfChat)] = [
	("That's great to hear! It sounds like you've found your place, then", "The Narrator", .normalChat),
	("So, tell me, what kind of people have you met? What makes them interesting?", "The Narrator", .normalChat),
	("Oh, all sorts of people! Artists, scientists, musicians... It's just really cool to be around people with different passions and ideas.", "You", .normalChat),
	("It sounds like you're really enjoying your time at university. Now go on, use your time wisely", "The Narrator", .normalChat),
	("Go on, color the left in a down left, then down right motion", "Need help?", .promptToDraw),
]

var q1b: [(String, String, typeOfChat)] = [
	("I see. It sounds like you're really dedicated to your education.", "The Narrator", .normalChat),
	("What kind of classes are you taking?", "The Narrator", .normalChat),
	("Mostly math, physics and computer science courses. They're pretty demanding, but I'm enjoying the challenge.", "You", .normalChat),
	("That's great to hear! You must be pretty smart to take on all those subjects.", "The Narrator", .normalChat),
	("Now, chop chop. It ain't gonna paint itself!", "The Narrator", .normalChat)
	("Go on, color the left in a down left, then down right motion", "Need help?", .promptToDraw),
]

var chat2: [(String, String, typeOfChat)] = [
	("Wow, great work", "The Narrator", .normalChat),
	("Have you ever thinked about what makes you paint, even?", "The Narrator", .normalChat),
	("What gives us a will to express ourselves?", "The Narrator", .normalChat),
	("You're funny.", "You", .normalChat),
	("I'm artistic", "The Narrator", .normalChat),
	("For real, though. I don't know what makes me sit here in front of this canvas and paint it.", "You", .normalChat),
	("Expression is a complex feeling if you think about.", "The Narrator", .normalChat),
	("Uhm...", "You", .normalChat),
	("I just can't explain. Something about it is like a seal to finish up a good day.", "It's cathartic. Feel's like a moment of peace between everything happening.", .question),
]

var q2a: [(String, String, typeOfChat)] = [
	("That's beautiful. It sounds like you have a real passion for painting.", "The Narrator", .normalChat),
	("I suppose so.", "You", .normalChat),
	("I think it's great that you have something like that in your life. It's important to have a creative outlet.", "The Narrator", .normalChat),
	("Yeah, it definitely helps me unwind", "You", .normalChat),
	("What If I do a down right, then down left motion...?", "Need help?", .promptToDraw),
]

var q2b: [(String, String, typeOfChat)] = [
	("It's frustrating when I can't seem to make any progress.", "You", .normalChat),
	("But there's always something to learn from even the most frustrating experiences.", "The Narrator", .normalChat),
	("That's a good way to look at it.", "You", .normalChat),
	("Better continue while I'm at it.", "You", .normalChat),
	("What If I do a down right, then down left motion...?", "Need help?", .promptToDraw),
]

var chat3: [(String, String, typeOfChat)] = [
//	("Wow, great work", "The Narrator", .normalChat),
//	("Stop it", "You", .normalChat),
//	("I'm serious. Have you ever thinked about what makes you paint, even?", "The Narrator", .normalChat),
//	("What gives us a will to express ourselves?", "The Narrator", .normalChat),
//	("You're funny.", "You", .normalChat),
//	("I'm artistic", "The Narrator", .normalChat),
//	("For real, though. I don't know what makes me sit here in front of this canvas and paint it.", "You", .normalChat),
//	("Expression is a complex feeling if you think about.", "The Narrator", .normalChat),
//	("Uhm...", "You", .normalChat),
//	("I've met so many interesting people at university. It's been great getting to know them.", "I've been really focused on my studies. It's been challenging, but I'm determined to succeed.", .question),
]

var chat4: [(String, String, typeOfChat)] = [
//	("Wow, great work", "The Narrator", .normalChat),
//	("Stop it", "You", .normalChat),
//	("I'm serious. Have you ever thinked about what makes you paint, even?", "The Narrator", .normalChat),
//	("What gives us a will to express ourselves?", "The Narrator", .normalChat),
//	("You're funny.", "You", .normalChat),
//	("I'm artistic", "The Narrator", .normalChat),
//	("For real, though. I don't know what makes me sit here in front of this canvas and paint it.", "You", .normalChat),
//	("Expression is a complex feeling if you think about.", "The Narrator", .normalChat),
//	("Uhm...", "You", .normalChat),
//	("I've met so many interesting people at university. It's been great getting to know them.", "I've been really focused on my studies. It's been challenging, but I'm determined to succeed.", .question),
]

var q3a: [(String, String, typeOfChat)] = [
	("q3a", "", .normalChat)
]
var q3b: [(String, String, typeOfChat)] = [
	("q3b", "", .normalChat)
]
var q4a: [(String, String, typeOfChat)] = [
	("q4a", "", .normalChat)
]
var q4b: [(String, String, typeOfChat)] = [
	("q4b", "", .normalChat)
]

struct chatsManager {
	
	let defaultChats = [chat1, chat2]
	let contextualChats = [q1a, q1b, q2a, q2b, q3a, q3b, q4a, q4b]
	
}

