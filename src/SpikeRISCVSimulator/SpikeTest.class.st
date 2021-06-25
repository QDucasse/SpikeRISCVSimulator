Class {
	#name : #SpikeTest,
	#superclass : #TestCase,
	#instVars : [
		'spi'
	],
	#category : #SpikeRISCVSimulator
}

{ #category : #tests }
SpikeTest >> runCaseManaged [ 

	^ self runCase
]

{ #category : #running }
SpikeTest >> setUp [

	super setUp.
	spi := Spike new.
	spi mapHostMemory: (ByteArray new: 4096) atAddress: 16r1000 withPermissions: nil.
	spi initializeSimulator.
	
]

{ #category : #running }
SpikeTest >> tearDown [

	"spi finalize."
	
]

{ #category : #tests }
SpikeTest >> testExecuteAddInstruction [
	
	"Add two values to registers x6 and x7, add them and store the result in x5"
	| bufferX5 bufferX6 bufferX7 instrAdd |
	bufferX5 := #[16r00 16r00 16r00 16r00 0 0 0 0] copy. 
	bufferX6 := #[16r11 16r11 16r00 16r00 0 0 0 0] copy.
	bufferX7 := #[16r00 16r00 16r11 16r11 0 0 0 0] copy.	
	instrAdd := #[16rB3 16r02 16r73 16r00].
	"Write the values to the registers"
	spi register: SpikeRISCVRegisters x5 write: bufferX5.
	spi register: SpikeRISCVRegisters x6 write: bufferX6.	
	spi register: SpikeRISCVRegisters x7 write: bufferX7.
	"Write the instruction in memory"
	spi memoryAt: 16r1000 write: instrAdd.
	spi startAt: 16r1000 until: 16r1004 timeout: 0 count: 0.
	spi register: SpikeRISCVRegisters x5 readInto: bufferX5.
	self assert: bufferX5 equals: #[16r11 16r11 16r11 16r11 0 0 0 0].
]

{ #category : #tests }
SpikeTest >> testExecuteInfiniteLoopStopsOnInstructionCount [

	"Execute an infinite loop that should be stopped on timeout"

	| bufferX5 bufferX6 bufferX7 instrAdd instrAddi instrJmp res |
	bufferX5 := #[ 16r00 16r00 16r00 16r00 16r00 16r00 16r00 0] copy.
	bufferX6 := #[ 16r01 16r00 16r00 16r00 16r00 16r00 16r00 0] copy.
	bufferX7 := #[ 16r01 16r00 16r00 16r00 16r00 16r00 16r00 0] copy.
	instrAdd := #[ 16rB3 16r02 16r73 16r00 ]. "add  x5 x6 x7"
	instrAddi := #[ 16r05 16r03 ]. "addi x6 x6 1"
	instrJmp := #[ 16red 16rbf ]. "j 0x1000"
	"Write the values to the registers"
	spi register: SpikeRISCVRegisters x5 write: bufferX5.
	spi register: SpikeRISCVRegisters x6 write: bufferX6.
	spi register: SpikeRISCVRegisters x7 write: bufferX7.
	"Write the instructions in memory"
	spi memoryAt: 16r1000 write: instrAdd , instrAddi , instrJmp.
	res := spi
		       startAt: 16r1000
		       until: 16r1200
		       timeout: 0
		       count: 6.
	spi register: SpikeRISCVRegisters x5 readInto: bufferX5.
	spi register: SpikeRISCVRegisters x6 readInto: bufferX6.
	spi register: SpikeRISCVRegisters x7 readInto: bufferX7.
	self assert: bufferX5 equals: #[ 3 0 0 0 0 0 0 0 ].
	self assert: bufferX6 equals: #[ 3 0 0 0 0 0 0 0 ].
	self assert: bufferX7 equals: #[ 1 0 0 0 0 0 0 0 ].	
	self assert: (SpikeConstants isExecutionMaxCount: res)
]

{ #category : #tests }
SpikeTest >> testExecuteInfiniteLoopStopsOnTimeout [
	
	"Execute an infinite loop that should be stopped on timeout"
	| bufferX5 bufferX6 bufferX7 instrAdd instrJmp res |
	bufferX5 := #[16r00 16r00 16r00 16r00 0 0 0 0] copy. 
	bufferX6 := #[16r11 16r11 16r00 16r00 0 0 0 0] copy.
	bufferX7 := #[16r00 16r00 16r11 16r11 0 0 0 0] copy.	
	instrAdd := #[16rB3 16r02 16r73 16r00].
	instrJmp := #[16re5 16rbf].
	"Write the values to the registers"
	spi register: SpikeRISCVRegisters x5 write: bufferX5.
	spi register: SpikeRISCVRegisters x6 write: bufferX6.	
	spi register: SpikeRISCVRegisters x7 write: bufferX7.
	"Write the instructions in memory"
	spi memoryAt: 16r1000 write: (instrAdd , instrAdd, instrJmp).
	res := spi startAt: 16r1000 until: 16r1200 timeout: 1000 count: 0.
	self assert: (SpikeConstants isExecutionTimeout: res).
]

{ #category : #tests }
SpikeTest >> testMemoryWriteRead10Bytes [ 
	
	"10 bytes not supported directlydirectly by the CPP function -> read one by one"
	| bufferRead |
	bufferRead := ByteArray new: 10.
	spi memoryAt: 16r1000 write: #[10 10 10 10 10 10 10 10 10 10] size: 10.
	spi doMemoryReadBytes: 10 atAddress: 16r1000 inBuffer: bufferRead.
	self assert: bufferRead equals: #[10 10 10 10 10 10 10 10 10 10].
]

{ #category : #tests }
SpikeTest >> testMemoryWriteRead1Byte [ 

	"1 byte supported by the CPP function directly"
	| bufferRead |
	bufferRead := ByteArray new: 1.
	spi memoryAt: 16r1000 write: #[1] size: 1.
	spi doMemoryReadBytes: 1 atAddress: 16r1000 inBuffer: bufferRead.
	self assert: bufferRead equals: #[1].
]

{ #category : #tests }
SpikeTest >> testMemoryWriteRead2Bytes [ 

	"2 bytes supported by the CPP function directly"
	| bufferRead |
	bufferRead := ByteArray new: 2.
	spi memoryAt: 16r1000 write: #[2 2] size: 2.
	spi doMemoryReadBytes: 2 atAddress: 16r1000 inBuffer: bufferRead.
	self assert: bufferRead equals: #[2 2].
]

{ #category : #tests }
SpikeTest >> testMemoryWriteRead4Bytes [ 
	
	"4 bytes supported by the CPP function directly"
	| bufferRead |
	bufferRead := ByteArray new: 4.
	spi memoryAt: 16r1000 write: #[4 4 4 4] size: 4.
	spi doMemoryReadBytes: 4 atAddress: 16r1000 inBuffer: bufferRead.
	self assert: bufferRead equals: #[4 4 4 4].
]

{ #category : #tests }
SpikeTest >> testMemoryWriteRead8Bytes [ 
	
	"8 bytes supported by the CPP function directly"
	| bufferRead |
	bufferRead := ByteArray new: 8.
	spi memoryAt: 16r1000 write: #[8 8 8 8 8 8 8 8] size: 8.
	spi doMemoryReadBytes: 8 atAddress: 16r1000 inBuffer: bufferRead.
	self assert: bufferRead equals: #[8 8 8 8 8 8 8 8].
]

{ #category : #tests }
SpikeTest >> testReadAndWriteRegisterPC [

	| buffer_write buffer_read | 
	buffer_write := #[1 2 3 4 5 6 7 8] copy.
	buffer_read  := ByteArray new: 8.
	spi register: 32 write: buffer_write.
	spi register: 32 readInto: buffer_read.
	self assert: buffer_read equals: #[1 2 3 4 5 6 7 8].


]

{ #category : #tests }
SpikeTest >> testReadAndWriteRegisterX3 [

	| buffer_write buffer_read | 
	buffer_write := #[1 2 3 4 5 6 7 8] copy.
	buffer_read  := ByteArray new: 8.
	spi register: 3 write: buffer_write.
	spi register: 3 readInto: buffer_read.
	self assert: buffer_read equals: #[1 2 3 4 5 6 7 8].


]

{ #category : #tests }
SpikeTest >> testRegisterReadInto [

	| buffer_read errorCode | 
	buffer_read  := #[15 15 15 15 15 15 15 15] copy.
	errorCode := spi register: 3 readInto: buffer_read.
	self assert: buffer_read equals: #[0 0 0 0 0 0 0 0].
	


]
