"
The restricted Damerau-Lavenshtein distance, also known as the optimal string alignment distance or restricted edit distance is a string metric for measuring the edit distance between two sequences.

This distance differs from the classical Levenshtein distance by including transpositions among its allowable operations in addition to the three classical single-character edit operations (insertions, deletions and substitutions).

"
Class {
	#name : 'AIRestrictedDamerauLevenshteinDistance',
	#superclass : 'AIAbstractEditDistance',
	#category : 'AI-EditDistances-Distances',
	#package : 'AI-EditDistances',
	#tag : 'Distances'
}

{ #category : 'private' }
AIRestrictedDamerauLevenshteinDistance >> checkSwapsInMatrix: aMatrix at: i at: j basedOn: firstString and: secondString [
	"If while calculating we passed upon two caracters that can be swapped - we take the min between the min calculated before and the (i - 2,j - 2) case value + 1"

	(i > 2 & (j > 2) and: [
		 (firstString at: j - 1) = (secondString at: i - 2) and: [
			 (firstString at: j - 2) = (secondString at: i - 1) ] ]) ifTrue: [
		aMatrix atColumn: j atRow: i put: {
				(aMatrix atColumn: j atRow: i).
				((aMatrix atColumn: j - 2 atRow: i - 2) + 1) } min ]
]

{ #category : 'api' }
AIRestrictedDamerauLevenshteinDistance >> distanceBetween: firstString and: secondString [

	| distanceMatrix |
	"If one of the strings is empty return the other string size"
	firstString isEmpty ifTrue: [ ^ secondString size ].
	secondString isEmpty ifTrue: [ ^ firstString size ].

	distanceMatrix := self
		                  distanceMatrixBasedOn: firstString
		                  and: secondString.

	^ distanceMatrix
		  atColumn: distanceMatrix width
		  atRow: distanceMatrix height 
]

{ #category : 'private' }
AIRestrictedDamerauLevenshteinDistance >> distanceMatrixBasedOn: firstString and: secondString [

	| distanceMatrix |
	distanceMatrix := CTArray2D
        width: firstString size + 1
        height: secondString size + 1.

	self fillFirstRowAndColumn: distanceMatrix.

	self
		fillStartingFromSecondRowAndColumn: distanceMatrix
		basedOn: firstString
		and: secondString.

	^ distanceMatrix
]

{ #category : 'private' }
AIRestrictedDamerauLevenshteinDistance >> fillCellInMatrix: aMatrix at: i at: j basedOn: firstString and: secondString [

	| cost leftCell upperCell upperLeftCell |
	"Setting the cost"
	cost := (firstString at: j - 1) = (secondString at: i - 1)
		        ifTrue: [ 0 ]
		        ifFalse: [ 1 ].

	leftCell := (aMatrix atColumn: j - 1 atRow: i) + 1.
	upperCell := (aMatrix atColumn: j atRow: i - 1) + 1.
	upperLeftCell := (aMatrix atColumn: j - 1 atRow: i - 1) + cost.

	"Calculate the min between the left, the upper-left and the upper case of our current case"
	aMatrix atColumn: j atRow: i put:
		{ leftCell . upperCell . upperLeftCell } min.
]

{ #category : 'private' }
AIRestrictedDamerauLevenshteinDistance >> fillFirstRowAndColumn: distanceMatrix [
	"Initialize the first row and column of the distance matrix with incremental values."

	1 to: distanceMatrix height do: [ :i |
        distanceMatrix atColumn: 1 atRow: i put: i - 1 ].
    1 to: distanceMatrix width do: [ :j |
        distanceMatrix atColumn: j atRow: 1 put: j - 1 ].
]

{ #category : 'private' }
AIRestrictedDamerauLevenshteinDistance >> fillStartingFromSecondRowAndColumn: aMatrix basedOn: firstString and: secondString [
	"Begin the loop from the second row/column"

	2 to: aMatrix height do: [ :i | 
		2 to: aMatrix width do: [ :j | 
			
			self fillCellInMatrix: aMatrix
				at: i
				at: j
				basedOn: firstString
				and: secondString.
				
			self checkSwapsInMatrix: aMatrix
				at: i
				at: j
				basedOn: firstString
				and: secondString ] ].
]
