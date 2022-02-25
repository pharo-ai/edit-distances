Extension { #name : #AILevenshteinDistanceTest }

{ #category : #'*AI-EditDistances-Tests' }
AILevenshteinDistanceTest >> testDistanceToUsingAILevenshteinDistance [

	| result actual |
	result := 'zork' distanceTo: 'fork' using: AILevenshteinDistance new.
	actual := 1.
	self assert: result equals: actual
]
