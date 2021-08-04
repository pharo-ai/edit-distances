"
Cosine similarity is a metric used to determine how similar the documents are irrespective of their size. Mathematically, it measures the cosine of the angle between two vectors projected in a multi-dimensional space.

More info: [Cosine distance](https://www.machinelearningplus.com/nlp/cosine-similarity/)
"
Class {
	#name : #AICosineSimilarityDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances-Distances'
}

{ #category : #accessing }
AICosineSimilarityDistance >> distanceBetween: anObject and: anotherObject [
	" See superimplementor's comment "
	
	^ anObject cosineSimilarityDistanceTo: anotherObject
	
]
