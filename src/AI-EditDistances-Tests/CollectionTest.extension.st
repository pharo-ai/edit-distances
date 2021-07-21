Extension { #name : #CollectionTest }

{ #category : #'*AI-EditDistances-Tests' }
CollectionTest >> testSzymkiewiczSimpsonDistanceTo [

	| result actual collec1 collec2 |
	result := #( 1000 2 0.5 3 6 88 99 99 99 ) asSet 
		          szymkiewiczSimpsonDistanceTo: #( 1000 0.5 99 ) asSet.
	actual := 1.
	self assert: (result closeTo: actual).

	collec1 := #( 12 34 56 7 2 3 ).
	collec2 := #( 3 3 3 3 3 ).
	result := collec1 szymkiewiczSimpsonDistanceTo: collec2.
	actual := (collec1 asSet intersection: collec2 asSet) size
	          / (collec1 asSet size min: collec2 asSet size).
	self assert: (result closeTo: actual)
]
