Extension { #name : #AIDamerauLevenshteinDistanceTest }

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceOneAddOneSwap [

	self assert: (damerauLevenshtein distanceBetween: 'a abct' and: 'a cat') equals: 2.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTowReplaceOneAddOneSwap [

	self assert: (damerauLevenshtein distanceBetween: 'HONDA' and: 'HYUNADI') equals: 4.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTwoAdd [

	self assert: (damerauLevenshtein distanceBetween: 'agag' and: 'aggaag') equals: 2.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTwoSwapThreeReplace [

	self assert: (damerauLevenshtein distanceBetween: 'agaaloli' and: 'gananail') equals: 5.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTwoSwapTwoReplace [

	self assert: (damerauLevenshtein distanceBetween: 'hannah' and: 'nahhan') equals: 4.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDistanceToUsingAIDamerauLevenshteinDistance [


	self assert: (damerauLevenshtein distanceBetween: 'zork' and: 'fork') equals: 1.

]
