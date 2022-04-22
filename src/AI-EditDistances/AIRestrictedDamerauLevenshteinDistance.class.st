Class {
	#name : #AIRestrictedDamerauLevenshteinDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances-Distances'
}

{ #category : #api }
AIRestrictedDamerauLevenshteinDistance >> distanceBetween: anObject and: anotherObject [

	^ anObject restrictedDamerauLevenshteinDistanceTo: anotherObject
]
