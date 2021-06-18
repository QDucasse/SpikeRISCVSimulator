Class {
	#name : #Spike,
	#superclass : #FFIExternalObject,
	#instVars : [
		'memoryRegions'
	],
	#pools : [
		'SpikeConstants',
		'SpikeTypes'
	],
	#category : #SpikeRiscVSimulator
}

{ #category : #resources }
Spike class >> ffiLibrary [ 
		
	^ SpikeLibrary 
]

{ #category : #initialization }
Spike >> createSimulatorWithMemoryRegions: regions ofSize: regionsNumber [
	
	self ffiCall: #(void* initialize_sim (void* regions, int regionsNumber))
]

{ #category : #registers }
Spike >> doMemoryAt: anAddress write: aByteArray size: aSize [ 

	self ffiCall: #(Sp_err write_memory(self, uint64 anAddress, uint64 aSize, void* aByteArray))
]

{ #category : #registers }
Spike >> doMemoryReadBytes: aSize atAddress: anAddress inBuffer: aByteArray [ 

	self ffiCall: #(Sp_err read_memory(self, uint64 anAddress, uint64 aSize, void* aByteArray))
]

{ #category : #initialization }
Spike >> ffiLibraryName [ 

	^ SpikeLibrary
]

{ #category : #initialization }
Spike >> initialize [ 

	| externalArray |
	super initialize.
	externalArray := FFIExternalArray externalNewType: #SpikeMemoryRegion size: 1.
	externalArray autoRelease.
	memoryRegions := { (SpikeMemoryRegion base: 16r1000 content: (ByteArray new: 4096)) }.
	externalArray at: 1 put: (memoryRegions at:1).
	handle := self createSimulatorWithMemoryRegions: externalArray getHandle ofSize: 1.
]

{ #category : #registers }
Spike >> memoryAt: anAddress write: aByteArray [

	self memoryAt: anAddress write: aByteArray size: aByteArray size.
]

{ #category : #registers }
Spike >> memoryAt: anAddress write: aByteArray size: aSize [ 

	| result |
	result := self doMemoryAt: anAddress write: aByteArray size: aSize.
	self verifyErrorCode: result.
	^ result
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
