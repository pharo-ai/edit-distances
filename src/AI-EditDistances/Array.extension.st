Extension { #name : #Array }

{ #category : #'*AI-EditDistances' }
Array >> cosineSimilarityDistanceTo: anArray [

	| num size1 size2 |

	num := (self * anArray) sum.
	size1 := (self * self) sum sqrt.
	size2 := (anArray * anArray ) sum sqrt.
	
	^ num / (size1 * size2)
]

{ #category : #'*AI-EditDistances' }
Array >> euclideanDistanceTo: anArray [

	^ ((self - anArray) raisedTo: 2) sum sqrt.
]

{ #category : #'*AI-EditDistances' }
Array >> kendallTauDistanceTo: anArray [

	| disagreements allPairs |
	disagreements := 0.
	allPairs := (1 to: self size) combinations: 2.
	allPairs do: [ :pair | 
		| i j inversion1 inversion2 |
		i := pair first.
		j := pair second.
		inversion1 := (self at: i) > (self at: j) and: [ 
			              (anArray at: i) < (anArray at: j) ].
		inversion2 := (self at: i) < (self at: j) and: [ 
			              (anArray at: i) > (anArray at: j) ].
		(inversion1 or: [ inversion2 ]) ifTrue: [ 
			disagreements := disagreements + 1 ] ].
	^ disagreements
]

{ #category : #'*AI-EditDistances' }
Array >> levenshteinDistanceTo: anArray [
	" Answer a <Number> representing the Levenshtein distance between self and anArray "

	| stab cost |
	"if a string is empty, answer the length of the another string"
	self isEmpty ifTrue: [ ^ anArray size ].
	anArray isEmpty ifTrue: [ ^ self size ].

	stab := PMMatrix rows: anArray size + 1 columns: self size + 1.
	1 to: stab columnCount do: [ :i | stab at: 1 at: i put: i - 1 ].
	1 to: stab rowCount do: [ :i | stab at: i at: 1 put: i - 1 ].

	2 to: stab columnCount do: [ :i | 
		2 to: stab rowCount do: [ :j | 
			cost := (self at: i - 1) = (anArray content at: j - 1)
				        ifTrue: [ 0 ]
				        ifFalse: [ 1 ].
			stab at: j at: i put: ({ 
					 ((stab at: j at: i - 1) + 1).
					 ((stab at: j - 1 at: i) + 1).
					 ((stab at: j - 1 at: i - 1) + cost) } asSortedCollection: [ :a :b | 
					 a < b ]) first ] ].
	^ stab at: stab rowCount at: stab columnCount
]

{ #category : #'*AI-EditDistances' }
Array >> manhattanDistanceTo: anArray [

	^ (self - anArray) abs sum. 
]
