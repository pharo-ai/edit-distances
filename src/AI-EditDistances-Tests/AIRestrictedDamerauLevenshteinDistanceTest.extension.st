Extension { #name : #AIRestrictedDamerauLevenshteinDistanceTest }

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testDistanceToUsingAIRestrictedDamerauLevenshteinDistance [


	self assert: (levenshteinRestricted distanceBetween: 'zork' and: 'fork') equals: 1.

]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceOneAddOneSwap [

	self assert: (levenshteinRestricted distanceBetween: 'an act' and: 'a cat') equals: 2.
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTowReplaceOneAddOneSwap [

	self assert: (levenshteinRestricted distanceBetween: 'HONDA' and: 'HYUNADI') equals: 4.
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTwoAdd [

	self assert: (levenshteinRestricted distanceBetween: 'agag' and: 'aggaag') equals: 2.
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTwoSwapThreeReplace [

	self assert: (levenshteinRestricted distanceBetween: 'agaaloli' and: 'gananail') equals: 5.
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTwoSwapTwoReplace [

	self assert: (levenshteinRestricted distanceBetween: 'hannah' and: 'nahhan') equals: 4.
]
