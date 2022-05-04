Extension { #name : #AICosineSimilarityDistanceTest }

{ #category : #'*AI-EditDistances-Tests' }
AICosineSimilarityDistanceTest >> testCosineSimilarityDistanceTo [

	self assert: (cosineDistance distanceBetween: #(3 45 7 2) and: #(2 54 13 15)) closeTo: 0.9722
]
