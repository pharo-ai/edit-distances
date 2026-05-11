"
The overlap coefficient, or Szymkiewicz–Simpson coefficient, is a similarity measure that measures the overlap between two finite sets.

More info: [Overlap coefficient](https://en.wikipedia.org/wiki/Overlap_coefficient)
"
Class {
	#name : 'AISzymkiewiczSimpsonDistance',
	#superclass : 'AIAbstractEditDistance',
	#category : 'AI-Szymkiewicz-Simpson-Distance-Distances',
	#package : 'AI-Szymkiewicz-Simpson-Distance',
	#tag : 'Distances'
}

{ #category : 'api' }
AISzymkiewiczSimpsonDistance >> distanceBetween: firstSet and: secondSet [

	| intersection minSize |
    
    (firstSet isEmpty and: [ secondSet isEmpty ]) ifTrue: [ ^ 1.0 ].
    
    intersection := firstSet intersection: secondSet.
    minSize := (firstSet size min: secondSet size).
    minSize = 0 ifTrue: [ ^ 0.0 ].
    
    ^ intersection size / minSize
]
