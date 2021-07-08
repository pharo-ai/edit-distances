Extension { #name : #Object }

{ #category : #'*AI-EditDistances' }
Object >> distanceTo: anotherObject [

	^ self distanceTo: anotherObject using: self class defaultDistanceMetric
]

{ #category : #'*AI-EditDistances' }
Object >> distanceTo: anotherObject using: aMetric [

	^ aMetric distanceBetween: self and: anotherObject 
]
