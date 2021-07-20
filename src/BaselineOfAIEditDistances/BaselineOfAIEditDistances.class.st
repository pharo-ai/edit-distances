"
I am a baseline
"
Class {
	#name : #BaselineOfAIEditDistances,
	#superclass : #BaselineOf,
	#category : #BaselineOfAIEditDistances
}

{ #category : #baselines }
BaselineOfAIEditDistances >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: 'AI-EditDistances';
			package: 'AI-EditDistances-Tests'
			with: [ spec requires: #( 'AI-EditDistances' ) ] ]
]
