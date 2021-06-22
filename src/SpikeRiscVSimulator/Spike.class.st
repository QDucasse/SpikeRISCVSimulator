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
	
	"Initialize a simulator with given regions and the total number of them"
	^ self ffiCall: #(void* initialize_sim (void* regions, int regionsNumber))
]

{ #category : #registers }
Spike >> doMemoryAt: address write: bytes size: size [ 

	"Write the bytes in the given address"
	^ self ffiCall: #(Sp_err write_memory(self, uint64 address, uint64 size, void* bytes))
]

{ #category : #registers }
Spike >> doMemoryReadBytes: size atAddress: address inBuffer: bytes [ 

	"Read the bytes at the given address in the buffer"
	^ self ffiCall: #(Sp_err read_memory(self, uint64 address, uint64 size, void* bytes))
]

{ #category : #registers }
Spike >> doStartAt: beginAddress until: endAddress timeout: timeout count: count [

	"Launches the simulation with a begin address and three different ways to stop: 
	   - end address reached by PC 
	   - timeout 
	   - maximum number of instructions reached"
	^ self ffiCall: #(Sp_err spike_start(self, uint64 begin_address, uint64 end_address, uint64 timeout, size_t count))
]

{ #category : #initialization }
Spike >> ffiLibraryName [ 

	^ SpikeLibrary
]

{ #category : #registers }
Spike >> finalize [ 

	self free
]

{ #category : #registers }
Spike >> free [ 

	"Calls the destructor of the simulation"
	self ffiCall: #(void release_sim(self))
]

{ #category : #registers }
Spike >> getMemoryExceptionCause [ 

	"Reads the mcause in the processor state to know the type of memory exception"
	^ self ffiCall: #(Sp_err get_memory_exception_cause(self))
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
Spike >> memoryAt: anAddress readInto: aByteArray [ 

	self memoryAt: anAddress readInto: aByteArray size: aByteArray size
]

{ #category : #registers }
Spike >> memoryAt: anAddress readInto: aByteArray size: aSize [ 

	| result |
	result := self doMemoryReadBytes: aSize atAddress: anAddress inBuffer: aByteArray.
	self verifyMemoryErrorCode: result.
	^ result
]

{ #category : #registers }
Spike >> memoryAt: anAddress write: aByteArray [

	self memoryAt: anAddress write: aByteArray size: aByteArray size.
]

{ #category : #registers }
Spike >> memoryAt: anAddress write: aByteArray size: aSize [ 

	"Writes bytes to an address and checks for any error"
	| result |
	result := self doMemoryAt: anAddress write: aByteArray size: aSize.
	self verifyMemoryErrorCode: result.
	^ result
]

{ #category : #registers }
Spike >> register: regid readInto: value [

	"Read the value of register no regid and store it in value"
	^ self ffiCall: #(Sp_err read_register(self, int regid, void* value))
]

{ #category : #registers }
Spike >> register: regid write: value [

	"Write the contents of value in register regid"
	^ self ffiCall: #(Sp_err write_register(self, int regid, void* value))
]

{ #category : #registers }
Spike >> startAt: beginAddress until: endAddress timeout: timeout count: count [ 

	"Runs the execution and verify the result"
	| result |
	result := self doStartAt: beginAddress until: endAddress timeout: timeout count: count.
	self verifyExecutionErrorCode: result.
	^ result
]

{ #category : #registers }
Spike >> stringOfErrorCode: code [

	"Returns the corresponding message given an error code"
	^ self ffiCall: #(const char* sp_strerror(int code))
]

{ #category : #registers }
Spike >> verifyExecutionErrorCode: anErrorCode [ 

	"Check that the error code is SP_ERR_OK | SP_ERR_TIMEOUT | SP_ERR_MAX_COUNT, 
	 otherwise calls the error with the string version"
	(SpikeConstants isExecutionOk: anErrorCode) ifTrue: [ ^ self ].
	SpikeError signal: (self stringOfErrorCode: anErrorCode)
]

{ #category : #registers }
Spike >> verifyMemoryErrorCode: anErrorCode [ 

	"Check that the error code is 0 (SP_ERR_OK), otherwise calls the error with the string version"
	(SpikeConstants isOk: anErrorCode) ifTrue: [ ^ self ].
	SpikeError signal: (self stringOfErrorCode: anErrorCode)
]
