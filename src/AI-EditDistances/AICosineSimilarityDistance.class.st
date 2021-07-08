Class {
	#name : #AICosineSimilarityDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances'
}

{ #category : #accessing }
AICosineSimilarityDistance >> distanceBetween: anObject and: anotherObject [
	" See superimplementor's comment "
	
	^ anObject cosineSimilarityDistanceTo: anotherObject
	
]
