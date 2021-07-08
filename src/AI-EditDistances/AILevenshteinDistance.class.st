Class {
	#name : #AILevenshteinDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances'
}

{ #category : #accessing }
AILevenshteinDistance >> distanceBetween: anObject and: anotherObject [
	" See superimplementor's comment "
	
	^ anObject levenshteinDistanceTo: anotherObject
]
