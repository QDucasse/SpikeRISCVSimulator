Class {
	#name : #SpikeRISCVSimulator,
	#superclass : #ProcessorSimulator,
	#category : #SpikeRiscVSimulator
}

{ #category : #disassembling }
SpikeRISCVSimulator >> disassembler [ 

	^ LLVMDisassembler riscv32
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
SpikeRISCVSimulator >> ra [ 

	"Return address"
	^ self readRegister: SpikeRISCVRegisters x1
]

{ #category : #registers }
SpikeRISCVSimulator >> sp [ 

	"Stack Pointer"
	^ self readRegister: SpikeRISCVRegisters x2
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
