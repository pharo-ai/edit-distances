Class {
	#name : #AIManhattanDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances'
}

{ #category : #accessing }
AIManhattanDistance >> distanceBetween: anObject and: anotherObject [
	" See superimplementor's comment "
	
	^ anObject manhattanDistanceTo: anotherObject
]
