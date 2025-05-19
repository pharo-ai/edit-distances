"
Cosine similarity is a metric used to determine how similar the documents are irrespective of their size. Mathematically, it measures the cosine of the angle between two vectors projected in a multi-dimensional space.

More info: [Cosine distance](https://www.machinelearningplus.com/nlp/cosine-similarity/)
"
Class {
	#name : 'AICosineSimilarityDistance',
	#superclass : 'AIAbstractEditDistance',
	#category : 'AI-EditDistances-Distances',
	#package : 'AI-EditDistances',
	#tag : 'Distances'
}

{ #category : 'api' }
AICosineSimilarityDistance >> distanceBetween: anArray and: anotherArray [
	| num size1 size2 |

	num := (anArray * anotherArray) sum.
	size1 := (anArray * anArray) sum sqrt.
	size2 := (anotherArray * anotherArray) sum sqrt.

	^ num / (size1 * size2)

]
