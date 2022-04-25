Extension { #name : #String }

{ #category : #'*AI-EditDistances' }
String >> levenshteinDistanceTo: anotherString [
	"the Levenshtein distance between two words"

	| distanceMatrix cost |

	self ifEmpty: [ ^ anotherString size ].
	anotherString ifEmpty: [ ^ self size ].
		
	distanceMatrix := Array2D rows: anotherString size + 1 columns: self size + 1.
	
	1 to: distanceMatrix rowCount do: [ :i | distanceMatrix at: i at: 1 put: i - 1 ].
	1 to: distanceMatrix columnCount do: [ :j | distanceMatrix at: 1 at: j put: j - 1 ].
	
	2 to: distanceMatrix rowCount do: [ :i | 
		2 to: distanceMatrix columnCount do: [ :j | 
			cost := (self at: j - 1) = (anotherString at: i - 1)
				ifTrue: [ 0 ]
				ifFalse: [ 1 ].
				
			distanceMatrix at: i at: j put: {
				(distanceMatrix at: i at: j - 1) + 1 .
				(distanceMatrix at: i - 1 at: j) + 1 .
				(distanceMatrix at: i - 1 at: j - 1) + cost
			} min.
	] ].
	
	^ distanceMatrix at: distanceMatrix rowCount at: distanceMatrix columnCount
]

{ #category : #'*AI-EditDistances' }
String >> recursiveLevenshteinDistanceTo: anotherString [
	"Recursive implementation of the Levenshtein distance between two strings"
	| cost |

	self ifEmpty: [ ^ anotherString size ].
	anotherString ifEmpty: [ ^ self size ].

	"test if last characters of the strings match"
	cost := self last = anotherString last
		ifTrue: [ 0 ]
		ifFalse: [ 1 ].

	"return minimum of delete char from self, delete char from anotherString,
	and delete char from both"
	^ { 
		(self allButLast levenshteinDistanceTo: anotherString) + 1 .
		(self levenshteinDistanceTo: anotherString allButLast) + 1 .
		(self allButLast levenshteinDistanceTo: anotherString allButLast) + cost
	 } min.
]
