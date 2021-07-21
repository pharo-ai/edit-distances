Extension { #name : #ObjectTest }

{ #category : #'*AI-EditDistances-Tests' }
ObjectTest >> testDistanceToUsingAICosineSimilarityDistance [

	| result actual |
	result := #( 3 45 7 2 )
		          distanceTo: #( 2 54 13 15 )
		          using: AICosineSimilarityDistance.
	actual := 0.9722.
	self assert: (result closeTo: actual)
]

{ #category : #'*AI-EditDistances-Tests' }
ObjectTest >> testDistanceToUsingAIEuclideanDistance [

	| result actual |
	result := #( 0 3 4 5 )
		          distanceTo: #( 7 6 3 -1 )
		          using: AIEuclideanDistance.
	actual := 9.74679434481.
	self assert: (result closeTo: actual)
]

{ #category : #'*AI-EditDistances-Tests' }
ObjectTest >> testDistanceToUsingAILevenshteinDistance [

	| result actual |
	result := 'zork' distanceTo: 'fork' using: AILevenshteinDistance.
	actual := 1.
	self assert: result equals: actual
]

{ #category : #'*AI-EditDistances-Tests' }
ObjectTest >> testDistanceToUsingAIManhattanDistance [

	| result actual |
	result := #( 10 20 10 )
		          distanceTo: #( 10 20 20 )
		          using: AIManhattanDistance.
	actual := 10.
	self assert: (result closeTo: actual)
]
