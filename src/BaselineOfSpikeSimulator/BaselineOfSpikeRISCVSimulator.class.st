Class {
	#name : #BaselineOfSpikeRISCVSimulator,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpikeSimulator
}

{ #category : #accessing }
BaselineOfSpikeRISCVSimulator >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec package: 'SpikeRISCVSimulator' ]
]

{ #category : #accessing }
BaselineOfSpikeRISCVSimulator >> project [

	^ super project
		loadType: #atomic;
		yourself
]
