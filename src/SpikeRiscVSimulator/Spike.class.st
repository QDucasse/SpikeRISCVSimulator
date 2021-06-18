Class {
	#name : #Spike,
	#superclass : #FFIExternalObject,
	#pools : [
		'SpikeConstants',
		'SpikeTypes'
	],
	#category : #SpikeRiscVSimulator
}

{ #category : #initialization }
Spike class >> createSimulator [

	self ffiCall: #(void* initialize_sim ())
]

{ #category : #resources }
Spike class >> ffiLibrary [ 
		
	^ SpikeLibrary 
]

{ #category : #initialization }
Spike >> ffiLibraryName [ 

	^ SpikeLibrary
]

{ #category : #initialization }
Spike >> initialize [ 

	super initialize.
	handle := Spike createSimulator. 
]

{ #category : #initialization }
Spike >> primInitializeSimulator [

	self ffiCall: #(void* initialize_sim ())
]

{ #category : #registers }
Spike >> register: regid readInto: value [
	"Read the value of register no regid and store it in value"
	
	self ffiCall: #(Sp_err read_register(self, int regid, void* value))
]

{ #category : #registers }
Spike >> register: regid write: value [
	"Write the contents of value in register regid"
	
	self ffiCall: #(Sp_err write_register(self, int regid, void* value))
]

{ #category : #registers }
Spike >> stringOfErrorCode: code [

	^ self ffiCall: #(const char* sp_strerror(int code))
]

{ #category : #registers }
Spike >> verifyErrorCode: anInteger [ 
	
	"Check that the error code is 0 (SP_ERR_OK), otherwise calls the error with the string version"
	(SpikeConstants isOk: anInteger) ifTrue: [ ^ self ].
	SpikeError signal: (self stringOfErrorCode: anInteger)
]
