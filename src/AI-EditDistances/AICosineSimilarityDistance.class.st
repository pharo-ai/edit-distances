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
AICosineSimilarityDistance >> distanceBetween: firstCollection and: secondCollection[
    | dotProduct normA normB |
    dotProduct := (firstCollection with: secondCollection collect: [ :a :b | a * b ]) sum.
    normA := (firstCollection collect: [ :x | x * x ]) sum sqrt.
    normB := (secondCollection collect: [ :x | x * x ]) sum sqrt.
    (normA = 0 and: [ normB = 0 ])
        ifTrue: [ ^ 1.0 ] "Zero vectors are considered identical."
        ifFalse: [ ^ dotProduct / (normA * normB) ]
]