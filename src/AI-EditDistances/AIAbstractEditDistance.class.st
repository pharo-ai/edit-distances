Class {
	#name : #AIAbstractEditDistance,
	#superclass : #Object,
	#category : #'AI-EditDistances'
}

{ #category : #accessing }
AIAbstractEditDistance class >> distanceBetween: anObject and: anotherObject [
	" See superimplementor's comment "
	
	self subclassResponsibility
]
