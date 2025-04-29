Extension { #name : 'AIKendallTauDistanceTest' }

{ #category : '*AI-EditDistances-Tests' }
AIKendallTauDistanceTest >> testDistanceToUsingAIKendallTauDistanceCNormalizer [

	| kendallTauDistance |
	kendallTauDistance := AIKendallTauDistance new
		useNormalizer: AICKendallTauNormalizer.
	
	self assert: (kendallTauDistance distanceBetween: #( 12 2 1 12 2 ) and: #( 1 4 7 1 0 )) closeTo: -0.48.

	self assert: (kendallTauDistance distanceBetween: #( 1 4 5 95 0 ) and: #( 5 7 4 9 7 )) closeTo: 0.10666666666666667.

	self assert: (kendallTauDistance distanceBetween: #( 61 5 37 78 89 70 73 ) and: #( 97 63 38 21 65 100 37 )) closeTo: -0.14285714285714285.

	self assert: (kendallTauDistance distanceBetween: #( 90 24 67 49 72 ) and: #( 66 51 96 40 2 )) closeTo: 0.
]

{ #category : '*AI-EditDistances-Tests' }
AIKendallTauDistanceTest >> testDistanceToUsingAIKendallTauDistanceDefaultNormalizer [

	| kendallTauDistance |
	kendallTauDistance := AIKendallTauDistance new.
	
	self assert: (kendallTauDistance distanceBetween: #( 12 2 1 12 2 ) and: #( 1 4 7 1 0 )) closeTo: -0.4714045207910316.

	self assert: (kendallTauDistance distanceBetween: #( 1 4 5 95 0 ) and: #( 5 7 4 9 7 )) closeTo: 0.10540925533894598.

	self assert: (kendallTauDistance distanceBetween: #( 61 5 37 78 89 70 73 ) and: #( 97 63 38 21 65 100 37 )) closeTo: -0.14285714285714288.

	self assert: (kendallTauDistance distanceBetween: #( 90 24 67 49 72 ) and: #( 66 51 96 40 2 )) closeTo: 0.
]

{ #category : '*AI-EditDistances-Tests' }
AIKendallTauDistanceTest >> testDistanceToUsingAIKendallTauDistanceNoNormalizer [

	| kendallTauDistance |
	kendallTauDistance := AIKendallTauDistance new
		normalizeResult: false;
		yourself.
	
	self assert: (kendallTauDistance distanceBetween: #( 12 2 1 12 2 ) and: #( 1 4 7 1 0 )) equals: 6
]
