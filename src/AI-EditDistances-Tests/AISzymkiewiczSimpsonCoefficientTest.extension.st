Extension { #name : #AISzymkiewiczSimpsonCoefficientTest }

{ #category : #'*AI-EditDistances-Tests' }
AISzymkiewiczSimpsonCoefficientTest >> testDistanceToUsingAISzymkiewiczSimpsonDistance [

	| result actual |
	result := #( 1 2 3 4 5 6 ) asSet
		          distanceTo: #( 1 2 3 ) asSet
		          using: AISzymkiewiczSimpsonDistance new.
	actual := 1.
	self assert: (result closeTo: actual)
]
