"
The Levenshtein distance is a string metric for measuring the difference between two sequences. Informally, the Levenshtein distance between two words is the minimum number of single-character edits (insertions, deletions or substitutions) required to change one word into the other.

More info on: [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance)
"
Class {
	#name : 'AILevenshteinDistance',
	#superclass : 'AIAbstractEditDistance',
	#category : 'AI-EditDistances-Distances',
	#package : 'AI-EditDistances',
	#tag : 'Distances'
}

{ #category : 'api' }
AILevenshteinDistance >> distanceBetween: firstString and: secondString [

	| distanceMatrix |
	
	"If one of the strings is empty, return the other string's size"
	firstString isEmpty ifTrue: [ ^ secondString size ].
	secondString isEmpty ifTrue: [ ^ firstString size ].
	
	distanceMatrix := self distanceMatrixBasedOn: firstString and: secondString.

	^ distanceMatrix
		at: distanceMatrix numberOfRows
		at: distanceMatrix numberOfColumns
]

{ #category : 'private' }
AILevenshteinDistance >> distanceMatrixBasedOn: firstString and: secondString [

    | distanceMatrix |
    distanceMatrix := CTArray2D
        rows: secondString size + 1
		columns: firstString size + 1.

    self fillFirstRowAndColumn: distanceMatrix.

    self fillStartingFromSecondRowAndColumn: distanceMatrix
        basedOn: firstString
        and: secondString.

    ^ distanceMatrix
]

{ #category : 'private' }
AILevenshteinDistance >> fillCellInMatrix: aMatrix at: i at: j basedOn: firstString and: secondString [

	| cost leftCell upperCell upperLeftCell |
	
	"Setting the cost"
	cost := (firstString at: j - 1) = (secondString at: i - 1)
		ifTrue: [ 0 ]
		ifFalse: [ 1 ].
		
	leftCell := (aMatrix at: i at: j - 1) + 1.
	upperCell := (aMatrix at: i - 1 at: j) + 1.
	upperLeftCell := (aMatrix at: i - 1 at: j - 1) + cost.
	
	"Calculate the min between the left, upper-left, and upper case of our current case"
	aMatrix at: i at: j put:
		{ leftCell . upperCell . upperLeftCell } min.
]

{ #category : 'private' }
AILevenshteinDistance >> fillFirstRowAndColumn: aMatrix [
	
	"Fill the first row and column starting with 0"
	1 to: aMatrix rowCount do: [ :i | 
		aMatrix at: i at: 1 put: i - 1 ].
	
	1 to: aMatrix columnCount do: [ :j | 
		aMatrix at: 1 at: j put: j - 1 ].
]

{ #category : 'private' }
AILevenshteinDistance >> fillStartingFromSecondRowAndColumn: aMatrix basedOn: firstString and: secondString [
	
	"Begin the loop from the second row/column"
	2 to: aMatrix numberOfRows do: [ :i | 
		2 to: aMatrix numberOfColumns do: [ :j | 
			self fillCellInMatrix: aMatrix
				at: i
				at: j
				basedOn: firstString
				and: secondString ] ].
]