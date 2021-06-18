Class {
	#name : #Spike,
	#superclass : #FFIExternalObject,
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

{ #category : #registers }
Spike >> register: regid readInto: value [
	"Read the value of register no regid and store it in value"
	
	self ffiCall: #(void read_register(self, int regid, void* value))
]

{ #category : #registers }
Spike >> register: regid write: value [
	"Write the contents of value in register regid"
	
	self ffiCall: #(void write_register(self, int regid, void* value))
]
