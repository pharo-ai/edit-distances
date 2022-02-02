Extension { #name : #ObjectTest }

{ #category : #'*AI-EditDistances-Tests' }
ObjectTest >> testDistanceToUsingAICosineSimilarityDistance [

	| result actual |
	result := #( 3 45 7 2 )
		          distanceTo: #( 2 54 13 15 )
		          using: AICosineSimilarityDistance new.
	actual := 0.9722.
	self assert: (result closeTo: actual)
]

{ #category : #'*AI-EditDistances-Tests' }
ObjectTest >> testDistanceToUsingAIEuclideanDistance [

	| result actual |
	result := #( 0 3 4 5 )
		          distanceTo: #( 7 6 3 -1 )
		          using: AIEuclideanDistance new.
	actual := 9.74679434481.
	self assert: (result closeTo: actual)
]

{ #category : #'*AI-EditDistances-Tests' }
ObjectTest >> testDistanceToUsingAIKendallTauDistanceCNormalizer [

	| result actual kendallTauDistance |
	kendallTauDistance := AIKendallTauDistance new useNormalizer:
		                      AICKendallTauNormalizer.
	result := #( 12 2 1 12 2 )
		          distanceTo: #( 1 4 7 1 0 )
		          using: kendallTauDistance.
	actual := -0.48.
	self assert: (result closeTo: actual).

	result := #( 1 4 5 95 0 )
		          distanceTo: #( 5 7 4 9 7 )
		          using: kendallTauDistance.
	actual := 0.10666666666666667.
	self assert: (result closeTo: actual).

	result := #( 61 5 37 78 89 70 73 )
		          distanceTo: #( 97 63 38 21 65 100 37 )
		          using: kendallTauDistance.
	actual := -0.14285714285714285.
	self assert: (result closeTo: actual).

	result := #( 90 24 67 49 72 )
		          distanceTo: #( 66 51 96 40 2 )
		          using: kendallTauDistance.
	actual := 0.
	self assert: (result closeTo: actual)
]

{ #category : #'*AI-EditDistances-Tests' }
ObjectTest >> testDistanceToUsingAIKendallTauDistanceDefaultNormalizer [

	| result actual |
	result := #( 12 2 1 12 2 )
		          distanceTo: #( 1 4 7 1 0 )
		          using: AIKendallTauDistance new.
	actual := -0.4714045207910316.
	self assert: (result closeTo: actual).

	result := #( 1 4 5 95 0 )
		          distanceTo: #( 5 7 4 9 7 )
		          using: AIKendallTauDistance new.
	actual := 0.10540925533894598.
	self assert: (result closeTo: actual).

	result := #( 61 5 37 78 89 70 73 )
		          distanceTo: #( 97 63 38 21 65 100 37 )
		          using: AIKendallTauDistance new.
	actual := -0.14285714285714288.
	self assert: (result closeTo: actual).

	result := #( 90 24 67 49 72 )
		          distanceTo: #( 66 51 96 40 2 )
		          using: AIKendallTauDistance new.
	actual := 0.
	self assert: (result closeTo: actual)
]

{ #category : #'*AI-EditDistances-Tests' }
ObjectTest >> testDistanceToUsingAIKendallTauDistanceNoNormalizer [

	| result kendallTauDistance |
	kendallTauDistance := AIKendallTauDistance new
		normalizeResult: false;
		yourself.
	result := #( 12 2 1 12 2 )
		          distanceTo: #( 1 4 7 1 0 )
		          using: kendallTauDistance.

	self assert: result equals: 6
]

{ #category : #'*AI-EditDistances-Tests' }
ObjectTest >> testDistanceToUsingAILevenshteinDistance [

	| result actual |
	result := 'zork' distanceTo: 'fork' using: AILevenshteinDistance new.
	actual := 1.
	self assert: result equals: actual
]

{ #category : #'*AI-EditDistances-Tests' }
ObjectTest >> testDistanceToUsingAIManhattanDistance [

	| result actual |
	result := #( 10 20 10 )
		          distanceTo: #( 10 20 20 )
		          using: AIManhattanDistance new.
	actual := 10.
	self assert: (result closeTo: actual)
]

{ #category : #'*AI-EditDistances-Tests' }
ObjectTest >> testDistanceToUsingAISzymkiewiczSimpsonDistance [

	| result actual |
	result := #( 1 2 3 4 5 6 ) asSet
		          distanceTo: #( 1 2 3 ) asSet
		          using: AISzymkiewiczSimpsonDistance new.
	actual := 1.
	self assert: (result closeTo: actual)
]
