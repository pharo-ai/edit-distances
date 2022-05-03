Class {
	#name : #AIDamerauLevenshteinDistance,
	#superclass : #AIAbstractEditDistance,
	#instVars : [
		'distanceMatrix'
	],
	#classInstVars : [
		'int'
	],
	#category : #'AI-EditDistances-Distances'
}

{ #category : #private }
AIDamerauLevenshteinDistance >> calculateDistanceBetween: firstString and: secondString [

	| cost lastMatchColumn secondStringCurrentCharacter firstStringCurrentCharacter lastMatchingRow rowCharactersWithIndexes |
	
	self initializeDistanceMatrixWith: firstString and: secondString.

	rowCharactersWithIndexes := Dictionary new.

	3 to: distanceMatrix rowCount do: [ :i | 
		
		firstStringCurrentCharacter := firstString at: i - 2.
		lastMatchColumn := 1.

		3 to: distanceMatrix columnCount do: [ :j |
			
			secondStringCurrentCharacter := secondString at: j - 2.
			lastMatchingRow := rowCharactersWithIndexes at: secondStringCurrentCharacter ifAbsent: 1.

			cost := secondStringCurrentCharacter = firstStringCurrentCharacter
				ifTrue: [ 0 ]
				ifFalse: [ 1 ].
			cost = 0 ifTrue: [ lastMatchColumn := j ].

			self calculateMinValue: cost at: i at: j using: lastMatchingRow and: lastMatchColumn ].

		rowCharactersWithIndexes at: firstStringCurrentCharacter put: i ]
]

{ #category : #private }
AIDamerauLevenshteinDistance >> calculateMinValue: cost at: i at: j using: lastMatchingRow and: lastMatchColumn [

	| addition deletion substitution transposition minValue upperCell leftCell upperLeftCell |
	upperCell := distanceMatrix at: i at: j - 1.
	addition := upperCell + 1.

	leftCell := distanceMatrix at: i - 1 at: j.
	deletion := leftCell + 1.
	
	upperLeftCell := distanceMatrix at: i - 1 at: j - 1.
	substitution := upperLeftCell + cost.

	transposition := (lastMatchingRow > 1 and: [ lastMatchColumn > 1 ])
		ifTrue: [ (distanceMatrix at: lastMatchingRow - 1 at: lastMatchColumn - 1)
			+ (i - lastMatchingRow - 1)
			+ 1
			+ (j - lastMatchColumn - 1) ]
		ifFalse: [ distanceMatrix at: 1 at: 1 ].

	minValue := { addition . deletion . substitution . transposition } min.

	distanceMatrix at: i at: j put: minValue
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

{ #category : #accessing }
AIDamerauLevenshteinDistance >> distanceMatrix [
	^ distanceMatrix
]

{ #category : #accessing }
AIDamerauLevenshteinDistance >> distanceMatrix: aCollection [ 
	distanceMatrix := aCollection
]

{ #category : #private }
AIDamerauLevenshteinDistance >> fillFirstTwoRowsAndColumnsWith: firstString and: secondString [


	"It fills the first row and column with the maxDistance value and the second row and column with value starting with 0"

	| maxDistance |
	maxDistance := firstString size + secondString size.
	
	1 to: distanceMatrix rowCount do: [ :i | 
		distanceMatrix at: i at: 1 put: maxDistance ].
	
	1 to: distanceMatrix columnCount do: [ :j | 
		distanceMatrix at: 1 at: j put: maxDistance ].
	
	2 to: distanceMatrix rowCount do: [ :i | 
		distanceMatrix at: i at: 2 put: i - 2 ].
	
	2 to: distanceMatrix columnCount do: [ :j | 
		distanceMatrix at: 2 at: j put: j - 2 ]
]

{ #category : #private }
AIDamerauLevenshteinDistance >> initializeDistanceMatrixWith: firstString and: secondString [

	distanceMatrix := Array2D
		rows: firstString size + 2
		columns: secondString size + 2.
		
	self fillFirstTwoRowsAndColumnsWith: firstString and: secondString
]
