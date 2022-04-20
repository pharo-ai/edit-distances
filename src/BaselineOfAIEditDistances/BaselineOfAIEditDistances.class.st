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
		self polyMath: spec.

		"Packages"
		spec
			package: 'AI-EditDistances' with: [ spec requires: #( 'PolyMathGroup' ) ];
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

{ #category : #baselines }
BaselineOfAIEditDistances >> polyMath: spec [

	spec baseline: 'AIExternalDependencies' with: [ 
		spec
			loads: #( 'PolyMathGroup' );
			repository: 'github://pharo-ai/external-dependencies' ]
]
