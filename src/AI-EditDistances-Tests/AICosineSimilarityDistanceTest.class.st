Class {
	#name : #AICosineSimilarityDistanceTest,
	#superclass : #TestCase,
	#category : #'AI-EditDistances-Tests'
}

{ #category : #'*AI-EditDistances-Tests' }
AICosineSimilarityDistanceTest >> testCosineSimilarityDistanceTo [

	| result actual |
	
	result := #(3 45 7 2) cosineSimilarityDistanceTo: #(2 54 13 15).
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
