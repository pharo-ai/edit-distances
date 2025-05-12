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

{ #category : 'api' }
AICosineSimilarityDistance >> distanceBetween: firstCollection and: secondCollection[
    | dotProduct normA normB |
    firstCollection size = secondCollection size ifFalse: [ 
        self error: 'Collections must have the same length' ].
    (firstCollection allSatisfy: [ :x | x isNumber ]) ifFalse: [ 
        self error: 'First collection contains non-numeric elements' ].
    (secondCollection allSatisfy: [ :x | x isNumber ]) ifFalse: [ 
        self error: 'Second collection contains non-numeric elements' ].
    dotProduct := (firstCollection with: secondCollection collect: [ :a :b | a * b ]) sum.
    normA := (firstCollection collect: [ :x | x * x ]) sum sqrt.
    normB := (secondCollection collect: [ :x | x * x ]) sum sqrt.
    (normA = 0 and: [ normB = 0 ])
        ifTrue: [ ^ 1.0 ] "Zero vectors are considered identical."
        ifFalse: [ ^ dotProduct / (normA * normB) ]
]