Extension { #name : #Object }

{ #category : #'*AI-EditDistances' }
Object class >> defaultDistanceMetric [
	" Answer an instance of an <AIAbstractEditDistance> subclass, configured as default for establishingedit distances between objects "

	^ AIEuclideanDistance new
]

{ #category : #'*AI-EditDistances' }
Object >> distanceTo: anotherObject [

	^ self distanceTo: anotherObject using: self class defaultDistanceMetric
]

{ #category : #'*AI-EditDistances' }
Object >> distanceTo: anotherObject using: aMetric [

	^ aMetric distanceBetween: self and: anotherObject 
]
