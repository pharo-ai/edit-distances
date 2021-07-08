Class {
	#name : #AIAbstractEditDistance,
	#superclass : #Object,
	#category : #'AI-EditDistances'
}

{ #category : #accessing }
AIAbstractEditDistance >> distanceBetween: anObject and: anotherObject [
	" See superimplementor's comment "
	
	self subclassResponsibility
]
