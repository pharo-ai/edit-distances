Extension { #name : #AIRestrictedDamerauLevenshteinDistanceTest }

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testDistanceToUsingAIRestrictedDamerauLevenshteinDistance [

	| result actual |
	result := levenshteinRestricted distanceBetween: 'zork' and: 'fork'.
	actual := 1.
	self assert: result equals: actual
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceOneSwapTwoAdd [

	| firstString secondString expected actual |
	firstString :=  'agag'.
	secondString := 'aggaag'.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 2.

	self assert: actual equals: expected
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTowReplaceOneAddOneSwap [

	| firstString secondString expected actual |
	firstString := 'HONDA'.
	secondString := 'HYUNADI'.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 4.

	self assert: actual equals: expected
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTransposition [

	| firstString secondString expected actual |
	firstString := 'an act'.
	secondString := 'a cat'.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 2.

	self assert: actual equals: expected
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTwoSwapThreeReplace [

	| firstString secondString expected actual |
	firstString := 'agaaloli'.
	secondString := 'gananail'.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 5.

	self assert: actual equals: expected
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTwoSwapTwoReplace [

	| firstString secondString expected actual |
	firstString :=  'hannah'.
	secondString := 'nahhan'.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 4.

	self assert: actual equals: expected
]
