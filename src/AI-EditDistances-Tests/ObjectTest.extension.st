Extension { #name : #ObjectTest }

{ #category : #'*AI-EditDistances-Tests' }
ObjectTest >> testDistanceToUsing [

	| result actual |
	
	result := #(0 3 4 5) distanceTo: #(7 6 3 -1) using: AIEuclideanDistance new.
	actual := 9.74679434481.
	self assert: (result closeTo: actual). 
	
	result := #(10 20 10) distanceTo: #(10 20 20) using: AIManhattanDistance new.
	actual := 10.
	self assert: (result closeTo: actual). 
	
	result := #(3 45 7 2) distanceTo: #(2 54 13 15) using: AICosineSimilarityDistance new.
	actual := 0.9722.
	self assert: (result closeTo: actual).
	
	result := 'zork' distanceTo: 'fork' using: AILevenshteinDistance new.
	actual := 1.
	self assert: result equals: actual.

]
