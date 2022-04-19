Extension { #name : #AICosineSimilarityDistanceTest }

{ #category : #'*AI-EditDistances-Tests' }
AICosineSimilarityDistanceTest >> testCosineSimilarityDistanceTo [

	| result actual metric |
	metric := AICosineSimilarityDistance new.
	
	result := metric distanceBetween: #(3 45 7 2) and: #(2 54 13 15) .
	actual := 0.9722.
	self assert: (result closeTo: actual). 
]

{ #category : #'*AI-EditDistances-Tests' }
AICosineSimilarityDistanceTest >> testDistanceToUsingAICosineSimilarityDistance [

	| result actual |
	result := #( 3 45 7 2 )
		          distanceTo: #( 2 54 13 15 )
		          using: AICosineSimilarityDistance new.
	actual := 0.9722.
	self assert: (result closeTo: actual)
]
