Class {
	#name : #AIAbstractKendallTauNormalizer,
	#superclass : #Object,
	#instVars : [
		'concordantPairs',
		'discordantPairs',
		'tiesInX',
		'tiesInY',
		'numberOfSamples',
		'minUniqueValues'
	],
	#category : #'AI-EditDistances-Normalizers'
}

{ #category : #accessing }
AIAbstractKendallTauNormalizer >> concordantPairs: anObject [

	concordantPairs := anObject
]

{ #category : #accessing }
AIAbstractKendallTauNormalizer >> discordantPairs: anObject [

	discordantPairs := anObject
]

{ #category : #accessing }
AIAbstractKendallTauNormalizer >> minUniqueValues: aNumber [

	minUniqueValues := aNumber
]

{ #category : #converting }
AIAbstractKendallTauNormalizer >> normalize [

	"kendallTauDistance is a natural number that will be normalized into the range of [-1, 1]"

	^ self subclassResponsibility
]

{ #category : #accessing }
AIAbstractKendallTauNormalizer >> numberOfSamples: anObject [

	numberOfSamples := anObject
]

{ #category : #accessing }
AIAbstractKendallTauNormalizer >> tiesInX: anObject [

	tiesInX := anObject
]

{ #category : #accessing }
AIAbstractKendallTauNormalizer >> tiesInY: anObject [

	tiesInY := anObject
]
