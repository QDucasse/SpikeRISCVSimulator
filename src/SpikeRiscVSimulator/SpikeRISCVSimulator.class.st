Class {
	#name : #SpikeRISCVSimulator,
	#superclass : #ProcessorSimulator,
	#category : #SpikeRiscVSimulator
}

{ #category : #'as yet unclassified' }
SpikeRISCVSimulator class >> riscv64 [ 

	^ self new
]

{ #category : #'as yet unclassified' }
SpikeRISCVSimulator class >> supportsISA: isa [ 
	
	^ isa = #riscv64
]

{ #category : #registers }
SpikeRISCVSimulator >> baseRegister [

	^ SpikeRISCVRegisters x26
]

{ #category : #disassembling }
SpikeRISCVSimulator >> disassembler [ 

	^ LLVMDisassembler riscv32
]

{ #category : #building }
SpikeRISCVSimulator >> finishMappingMemory [
	
	simulator initializeSimulator.
]

{ #category : #registers }
SpikeRISCVSimulator >> fp [

	"Frame Pointer"
	^ self readRegister: self framePointerRegister
]

{ #category : #registers }
SpikeRISCVSimulator >> framePointerRegister [

	"Frame Pointer"
	^ SpikeRISCVRegisters x8
	
]

{ #category : #registers }
SpikeRISCVSimulator >> gp [

	"Global Pointer"
	^ self readRegister: SpikeRISCVRegisters x3
]

{ #category : #initialization }
SpikeRISCVSimulator >> initialize [ 
	
	super initialize.
	simulator := Spike new.
	
	registerAliases := Dictionary new.
	self initializeRegisterAliases.
]

{ #category : #registers }
SpikeRISCVSimulator >> instructionPointerRegister [
	
	"Instruction Pointer / Program Counter"
	^ SpikeRISCVRegisters pc
]

{ #category : #registers }
SpikeRISCVSimulator >> programCounterRegisterValue: anInteger [ 

	self writeRegister: SpikeRISCVRegisters pc value: anInteger
]

{ #category : #registers }
SpikeRISCVSimulator >> ra [ 

	"Return address"
	^ self readRegister: SpikeRISCVRegisters x1
]

{ #category : #registers }
SpikeRISCVSimulator >> returnAddressRegisterValue: anInteger [ 
	
	self writeRegister: SpikeRISCVRegisters x1 value: anInteger
]

{ #category : #registers }
SpikeRISCVSimulator >> rip: anInteger [ 

	^ simulator pc
]

{ #category : #'as yet unclassified' }
SpikeRISCVSimulator >> simulateLeafCallOf: destinationAddress nextpc: returnAddress memory: anUndefinedObject [ 

	self returnAddressRegisterValue: returnAddress.
	self programCounterRegisterValue: destinationAddress
]

{ #category : #registers }
SpikeRISCVSimulator >> sp [ 

	"Stack Pointer"
	^ self readRegister: self stackPointerRegister 
]

{ #category : #registers }
SpikeRISCVSimulator >> stackPointerRegister [
	
	^ SpikeRISCVRegisters x2
]

{ #category : #execution }
SpikeRISCVSimulator >> startAt: beginAddress until: endAddress timeout: timeout count: count [

	simulator startAt: beginAddress until: endAddress timeout: timeout count: count
]

{ #category : #registers }
SpikeRISCVSimulator >> tp [

	"Thread Pointer"
	^ self readRegister: SpikeRISCVRegisters x4
]

{ #category : #registers }
SpikeRISCVSimulator >> wordSize [ 
	
	^ 8
]

{ #category : #registers }
SpikeRISCVSimulator >> zero [ 
	
	"x0 should always hold the value 0"
	^ self readRegister: SpikeRISCVRegisters x0
]
