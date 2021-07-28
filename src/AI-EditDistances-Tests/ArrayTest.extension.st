Extension { #name : #ArrayTest }

{ #category : #'*AI-EditDistances-Tests' }
ArrayTest >> testCosineSimilarityDistanceTo [

	| result actual |
	
	result := #(3 45 7 2) cosineSimilarityDistanceTo: #(2 54 13 15).
	actual := 0.9722.
	self assert: (result closeTo: actual). 
]

{ #category : #'*AI-EditDistances-Tests' }
ArrayTest >> testEuclideanDistanceTo [

	| result actual |
	
	result := #(0 3 4 5) euclideanDistanceTo: #(7 6 3 -1).
	actual := 9.74679434481.
	self assert: (result closeTo: actual). 
]

{ #category : #'*AI-EditDistances-Tests' }
ArrayTest >> testKendallTauDistanceTo [

	| rankedList1 rankedList2 |
	rankedList1 := #( 1 2 3 4 5 ).
	rankedList2 := #( 3 4 1 2 5 ).
	self
		assert: (rankedList1 kendallTauDistanceTo: rankedList2)
		equals: 4.
	rankedList1 := #( 3 1 2 5 4 ).
	rankedList2 := #( 5 3 2 1 4 ).
	self
		assert: (rankedList1 kendallTauDistanceTo: rankedList2)
		equals: 6.
	rankedList1 := #( 1 2 3 4 5 6 7 8 9 10 11 12 ).
	rankedList2 := #( 1 2 3 5 4 7 6 8 10 9 11 12 ).
	self
		assert: (rankedList1 kendallTauDistanceTo: rankedList2)
		equals: 3.
	rankedList1 := #( 1 1 2 3 ).
	rankedList2 := #( 3 2 4 5 ).
	self
		assert: (rankedList1 kendallTauDistanceTo: rankedList2)
		equals: 0
]

{ #category : #'*AI-EditDistances-Tests' }
ArrayTest >> testManhattanDistanceTo [

	| result actual |
	
	result := #(10 20 10) manhattanDistanceTo: #(10 20 20).
	actual := 10.
	self assert: (result closeTo: actual). 
]
