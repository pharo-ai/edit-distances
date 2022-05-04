"
The Levenshtein distance is a string metric for measuring the difference between two sequences. Informally, the Levenshtein distance between two words is the minimum number of single-character edits (insertions, deletions or substitutions) required to change one word into the other.

More info on: [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance)
"
Class {
	#name : #AILevenshteinDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances-Distances'
}

{ #category : #api }
AILevenshteinDistance >> distanceBetween: aString and: anotherString [

	| distanceMatrix cost |
	aString ifEmpty: [ ^ anotherString size ].
	anotherString ifEmpty: [ ^ aString size ].

	distanceMatrix := Array2D
		rows: anotherString size + 1
		columns: aString size + 1.

	1 to: distanceMatrix rowCount do: [ :i | 
	distanceMatrix at: i at: 1 put: i - 1 ].
	1 to: distanceMatrix columnCount do: [ :j | 
	distanceMatrix at: 1 at: j put: j - 1 ].

	2 to: distanceMatrix rowCount do: [ :i | 
		2 to: distanceMatrix columnCount do: [ :j | 
			cost := (aString at: j - 1) = (anotherString at: i - 1)
				ifTrue: [ 0 ]
				ifFalse: [ 1 ].

			distanceMatrix at: i at: j put: { 
				((distanceMatrix at: i at: j - 1) + 1).
				((distanceMatrix at: i - 1 at: j) + 1).
				((distanceMatrix at: i - 1 at: j - 1) + cost) } min ] ].

	^ distanceMatrix at: distanceMatrix rowCount at: distanceMatrix columnCount
]
