Class {
	#name : #SpikeMemoryRegion,
	#superclass : #FFIExternalStructure,
	#instVars : [
		'memoryArray'
	],
	#classVars : [
		'OFFSET_BASE',
		'OFFSET_CONTENT',
		'OFFSET_SIZE'
	],
	#category : #SpikeRiscVSimulator
}

{ #category : #'field definition' }
SpikeMemoryRegion class >> base: aBaseAddress content: aByteArray [ 

	aByteArray pinInMemory. 
	^ self new base: aBaseAddress ;
			     size: aByteArray size;
			     content: (PointerUtils oopForObject: aByteArray);
				  memoryArray: aByteArray;
			yourself
]

{ #category : #'field definition' }
SpikeMemoryRegion class >> fieldsDesc [ 
	"self rebuildFieldAccessors"
	^ #(uint64 base
    	 uint64 size 
	    void* content)
]

{ #category : #'accessing structure variables' }
SpikeMemoryRegion >> base [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_BASE
]

{ #category : #'accessing structure variables' }
SpikeMemoryRegion >> base: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_BASE put: anObject
]

{ #category : #'accessing structure variables' }
SpikeMemoryRegion >> content [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_CONTENT) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
SpikeMemoryRegion >> content: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_CONTENT put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
SpikeMemoryRegion >> memoryArray: aMemoryArray [ 

	memoryArray := aMemoryArray.
]

{ #category : #'accessing structure variables' }
SpikeMemoryRegion >> size [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_SIZE
]

{ #category : #'accessing structure variables' }
SpikeMemoryRegion >> size: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_SIZE put: anObject
]
