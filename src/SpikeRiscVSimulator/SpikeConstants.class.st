Class {
	#name : #SpikeConstants,
	#superclass : #SharedPool,
	#classVars : [
		'SP_ERR_OK'
	],
	#category : #SpikeRiscVSimulator
}

{ #category : #initialization }
SpikeConstants class >> initialize [ 

	"self initialize"
	SP_ERR_OK := 0
]

{ #category : #initialization }
SpikeConstants class >> isOk: code [

	^ code = SP_ERR_OK
]
