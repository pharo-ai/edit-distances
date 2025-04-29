Extension { #name : 'AIBrewDistanceTest' }

{ #category : '*AI-EditDistances-Tests' }
AIBrewDistanceTest >> testBrewDistanceDifferentStrings [

	self 
		assert: (metric distanceBetween: 'kitten' and: 'sitting') 
		equals: 3.
]

{ #category : '*AI-EditDistances-Tests' }
AIBrewDistanceTest >> testBrewDistanceEmptyStrings [

	self 
		assert: (metric distanceBetween: String empty and: String empty) 
		equals: 0.
	
]

{ #category : '*AI-EditDistances-Tests' }
AIBrewDistanceTest >> testBrewDistanceSameStrings [

	self 
		assert: (metric distanceBetween: 'hello' and: 'hello') 
		equals: 0.
	
]

{ #category : '*AI-EditDistances-Tests' }
AIBrewDistanceTest >> testBrewDistanceUnicodeStrings [

	self 
		assert: (metric distanceBetween: 'café' and: 'caffè') 
		equals: 2.
]
