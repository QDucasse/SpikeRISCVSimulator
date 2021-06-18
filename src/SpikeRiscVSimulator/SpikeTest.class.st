Class {
	#name : #SpikeTest,
	#superclass : #TestCase,
	#category : #SpikeRiscVSimulator
}

{ #category : #tests }
SpikeTest >> testMemoryReadBytesAtAddressInBuffer [ 

	
	| spi bufferRead |
	spi := Spike new.
	bufferRead := ByteArray new size: 4.
	spi memoryAt: 16r1000 write: #[1 2 3 4] size: 4.
	spi doMemoryReadBytes: 4 atAddress: 16r1000 inBuffer: bufferRead.
	self assert: bufferRead equals: #[1 2 3 4].
]

{ #category : #tests }
SpikeTest >> testReadAndWriteRegisterPC [

	| spi buffer_write buffer_read | 

	spi := Spike new.
	buffer_write := #[1 2 3 4 5 6 7 8].
	buffer_read  := ByteArray new: 8.
	spi register: 32 write: buffer_write.
	spi register: 32 readInto: buffer_read.
	self assert: buffer_read equals: #[1 2 3 4 0 0 0 0].


]

{ #category : #tests }
SpikeTest >> testReadAndWriteRegisterX3 [

	| spi buffer_write buffer_read | 

	spi := Spike new.
	buffer_write := #[1 2 3 4 5 6 7 8].
	buffer_read  := ByteArray new: 8.
	spi register: 3 write: buffer_write.
	spi register: 3 readInto: buffer_read.
	self assert: buffer_read equals: #[1 2 3 4 0 0 0 0].


]

{ #category : #tests }
SpikeTest >> testRegisterReadInto [

	| spi buffer_read errorCode | 

	spi := Spike new.
	buffer_read  := #[15 15 15 15].
	errorCode := spi register: 3 readInto: buffer_read.
	self assert: buffer_read equals: #[0 0 0 0].
	


]

{ #category : #tests }
SpikeTest >> testRegisterReadIntoOnlyTakes4Bytes [

	| spi buffer_read | 

	spi := Spike new.
	buffer_read  := #[15 15 15 15 15 15 15 15].
	spi register: 3 readInto: buffer_read.
	self assert: buffer_read equals: #[0 0 0 0 15 15 15 15].


]
