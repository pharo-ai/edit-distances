Class {
	#name : #AIDamerauLevenshteinDistance,
	#superclass : #AIAbstractEditDistance,
	#instVars : [
		'alphabetSize',
		'distanceMatrix'
	],
	#classInstVars : [
		'int'
	],
	#category : #'AI-EditDistances-Distances'
}

{ #category : #'as yet unclassified' }
AIDamerauLevenshteinDistance >> alphabetSize [
	
	^ alphabetSize
]

{ #category : #'as yet unclassified' }
AIDamerauLevenshteinDistance >> alphabetSize: int [
	
	alphabetSize := int.
]

{ #category : #'as yet unclassified' }
AIDamerauLevenshteinDistance >> calculateCostWith: cost at: i at: j using: lastMatchingRow and: lastMatchCol [

	| upperCell leftCell upperLeftCell upperLeftLastMatchingCell minValue |
	
	upperCell := distanceMatrix at: i at: j - 1.
	leftCell := distanceMatrix at: i - 1 at: j.
	upperLeftCell := distanceMatrix at: i - 1 at: j - 1.
	upperLeftLastMatchingCell := distanceMatrix
		at: lastMatchingRow
		at: lastMatchCol.
	
	minValue := { 
		(upperCell + 1).
		(leftCell + 1).
		(upperLeftCell + cost).
		(upperLeftLastMatchingCell + (i - (lastMatchingRow - 1)) + 1 + (j - (lastMatchCol - 1))) } min.

	distanceMatrix at: i at: j put: minValue
]

{ #category : #api }
AIDamerauLevenshteinDistance >> calculateDistanceBetween: firstString and: secondString [

	| cost lastMatchCol secondStringCurrentCharacter firstStringCurrentCharacter lastMatchingRow rowCharactersWithIndexes maxDistance |
	distanceMatrix := Array2D
		rows: firstString size + 2
		columns: secondString size + 2.

	maxDistance := firstString size + secondString size.
	self fillFirstTwoRowsAndColumnsMaxDistance: maxDistance.

	"rowCharactersWithIndexes := Array new: alphabetSize"
	"rowCharactersWithIndexes := Array new: 256. 
	1 to: last_row size do: [ :i | last_row at: i put: 0 ]."
	rowCharactersWithIndexes := Dictionary new.

	3 to: distanceMatrix rowCount do: [ :i | 
		firstStringCurrentCharacter := firstString at: i - 2.

		lastMatchCol := 3.

		3 to: distanceMatrix columnCount do: [ :j | 
			secondStringCurrentCharacter := secondString at: j - 2.
			
			lastMatchingRow := rowCharactersWithIndexes at: secondStringCurrentCharacter ifAbsent: 1.

			cost := secondStringCurrentCharacter = firstStringCurrentCharacter
				ifTrue: [ 0 ]
				ifFalse: [ 1 ].

			self calculateCostWith: cost at: i at: j using: lastMatchingRow and: lastMatchCol.
			cost = 0 ifTrue: [ lastMatchCol := j ] ].

		rowCharactersWithIndexes at: firstStringCurrentCharacter put: i ]
]

{ #category : #api }
AIDamerauLevenshteinDistance >> distanceBetween: firstString and: secondString [

	firstString isEmpty ifTrue: [ ^ secondString size ].
	secondString isEmpty ifTrue: [ ^ firstString size ].
	
	self calculateDistanceBetween: firstString and: secondString.
	
	^ distanceMatrix
		at: distanceMatrix rowCount
		at: distanceMatrix columnCount
]

{ #category : #api }
AIDamerauLevenshteinDistance >> fillFirstTwoRowsAndColumnsMaxDistance: maxDistance [


	"It fills the first row and column with the maxDistance value and the second row and column with value starting with 0"

	1 to: distanceMatrix rowCount do: [ :i | 
		distanceMatrix at: i at: 1 put: maxDistance.
		distanceMatrix at: i at: 2 put: i - 2 ].
	
	1 to: distanceMatrix columnCount do: [ :j | 
		distanceMatrix at: 1 at: j put: maxDistance.
		distanceMatrix at: 2 at: j put: j - 2 ]
]
