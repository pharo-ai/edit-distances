Class {
	#name : #AIRestrictedDamerauLevenshteinDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances-Distances'
}

{ #category : #api }
AIRestrictedDamerauLevenshteinDistance >> distanceBetween: firstString and: secondString [

	| distanceMatrix cost |
	firstString ifEmpty: [ ^ secondString size ].
	secondString ifEmpty: [ ^ firstString size ].

	distanceMatrix := Array2D
		                  rows: secondString size + 1
		                  columns: firstString size + 1.

	self
		setFirstColAndRow: secondString
		withDistanceMatrix: distanceMatrix.

	2 to: distanceMatrix rowCount do: [ :i | 
		2 to: distanceMatrix columnCount do: [ :j | 
			cost := (firstString at: j - 1) = (secondString at: i - 1)
				        ifTrue: [ 0 ]
				        ifFalse: [ 1 ].

			distanceMatrix at: i at: j put: { 
					((distanceMatrix at: i at: j - 1) + 1).
					((distanceMatrix at: i - 1 at: j) + 1).
					((distanceMatrix at: i - 1 at: j - 1) + cost) } min.


			(i > 2 & (j > 2)
				and: [ (firstString at: j - 1) = (secondString at: i - 2)
					and: [ (firstString at: j - 2) = (secondString at: i - 1) ] ])
			ifTrue: [ 
				distanceMatrix at: i at: j put: { 
						(distanceMatrix at: i at: j).
						((distanceMatrix at: i - 2 at: j - 2) + 1) } min ] ] ].
			
	^ distanceMatrix
		  at: distanceMatrix rowCount
		  at: distanceMatrix columnCount
]

{ #category : #initialization }
AIRestrictedDamerauLevenshteinDistance >> setCost: anotherString i:i j:j [
	"in progress"	
			
	| cost |
	cost := (self at: j - 1) = (anotherString at: i - 1)
			ifTrue: [ 0 ] ifFalse: [ 1 ].
]

{ #category : #initialization }
AIRestrictedDamerauLevenshteinDistance >> setFirstColAndRow: anotherString withDistanceMatrix: distanceMatrix [

	
	1 to: distanceMatrix rowCount do: [ :i | distanceMatrix at: i at: 1 put: i - 1 ].
	1 to: distanceMatrix columnCount do: [ :j | distanceMatrix at: 1 at: j put: j - 1 ].
]
