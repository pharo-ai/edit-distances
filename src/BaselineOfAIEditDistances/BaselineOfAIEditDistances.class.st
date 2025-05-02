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
		spec 
			baseline: 'ContainersArray2D' 
			with: [ spec repository: 'filetree:///mnt/j/Pharo/3 Containers-Array2D/Containers-Array2D/src' ].
		"Packages"
		spec
			package: 'AI-EditDistances' with: [ spec requires: #( 'AIExternalVectorMatrix' ) ];
			package: 'AI-EditDistances-Tests' with: [ spec requires: #( 'AI-EditDistances' ) ].
		"Groups"
		spec
			group: 'Core' with: #( 'AI-EditDistances' );
			group: 'Tests' with: #( 'AI-EditDistances-Tests' );
			group: 'All' with: #( 'Core' 'Tests' ) ]
]
