Class {
	#name : #BaselineOfSpikeRISCVSimulator,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpikeRISCVSimulator
}

{ #category : #accessing }
BaselineOfSpikeRISCVSimulator >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec package: 'SpikeRISCVSimulator' ]
]
