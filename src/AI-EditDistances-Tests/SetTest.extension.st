Extension { #name : #SetTest }

{ #category : #'*AI-EditDistances-Tests' }
SetTest >> testSzymkiewiczSimpsonDistanceTo [

	| result actual set1 set2 |
	result := #( 1000 2 0.5 3 6 88 99 99 99 ) asSet 
		          szymkiewiczSimpsonDistanceTo: #( 1000 0.5 99 ) asSet.
	actual := 1.
	self assert: (result closeTo: actual).

	set1 := #( 12 34 56 7 2 3 ) asSet.
	set2 := #( 3 5 43 ) asSet.
	result := set1 szymkiewiczSimpsonDistanceTo: set2.
	actual := (set1 intersection: set2) size / (set1 size min: set2 size).
	self assert: (result closeTo: actual)
]
