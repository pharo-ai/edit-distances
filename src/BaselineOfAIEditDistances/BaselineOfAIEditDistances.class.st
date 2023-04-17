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
		"External dependencies"
		spec
    		baseline: 'AIExternalVectorMatrix'
			with: [ spec repository: 'github://pharo-ai/external-dependencies' ].
		"Packages"
		spec
			package: 'AI-EditDistances';
			package: 'AI-EditDistances-Tests' with: [ spec requires: #( 'AI-EditDistances' ) ].
		"Groups"
		spec
			group: 'Core' with: #( 'AI-EditDistances' );
			group: 'Tests' with: #( 'AI-EditDistances-Tests' );
			group: 'All' with: #( 'Core' 'Tests' ) ]
]
