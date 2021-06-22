Class {
	#name : #SpikeConstants,
	#superclass : #SharedPool,
	#classVars : [
		'SP_ERR_MAX_COUNT',
		'SP_ERR_OK',
		'SP_ERR_TIMEOUT'
	],
	#category : #SpikeRiscVSimulator
}

{ #category : #initialization }
SpikeConstants class >> initialize [ 
	"self initialize needs to be run for the changes to be effective"
	SP_ERR_OK := 0.
	SP_ERR_TIMEOUT := 1.
	SP_ERR_MAX_COUNT := 2.
]

{ #category : #initialization }
SpikeConstants class >> isExecutionOk: code [

	^ (code = SP_ERR_OK) | (code = SP_ERR_TIMEOUT) | (code = SP_ERR_MAX_COUNT)
]

{ #category : #initialization }
SpikeConstants class >> isOk: code [

	^ code = SP_ERR_OK
]
