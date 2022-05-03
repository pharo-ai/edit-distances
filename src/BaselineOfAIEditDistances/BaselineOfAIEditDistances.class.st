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
    			baseline: 'AIExternalPolyMath' with: [ spec repository: 'github://pharo-ai/external-dependencies' ].

		"Packages"
		spec
			package: 'AI-EditDistances' with: [ spec requires: #( 'AIExternalPolyMath' ) ];
			package: 'AI-EditDistances-Tests' with: [ spec requires: #( 'AI-EditDistances' ) ].

		self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfAIEditDistances >> defineGroups: spec [

	spec
		group: 'Core' with: #( 'AI-EditDistances' );
		group: 'Tests'
		with: #( 'AI-EditDistances' 'AI-EditDistances-Tests' );
		group: 'All' with: #( 'Core' 'Tests' );
		group: 'default' with: #( 'All' )
]
