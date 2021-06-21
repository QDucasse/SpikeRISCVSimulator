Class {
	#name : #SpikeTest,
	#superclass : #TestCase,
	#instVars : [
		'spi'
	],
	#category : #SpikeRiscVSimulator
}

{ #category : #running }
SpikeTest >> setUp [

	super setUp.
	spi := Spike new.
	
]

{ #category : #tests }
SpikeTest >> testDoMemoryRead10BytesAtAddressInBuffer [ 
	
	"10 bytes not supported directlydirectly by the CPP function -> read one by one"
	| bufferRead |
	bufferRead := ByteArray new: 10.
	spi memoryAt: 16r1000 write: #[10 10 10 10 10 10 10 10 10 10] size: 10.
	spi doMemoryReadBytes: 10 atAddress: 16r1000 inBuffer: bufferRead.
	self assert: bufferRead equals: #[10 10 10 10 10 10 10 10 10 10].
]

{ #category : #tests }
SpikeTest >> testDoMemoryRead1ByteAtAddressInBuffer [ 

	"1 byte supported by the CPP function directly"
	| bufferRead |
	bufferRead := ByteArray new: 1.
	spi memoryAt: 16r1000 write: #[1] size: 1.
	spi doMemoryReadBytes: 1 atAddress: 16r1000 inBuffer: bufferRead.
	self assert: bufferRead equals: #[1].
]

{ #category : #tests }
SpikeTest >> testDoMemoryRead2BytesAtAddressInBuffer [ 

	"2 bytes supported by the CPP function directly"
	| bufferRead |
	bufferRead := ByteArray new: 2.
	spi memoryAt: 16r1000 write: #[2 2] size: 2.
	spi doMemoryReadBytes: 2 atAddress: 16r1000 inBuffer: bufferRead.
	self assert: bufferRead equals: #[2 2].
]

{ #category : #tests }
SpikeTest >> testDoMemoryRead4BytesAtAddressInBuffer [ 
	
	"4 bytes supported by the CPP function directly"
	| bufferRead |
	bufferRead := ByteArray new: 4.
	spi memoryAt: 16r1000 write: #[4 4 4 4] size: 4.
	spi doMemoryReadBytes: 4 atAddress: 16r1000 inBuffer: bufferRead.
	self assert: bufferRead equals: #[4 4 4 4].
]

{ #category : #tests }
SpikeTest >> testDoMemoryRead8BytesAtAddressInBuffer [ 
	
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
	buffer_write := #[1 2 3 4 5 6 7 8].
	buffer_read  := ByteArray new: 8.
	spi register: 32 write: buffer_write.
	spi register: 32 readInto: buffer_read.
	self assert: buffer_read equals: #[1 2 3 4 0 0 0 0].


]

{ #category : #tests }
SpikeTest >> testReadAndWriteRegisterX3 [

	| buffer_write buffer_read | 
	buffer_write := #[1 2 3 4 5 6 7 8].
	buffer_read  := ByteArray new: 8.
	spi register: 3 write: buffer_write.
	spi register: 3 readInto: buffer_read.
	self assert: buffer_read equals: #[1 2 3 4 0 0 0 0].


]

{ #category : #tests }
SpikeTest >> testRegisterReadInto [

	| buffer_read errorCode | 
	buffer_read  := #[15 15 15 15].
	errorCode := spi register: 3 readInto: buffer_read.
	self assert: buffer_read equals: #[0 0 0 0].
	


]

{ #category : #tests }
SpikeTest >> testRegisterReadIntoOnlyTakes4Bytes [

	| buffer_read | 
	buffer_read  := #[15 15 15 15 15 15 15 15].
	spi register: 3 readInto: buffer_read.
	self assert: buffer_read equals: #[0 0 0 0 15 15 15 15].


]
