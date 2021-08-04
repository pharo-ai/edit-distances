"
I am the abstract class for all the distances algorithms
"
Class {
	#name : #AIAbstractEditDistance,
	#superclass : #Object,
	#category : #'AI-EditDistances-Distances'
}

{ #category : #accessing }
AIAbstractEditDistance >> distanceBetween: anObject and: anotherObject [
	" See superimplementor's comment "
	
	self subclassResponsibility
]
