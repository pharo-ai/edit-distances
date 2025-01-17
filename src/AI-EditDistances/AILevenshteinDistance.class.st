"
The Levenshtein distance is a string metric for measuring the difference between two sequences. Informally, the Levenshtein distance between two words is the minimum number of single-character edits (insertions, deletions or substitutions) required to change one word into the other.

More info on: [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance)
"
Class {
	#name : 'AILevenshteinDistance',
	#superclass : 'AIAbstractEditDistance',
	#instVars : [
		'deletions',
		'insertions',
		'subtitutions',
		'distanceMatrix'
	],
	#category : 'AI-EditDistances-Distances',
	#package : 'AI-EditDistances',
	#tag : 'Distances'
}

{ #category : 'api' }
AILevenshteinDistance >> distanceBetween: aString and: anotherString [

	| substitutionCost |
	aString ifEmpty: [ ^ anotherString size ].
	anotherString ifEmpty: [ ^ aString size ].

	distanceMatrix := CTArray2D width: aString size + 1 height: anotherString size + 1.

	1 to: distanceMatrix height do: [ :row | distanceMatrix atColumn: 1 atRow: row put: row - 1 ].
	1 to: distanceMatrix width do: [ :col | distanceMatrix atColumn: col atRow: 1 put: col - 1 ].

	2 to: distanceMatrix height do: [ :row |
		2 to: distanceMatrix width do: [ :col |
			substitutionCost := (aString at: col - 1) = (anotherString at: row - 1)
				                    ifTrue: [ 0 ]
				                    ifFalse: [ 1 ].
			distanceMatrix atColumn: col atRow: row put: {
					((distanceMatrix atColumn: col atRow: row - 1) + 1 "deletion").
					((distanceMatrix atColumn: col - 1 atRow: row) + 1 "insertion").
					((distanceMatrix atColumn: col - 1 atRow: row - 1) + substitutionCost "substitution") } min ] ].

	^ distanceMatrix atColumn: distanceMatrix width atRow: distanceMatrix height
]
