Class {
	#name : #AIAbstractEditDistance,
	#superclass : #Object,
	#category : #'AI-EditDistances'
}

{ #category : #accessing }
AIAbstractEditDistance >> distanceBetween: anObject and: anotherObject [
	" Answer a <Number> "
	
	self subclassResponsibility
]
