Extension { #name : #AIEuclideanDistanceTest }

{ #category : #'*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testEuclideanDistanceTo [

	| metric |
	
	metric := AIEuclideanDistance new.
	self assert: (metric distanceBetween: #(0 3 4 5) and: #(7 6 3 -1)) closeTo: 9.74679434481
]
