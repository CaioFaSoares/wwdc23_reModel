import UIKit
import UIKit.UIGestureRecognizerSubclass

class moreThan_Gesture: UIGestureRecognizer {
	
	var strokePhase			:strokePhase = .notStarted
	var initialTouchPoint	:CGPoint = CGPoint.zero
	var trackedTouch		:UITouch? = nil
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
		super.touchesBegan(touches, with: event)
		if touches.count > 1 {
			self.state = .failed
		}
		
		if	self.trackedTouch == nil {
			self.trackedTouch = touches.first
			self.strokePhase  = .initialPoint
			self.initialTouchPoint = (self.trackedTouch?.location(in: self.view))!
			print(self.initialTouchPoint)
		}	else {
			for touch in touches {
				if touch != self.trackedTouch {
					self.ignore(touch, for: event)
				}
			}
		}
		
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
		super.touchesMoved(touches, with: event)
		let newTouch = touches.first
		
		guard newTouch == self.trackedTouch else {
			self.state = .failed
			print("Somehow there were multiple first touches!")
			return
		}
		
		let newPoint 		= (newTouch?.location(in: self.view))!
		let previousPoint 	= (newTouch?.previousLocation(in: self.view))!
		
		if self.strokePhase == .initialPoint {
			if initialTouchPoint.x < newPoint.x && initialTouchPoint.y < newPoint.y {
				self.strokePhase = .fstStroke
				print("\(strokePhase) ok @ \(type(of: self))")
			} else {
//				self.state = .failed
//				print("Oops, you missed the first stroke...")
//				print(newPoint)
			}
		} else if self.strokePhase == .fstStroke {
			if previousPoint.x > newPoint.x && previousPoint.y < newPoint.y {
				self.strokePhase = .sndStroke
				print("\(strokePhase) ok @ \(type(of: self))")
			} else {
//				self.state = .failed
//				print("Oops, you missed the second stroke...")
//				print(newPoint)
			}
			
		}
		
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
		super.touchesEnded(touches, with: event)
		let newTouch = touches.first
		let newPoint = (newTouch?.location(in: self.view))!
		
		guard newTouch == self.trackedTouch else {
			self.state = .failed
			return
		}
		
		if self.state == .possible &&
			self.strokePhase == .sndStroke &&
			newPoint.y > initialTouchPoint.y {
			self.state = .recognized
		} else {
			self.state = .failed
		}
		
	}
	
	override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
		super.touchesCancelled(touches, with: event)
		self.initialTouchPoint = CGPoint.zero
		self.strokePhase = .notStarted
		self.trackedTouch = nil
		self.state = .cancelled
	}
	
	override func reset() {
		super.reset()
		self.initialTouchPoint = CGPoint.zero
		self.strokePhase = .notStarted
		self.trackedTouch = nil
	}
	
}
