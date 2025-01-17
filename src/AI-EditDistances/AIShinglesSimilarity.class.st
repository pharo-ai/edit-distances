"
A string similarity metric based on Shingles encoding [1]. It is well suited for detecting strings that underwent small modifications. Shingles encoding changes a little when string changes a little.

[1] Broder, Andrei Z. ""On the resemblance and containment of documents."" Proceedings. Compression and Complexity of SEQUENCES 1997 (Cat. No. 97TB100171). IEEE, 1997.

Link of the paper: https://www.cs.princeton.edu/courses/archive/spr05/cos598E/bib/broder97resemblance.pdf
"
Class {
	#name : 'AIShinglesSimilarity',
	#superclass : 'AIAbstractEditDistance',
	#instVars : [
		'slidingWindowSize',
		'maxEncodingSize'
	],
	#category : 'AI-EditDistances-Distances',
	#package : 'AI-EditDistances',
	#tag : 'Distances'
}

{ #category : 'defaults' }
AIShinglesSimilarity class >> defaultMaxEncodingSize [

	^ 4
]

{ #category : 'defaults' }
AIShinglesSimilarity class >> defaultSlidingWindowSize [

	^ 3
]

{ #category : 'instance creation' }
AIShinglesSimilarity class >> slidingWindowSize: aWindowSize maxEncodingSize: anEncodingSize [

	^ self new
		slidingWindowSize: aWindowSize;
		maxEncodingSize: anEncodingSize;
		yourself.
]

{ #category : 'api' }
AIShinglesSimilarity >> distanceBetween: firstSequence and: secondSequence [

	| firstEncoding secondEncoding intersection |
	
	firstEncoding := self encode: firstSequence.
	secondEncoding := self encode: secondSequence.
	
	intersection := firstEncoding intersection: secondEncoding.
	
	^ ((intersection size / firstEncoding size) + (intersection size / secondEncoding size)) / 2.
]

{ #category : 'converting' }
AIShinglesSimilarity >> encode: aCollectionOfTokens [

	| encodedSequence |

	aCollectionOfTokens size <= slidingWindowSize
		ifTrue: [ ^ { self shingleFor: aCollectionOfTokens } asSet ].
		
	encodedSequence := (1 to: aCollectionOfTokens size - slidingWindowSize + 1) collect: [ :i |
		self shingleFor: (aCollectionOfTokens copyFrom: i to: i + slidingWindowSize - 1) ].
	
	encodedSequence := encodedSequence asSet.
	
	encodedSequence size <= maxEncodingSize
		ifTrue: [ ^ encodedSequence ].
		
	^ (encodedSequence asArray sorted first: maxEncodingSize) asSet.
]

{ #category : 'initialization' }
AIShinglesSimilarity >> initialize [

	super initialize.
	slidingWindowSize := self class defaultSlidingWindowSize.
	maxEncodingSize := self class defaultMaxEncodingSize
]

{ #category : 'accessing' }
AIShinglesSimilarity >> maxEncodingSize: anObject [

	maxEncodingSize := anObject
]

{ #category : 'converting' }
AIShinglesSimilarity >> shingleFor: aCollectionOfTokens [
	
	^ aCollectionOfTokens asArray hash
]

{ #category : 'accessing' }
AIShinglesSimilarity >> slidingWindowSize: anObject [

	slidingWindowSize := anObject
]
