Class {
	#name : #SpikeTypes,
	#superclass : #SharedPool,
	#classVars : [
		'Sp_err'
	],
	#category : #SpikeRiscVSimulator
}

{ #category : #initialization }
SpikeTypes class >> initialize [ 
	"self initialize"
	Sp_err := #int.
]
