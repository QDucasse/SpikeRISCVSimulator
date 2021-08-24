Class {
	#name : #SpikeRISCVSimulator,
	#superclass : #ProcessorSimulator,
	#category : #SpikeRISCVSimulator
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

	^ LLVMDisassembler riscv64
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

{ #category : #initialization }
SpikeRISCVSimulator >> initializeRegisterAliases [

	registerAliases
		at: #x0  put: #zero;
		at: #x1  put: #ra;
		at: #x2  put: #'sp     | sp';
		at: #x3  put: #gp;
		at: #x4  put: #tp;
		at: #x5  put: #'t0     | ip1';
		at: #x6  put: #'t1     | ip2';		
		at: #x7  put: #t2;
		at: #x8  put: #'s0(fp) | fp';		
		at: #x9  put: #s1;
		at: #x10 put: #'a0     | arg0';		
		at: #x11 put: #'a1     | arg1';
		at: #x12 put: #a2;	
		at: #x13 put: #a3;
		at: #x14 put: #a4;
		at: #x15 put: #a5;
		at: #x16 put: #a6;
		at: #x17 put: #a7;
		at: #x18 put: #'s2     | extra0';
		at: #x19 put: #'s3     | extra1';
		at: #x20 put: #'s4     | extra2';
		at: #x21 put: #s5;
		at: #x22 put: #'s6     | temp';
		at: #x23 put: #'s7     | class';
		at: #x24 put: #'s8     | receiver';
		at: #x25 put: #'s9     | argnum';
		at: #x26 put: #'s10   | varbase';
		at: #x27 put: #'s11   | flag';
		at: #x28 put: #t3; 
		at: #x29 put: #t4;
		at: #x30 put: #t5;
		at: #x31 put: #t6
]

{ #category : #registers }
SpikeRISCVSimulator >> instructionPointerRegister [
	
	"Instruction Pointer / Program Counter"
	^ SpikeRISCVRegisters pc
]

{ #category : #register }
SpikeRISCVSimulator >> lr [

	^ self x1
]

{ #category : #register }
SpikeRISCVSimulator >> pc [

	^ self readRegister: SpikeRISCVRegisters pc
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
SpikeRISCVSimulator >> registerList [

	^ #(lr pc sp fp x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x16 x19 x20 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31)
]

{ #category : #registers }
SpikeRISCVSimulator >> returnAddressRegisterValue: anInteger [ 
	
	self writeRegister: SpikeRISCVRegisters x1 value: anInteger
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

{ #category : #execution }
SpikeRISCVSimulator >> step [

	self
		startAt: self pc
		until: 0
		timeout: 0
		count: 1
]

{ #category : #register }
SpikeRISCVSimulator >> t0 [

	^ self x5
]

{ #category : #register }
SpikeRISCVSimulator >> t1 [

	^ self x6
]

{ #category : #register }
SpikeRISCVSimulator >> t2 [

	^ self x7
]

{ #category : #register }
SpikeRISCVSimulator >> t3 [

	^ self x28
]

{ #category : #register }
SpikeRISCVSimulator >> t4 [

	^ self x29
]

{ #category : #register }
SpikeRISCVSimulator >> t5 [

	^ self x30
]

{ #category : #register }
SpikeRISCVSimulator >> t6 [

	^ self x31
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

{ #category : #register }
SpikeRISCVSimulator >> x0 [

	^ self readRegister: SpikeRISCVRegisters x0
]

{ #category : #register }
SpikeRISCVSimulator >> x1 [

	^ self readRegister: SpikeRISCVRegisters x1
]

{ #category : #register }
SpikeRISCVSimulator >> x10 [

	^ self readRegister: SpikeRISCVRegisters x10
]

{ #category : #register }
SpikeRISCVSimulator >> x11 [

	^ self readRegister: SpikeRISCVRegisters x11
]

{ #category : #register }
SpikeRISCVSimulator >> x12 [

	^ self readRegister: SpikeRISCVRegisters x12
]

{ #category : #register }
SpikeRISCVSimulator >> x13 [

	^ self readRegister: SpikeRISCVRegisters x13
]

{ #category : #register }
SpikeRISCVSimulator >> x14 [

	^ self readRegister: SpikeRISCVRegisters x14
]

{ #category : #register }
SpikeRISCVSimulator >> x15 [

	^ self readRegister: SpikeRISCVRegisters x15
]

{ #category : #register }
SpikeRISCVSimulator >> x16 [

	^ self readRegister: SpikeRISCVRegisters x16
]

{ #category : #register }
SpikeRISCVSimulator >> x17 [

	^ self readRegister: SpikeRISCVRegisters x17
]

{ #category : #register }
SpikeRISCVSimulator >> x18 [

	^ self readRegister: SpikeRISCVRegisters x18
]

{ #category : #register }
SpikeRISCVSimulator >> x19 [

	^ self readRegister: SpikeRISCVRegisters x19
]

{ #category : #register }
SpikeRISCVSimulator >> x2 [

	^ self readRegister: SpikeRISCVRegisters x2
]

{ #category : #register }
SpikeRISCVSimulator >> x20 [

	^ self readRegister: SpikeRISCVRegisters x20
]

{ #category : #register }
SpikeRISCVSimulator >> x21 [

	^ self readRegister: SpikeRISCVRegisters x21
]

{ #category : #register }
SpikeRISCVSimulator >> x22 [

	^ self readRegister: SpikeRISCVRegisters x22
]

{ #category : #register }
SpikeRISCVSimulator >> x23 [

	^ self readRegister: SpikeRISCVRegisters x23
]

{ #category : #register }
SpikeRISCVSimulator >> x24 [

	^ self readRegister: SpikeRISCVRegisters x24
]

{ #category : #register }
SpikeRISCVSimulator >> x25 [

	^ self readRegister: SpikeRISCVRegisters x25
]

{ #category : #register }
SpikeRISCVSimulator >> x26 [

	^ self readRegister: SpikeRISCVRegisters x26
]

{ #category : #register }
SpikeRISCVSimulator >> x27 [

	^ self readRegister: SpikeRISCVRegisters x27
]

{ #category : #register }
SpikeRISCVSimulator >> x28 [

	^ self readRegister: SpikeRISCVRegisters x28
]

{ #category : #register }
SpikeRISCVSimulator >> x29 [

	^ self readRegister: SpikeRISCVRegisters x29
]

{ #category : #register }
SpikeRISCVSimulator >> x3 [

	^ self readRegister: SpikeRISCVRegisters x3
]

{ #category : #register }
SpikeRISCVSimulator >> x30 [

	^ self readRegister: SpikeRISCVRegisters x30
]

{ #category : #register }
SpikeRISCVSimulator >> x31 [

	^ self readRegister: SpikeRISCVRegisters x31
]

{ #category : #register }
SpikeRISCVSimulator >> x4 [

	^ self readRegister: SpikeRISCVRegisters x4
]

{ #category : #register }
SpikeRISCVSimulator >> x5 [

	^ self readRegister: SpikeRISCVRegisters x5
]

{ #category : #register }
SpikeRISCVSimulator >> x6 [

	^ self readRegister: SpikeRISCVRegisters x6
]

{ #category : #register }
SpikeRISCVSimulator >> x7 [

	^ self readRegister: SpikeRISCVRegisters x7
]

{ #category : #register }
SpikeRISCVSimulator >> x8 [

	^ self readRegister: SpikeRISCVRegisters x8
]

{ #category : #register }
SpikeRISCVSimulator >> x9 [

	^ self readRegister: SpikeRISCVRegisters x9
]

{ #category : #registers }
SpikeRISCVSimulator >> zero [ 
	
	"x0 should always hold the value 0"
	^ self readRegister: SpikeRISCVRegisters x0
]
