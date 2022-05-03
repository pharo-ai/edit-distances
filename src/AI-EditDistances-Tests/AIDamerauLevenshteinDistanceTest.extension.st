Extension { #name : #AIDamerauLevenshteinDistanceTest }

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceOneAddOneSwap [

	self assert: (damerauLevenshtein distanceBetween: 'a cat' and: 'a abct') equals: 2.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceOneSwapOneDeletion [

	self assert: (damerauLevenshtein distanceBetween: 'abbbc' and: 'cbba') equals: 2.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceThreeSwapsOneDeletion [

	self assert: (damerauLevenshtein distanceBetween: 'abcccabcccde' and: 'cccbabaedcc') equals: 7.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTwoReplacesOneAddOneSwap [

	self assert: (damerauLevenshtein distanceBetween: 'HONDA' and: 'HYUNADI') equals: 4.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTwoSwapsOneDeletion [

	self assert: (damerauLevenshtein distanceBetween: 'abcba' and: 'baab') equals: 3.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTwoSwapsThreeReplaces [

	self assert: (damerauLevenshtein distanceBetween: 'agaaloli' and: 'gananail') equals: 5.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTwoSwapsTwoReplaces [

	self assert: (damerauLevenshtein distanceBetween: 'hannah' and: 'nahhan') equals: 4.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDistanceToUsingAIDamerauLevenshteinDistance [


	self assert: (damerauLevenshtein distanceBetween: 'zork' and: 'fork') equals: 1.

]
