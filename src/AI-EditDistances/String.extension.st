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
String >> minLevenshtein:distanceMatrix i:i j:j to: anotherString [
	"in progress"	
			
	| cost |
	cost := self setCost: anotherString i: i j: j.
	distanceMatrix at: i at: j put: {
				(distanceMatrix at: i at: j - 1) + 1 .
				(distanceMatrix at: i - 1 at: j) + 1 .
				(distanceMatrix at: i - 1 at: j - 1) + cost
			} min.
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

{ #category : #'*AI-EditDistances' }
String >> restrictedDamerauLevenshteinDistanceTo: anotherString [
	"the restricted Damerau-Levenshtein distance between two words"

	| distanceMatrix cost |

	self ifEmpty: [ ^ anotherString size ].
	anotherString ifEmpty: [ ^ self size ].
	
	distanceMatrix := Array2D rows: anotherString size + 1 columns: self size + 1.
	
	self setFirstColAndRow: anotherString withDistanceMatrix: distanceMatrix .
	
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
			
			((i > 1) & (j > 1) & ((distanceMatrix atRow: i) = (distanceMatrix atColumn: j-1)) & ((distanceMatrix atRow: i-1) = (distanceMatrix atColumn: j)))
			ifTrue: [ distanceMatrix at: i at: j put: {
				(distanceMatrix at: i at: j).
				(distanceMatrix at: i - 2 at: j - 2) + 1
				} min ].
	] ].
	
	^ distanceMatrix at: distanceMatrix rowCount at: distanceMatrix columnCount
]

{ #category : #'*AI-EditDistances' }
String >> setCost: anotherString i:i j:j [
	"in progress"	
			
	| cost |
	cost := (self at: j - 1) = (anotherString at: i - 1)
			ifTrue: [ 0 ] ifFalse: [ 1 ].
]

{ #category : #'*AI-EditDistances' }
String >> setFirstColAndRow: anotherString withDistanceMatrix: distanceMatrix [

	
	1 to: distanceMatrix rowCount do: [ :i | distanceMatrix at: i at: 1 put: i - 1 ].
	1 to: distanceMatrix columnCount do: [ :j | distanceMatrix at: 1 at: j put: j - 1 ].
]
