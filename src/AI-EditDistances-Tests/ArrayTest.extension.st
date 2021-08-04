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
ArrayTest >> testManhattanDistanceTo [

	| result actual |
	
	result := #(10 20 10) manhattanDistanceTo: #(10 20 20).
	actual := 10.
	self assert: (result closeTo: actual). 
]
