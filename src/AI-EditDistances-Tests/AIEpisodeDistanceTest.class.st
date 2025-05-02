Class {
	#name : 'AIEpisodeDistanceTest',
	#superclass : 'TestCase',
	#instVars : [
		'episodeDistance'
	],
	#category : 'AI-EditDistances-Tests',
	#package : 'AI-EditDistances-Tests'
}

{ #category : 'running' }
AIEpisodeDistanceTest >> setUp [
	super setUp.
	episodeDistance := AIEpisodeDistance new
]

{ #category : 'tests' }
AIEpisodeDistanceTest >> testDistanceCaseSensitive [

	self assert: (episodeDistance distanceBetween: 'abc' and: 'ABC') equals: 3
]

{ #category : 'tests' }
AIEpisodeDistanceTest >> testDistanceCompletelyDifferentStrings [

	self assert: (episodeDistance distanceBetween: 'ABC' and: 'XYZ') equals: 3
]

{ #category : 'tests' }
AIEpisodeDistanceTest >> testDistanceEmptyStrings [

	self assert: (episodeDistance distanceBetween: '' and: '') equals: 0
]

{ #category : 'tests' }
AIEpisodeDistanceTest >> testDistanceFirstStringEmpty [

	self assert: (episodeDistance distanceBetween: '' and: 'ABC') equals: 3
]

{ #category : 'tests' }
AIEpisodeDistanceTest >> testDistanceIdenticalStrings [

	self assert: (episodeDistance distanceBetween: 'ABC' and: 'ABC') equals: 0
]

{ #category : 'tests' }
AIEpisodeDistanceTest >> testDistanceLargeStrings [

	| str1 str2 |
	str1 := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
	str2 := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.
	self assert: (episodeDistance distanceBetween: str1 and: str2) equals: 10
]

{ #category : 'tests' }
AIEpisodeDistanceTest >> testDistanceMultipleInsertions [

	self assert: (episodeDistance distanceBetween: 'ABC' and: 'ABCDEF') equals: 3
]

{ #category : 'tests' }
AIEpisodeDistanceTest >> testDistanceSecondStringEmpty [

	self assert: (episodeDistance distanceBetween: 'ABC' and: '') equals: Float infinity
]

{ #category : 'tests' }
AIEpisodeDistanceTest >> testDistanceWithInsertions [
	
	self assert: (episodeDistance distanceBetween: 'MARADONA' and: 'M ARADONAS') equals: 2
]

{ #category : 'tests' }
AIEpisodeDistanceTest >> testDistanceWithNonContinuousInsertions [

	self assert: (episodeDistance distanceBetween: 'ABCDEF' and: 'A1B2C3D4E5F') equals: 5
]

{ #category : 'tests' }
AIEpisodeDistanceTest >> testDistanceWithSpecialCharacters [

	self assert: (episodeDistance distanceBetween: 'A@#' and: 'A@#!') equals: 1
]
