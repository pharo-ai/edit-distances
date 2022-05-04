Extension { #name : #Object }

{ #category : #'*AI-EditDistances' }
Object class >> defaultDistanceMetric [
	" Answer an instance of an <AIAbstractEditDistance> subclass, configured as default for establishingedit distances between objects "

	^ AIEuclideanDistance new
]
