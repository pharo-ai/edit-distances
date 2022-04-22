Extension { #name : #AIRestrictedDamerauLevenshteinDistanceTest }

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testDistanceToUsingAIRestrictedDamerauLevenshteinDistance [

	| result actual |
	result := 'zork' distanceTo: 'fork' using: AIRestrictedDamerauLevenshteinDistance new.
	actual := 1.
	self assert: result equals: actual
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTransposition [

	| firstString secondString expected actual |
	firstString := 'a cat'.
	secondString := 'an act'.

	actual := firstString restrictedDamerauLevenshteinDistanceTo: secondString.
	expected := 2.

	self assert: actual equals: expected
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTwoAddOneReplace [

	| firstString secondString expected actual |
	firstString := 'HONDA'.
	secondString := 'HYUNDAI'.

	actual := firstString restrictedDamerauLevenshteinDistanceTo: secondString.
	expected := 3.

	self assert: actual equals: expected
]
