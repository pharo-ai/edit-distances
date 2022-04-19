Extension { #name : #AIEuclideanDistanceTest }

{ #category : #'*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testDistanceToUsingAIEuclideanDistance [

	| result actual |
	result := #( 0 3 4 5 )
		          distanceTo: #( 7 6 3 -1 )
		          using: AIEuclideanDistance new.
	actual := 9.74679434481.
	self assert: (result closeTo: actual)
]

{ #category : #'*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testEuclideanDistanceTo [

	| result actual metric |
	
	metric := AIEuclideanDistance new.
	result := metric distanceBetween: #(0 3 4 5) and: #(7 6 3 -1).
	actual := 9.74679434481.
	self assert: (result closeTo: actual). 
]
