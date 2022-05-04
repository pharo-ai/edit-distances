"
The restricted Damerau-Lavenshtein distance, also known as the optimal string alignment distance or restricted edit distance is a string metric for measuring the edit distance between two sequences.

This distance differs from the classical Levenshtein distance by including transpositions among its allowable operations in addition to the three classical single-character edit operations (insertions, deletions and substitutions).

"
Class {
	#name : #AIRestrictedDamerauLevenshteinDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances-Distances'
}

{ #category : #api }
AIRestrictedDamerauLevenshteinDistance >> distanceBetween: firstString and: secondString [

	| distanceMatrix cost |
	
	"If one of the strings or both are empty we return the other string size"
	firstString isEmpty ifTrue: [ ^ secondString size ].
	secondString isEmpty ifTrue: [ ^ firstString size ].
	
	"Define our matrix with size of our strings"
	distanceMatrix := Array2D
		rows: secondString size + 1
		columns: firstString size + 1.
	
	"Fill the first row and column starting with 1"
	1 to: distanceMatrix rowCount do: [ :i | 
	distanceMatrix at: i at: 1 put: i - 1 ].
	1 to: distanceMatrix columnCount do: [ :j | 
	distanceMatrix at: 1 at: j put: j - 1 ].

	"Begin the loop from the second row/column"
	2 to: distanceMatrix rowCount do: [ :i | 
		2 to: distanceMatrix columnCount do: [ :j | 
			"Setting the cost"
			cost := (firstString at: j - 1) = (secondString at: i - 1)
		        ifTrue: [ 0 ]
		        ifFalse: [ 1 ].
			"Calculate the min between the left, the upper-left and the upper case of our current case"
			distanceMatrix at: i at: j put:
				{ 
					((distanceMatrix at: i at: j - 1) + 1).
					((distanceMatrix at: i - 1 at: j) + 1).
					((distanceMatrix at: i - 1 at: j - 1) + cost) } min.

			"If while calculating we passed upon two caracters that can be swapped - we take the min between the min calculated before and the (i - 2,j - 2) case value + 1"
			(i > 2 & (j > 2) and: [ 
				 (firstString at: j - 1) = (secondString at: i - 2) and: [ 
					 (firstString at: j - 2) = (secondString at: i - 1) ] ])
			ifTrue: [ 
				distanceMatrix at: i at: j put:
					{
						(distanceMatrix at: i at: j).
						((distanceMatrix at: i - 2 at: j - 2) + 1) } min ] ] ].

	^ distanceMatrix at: distanceMatrix rowCount at: distanceMatrix columnCount
]
