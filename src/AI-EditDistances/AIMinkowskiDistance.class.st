"
The Minkowski distance or Minkowski metric is a metric in a normed vector space which can be considered as a generalization of both the Euclidean distance and the Manhattan distance. It is named after the German mathematician Hermann Minkowski.

It needs the `p` instance variable when being initialized.

```
metric := AIMinkowskiDistance new.
metric p: 3.

metric distanceBetween: #( 0 2 3 4 ) and: #( 2 4 3 7 )
```

or

```
metric := AIMinkowskiDistance p: 3.

metric distanceBetween: #( 0 2 3 4 ) and: #( 2 4 3 7 )
```
"
Class {
	#name : 'AIMinkowskiDistance',
	#superclass : 'AIAbstractEditDistance',
	#instVars : [
		'p'
	],
	#category : 'AI-EditDistances-Distances',
	#package : 'AI-EditDistances',
	#tag : 'Distances'
}

{ #category : 'accessing' }
AIMinkowskiDistance class >> p: anInteger [

	^ self new
		p: anInteger;
		yourself
]

{ #category : 'api' }
AIMinkowskiDistance >> distanceBetween: firstPoint and: secondPoint [

	| vector |
	vector := (firstPoint asPMVector - secondPoint asPMVector) abs raisedTo: p.

	^ vector sum raisedTo: 1 / p
]

{ #category : 'accessing' }
AIMinkowskiDistance >> p: anInteger [

	p := anInteger
]
