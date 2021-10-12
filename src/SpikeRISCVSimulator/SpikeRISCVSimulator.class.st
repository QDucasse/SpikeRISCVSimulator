Class {
	#name : #SpikeRISCVSimulator,
	#superclass : #ProcessorSimulator,
	#category : #SpikeRISCVSimulator
}

{ #category : #'as yet unclassified' }
SpikeRISCVSimulator class >> supportsISA: isa [ 
	
	^ isa = #riscv64
]

{ #category : #registers }
SpikeRISCVSimulator >> arg0Register [
	
	^ SpikeRISCVRegisters x10
]

{ #category : #registers }
SpikeRISCVSimulator >> arg1Register [

	^ SpikeRISCVRegisters x11
]

{ #category : #registers }
SpikeRISCVSimulator >> argument0RegisterValue [
	
	^ self x10
]

{ #category : #accessing }
SpikeRISCVSimulator >> argument0RegisterValue: anInteger [ 

	self writeRegister: SpikeRISCVRegisters x10 value: anInteger
]

{ #category : #registers }
SpikeRISCVSimulator >> baseRegister [

	^ SpikeRISCVRegisters x26
]

{ #category : #'as yet unclassified' }
SpikeRISCVSimulator >> cResultRegister [

	^ self x12
]

{ #category : #'c calling convention' }
SpikeRISCVSimulator >> carg0Register [

	^ SpikeRISCVRegisters x12
]

{ #category : #'c calling convention' }
SpikeRISCVSimulator >> carg1Register [

	^ SpikeRISCVRegisters x13
]

{ #category : #'c calling convention' }
SpikeRISCVSimulator >> carg2Register [

	^ SpikeRISCVRegisters x14
]

{ #category : #'c calling convention' }
SpikeRISCVSimulator >> carg3Register [

	^ SpikeRISCVRegisters x15
]

{ #category : #register }
SpikeRISCVSimulator >> disassembler [ 

	^ LLVMRV64Disassembler riscv64
]

{ #category : #registers }
SpikeRISCVSimulator >> doublePrecisionFloatingPointRegister0 [

	^ SpikeRISCVRegisters f0
]

{ #category : #registers }
SpikeRISCVSimulator >> doublePrecisionFloatingPointRegister1 [

	^ SpikeRISCVRegisters f1
]

{ #category : #registers }
SpikeRISCVSimulator >> doublePrecisionFloatingPointRegister2 [

	^ SpikeRISCVRegisters f2
]

{ #category : #register }
SpikeRISCVSimulator >> f0 [

	^ self readRegister: SpikeRISCVRegisters f0
]

{ #category : #register }
SpikeRISCVSimulator >> f1 [

	^ self readRegister: SpikeRISCVRegisters f1
]

{ #category : #register }
SpikeRISCVSimulator >> f10 [

	^ self readRegister: SpikeRISCVRegisters f10
]

{ #category : #register }
SpikeRISCVSimulator >> f11 [

	^ self readRegister: SpikeRISCVRegisters f11
]

{ #category : #register }
SpikeRISCVSimulator >> f12 [

	^ self readRegister: SpikeRISCVRegisters f12
]

{ #category : #register }
SpikeRISCVSimulator >> f13 [

	^ self readRegister: SpikeRISCVRegisters f13
]

{ #category : #register }
SpikeRISCVSimulator >> f14 [

	^ self readRegister: SpikeRISCVRegisters f14
]

{ #category : #register }
SpikeRISCVSimulator >> f15 [

	^ self readRegister: SpikeRISCVRegisters f15
]

{ #category : #register }
SpikeRISCVSimulator >> f16 [

	^ self readRegister: SpikeRISCVRegisters f16
]

{ #category : #register }
SpikeRISCVSimulator >> f17 [

	^ self readRegister: SpikeRISCVRegisters f17
]

{ #category : #register }
SpikeRISCVSimulator >> f18 [

	^ self readRegister: SpikeRISCVRegisters f18
]

{ #category : #register }
SpikeRISCVSimulator >> f19 [

	^ self readRegister: SpikeRISCVRegisters f19
]

{ #category : #register }
SpikeRISCVSimulator >> f2 [

	^ self readRegister: SpikeRISCVRegisters f2
]

{ #category : #register }
SpikeRISCVSimulator >> f20 [

	^ self readRegister: SpikeRISCVRegisters f20
]

{ #category : #register }
SpikeRISCVSimulator >> f21 [

	^ self readRegister: SpikeRISCVRegisters f21
]

{ #category : #register }
SpikeRISCVSimulator >> f22 [

	^ self readRegister: SpikeRISCVRegisters f22
]

{ #category : #register }
SpikeRISCVSimulator >> f23 [

	^ self readRegister: SpikeRISCVRegisters f23
]

{ #category : #register }
SpikeRISCVSimulator >> f24 [

	^ self readRegister: SpikeRISCVRegisters f24
]

{ #category : #register }
SpikeRISCVSimulator >> f25 [

	^ self readRegister: SpikeRISCVRegisters f25
]

{ #category : #register }
SpikeRISCVSimulator >> f26 [

	^ self readRegister: SpikeRISCVRegisters f26
]

{ #category : #register }
SpikeRISCVSimulator >> f27 [

	^ self readRegister: SpikeRISCVRegisters f27
]

{ #category : #register }
SpikeRISCVSimulator >> f28 [

	^ self readRegister: SpikeRISCVRegisters f28
]

{ #category : #register }
SpikeRISCVSimulator >> f29 [

	^ self readRegister: SpikeRISCVRegisters f29
]

{ #category : #register }
SpikeRISCVSimulator >> f3 [

	^ self readRegister: SpikeRISCVRegisters f3
]

{ #category : #register }
SpikeRISCVSimulator >> f30 [

	^ self readRegister: SpikeRISCVRegisters f30
]

{ #category : #register }
SpikeRISCVSimulator >> f31 [

	^ self readRegister: SpikeRISCVRegisters f31
]

{ #category : #register }
SpikeRISCVSimulator >> f4 [

	^ self readRegister: SpikeRISCVRegisters f4
]

{ #category : #register }
SpikeRISCVSimulator >> f5 [

	^ self readRegister: SpikeRISCVRegisters f5
]

{ #category : #register }
SpikeRISCVSimulator >> f6 [

	^ self readRegister: SpikeRISCVRegisters f6
]

{ #category : #register }
SpikeRISCVSimulator >> f7 [

	^ self readRegister: SpikeRISCVRegisters f7
]

{ #category : #register }
SpikeRISCVSimulator >> f8 [

	^ self readRegister: SpikeRISCVRegisters f8
]

{ #category : #register }
SpikeRISCVSimulator >> f9 [

	^ self readRegister: SpikeRISCVRegisters f9
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

{ #category : #execution }
SpikeRISCVSimulator >> hasLinkRegister [ 

	^ true
]

{ #category : #initialization }
SpikeRISCVSimulator >> initialize [ 
	
	super initialize.
	simulator := Spike new.
	self initializeRegisterAliases.
	self initializeRegisterSmalltalkAliases.
]

{ #category : #initialization }
SpikeRISCVSimulator >> initializeRegisterAliases [

	registerAliases
		at: #x0  put: #zero;
		at: #x1  put: #ra;
		at: #x2  put: #sp; "Smalltalk sp" 
		at: #x3  put: #gp;
		at: #x4  put: #tp;
		at: #x5  put: #t0; "Smalltalk ip1"
		at: #x6  put: #t1;	 "Smalltalk ip2"
		at: #x7  put: #t2;
		at: #x8  put: #fp; "Smalltalk fp"		
		at: #x9  put: #s1;
		at: #x10 put: #a0; "Smalltalk arg0"		
		at: #x11 put: #a1; "Smalltalk arg1"
		at: #x12 put: #a2; "Smalltalk carg0"	
		at: #x13 put: #a3; "Smalltalk carg1"
		at: #x14 put: #a4; "Smalltalk carg2"
		at: #x15 put: #a5; "Smalltalk carg3"
		at: #x16 put: #a6;
		at: #x17 put: #a7;
		at: #x18 put: #s2;  "Smalltalk extra0"
		at: #x19 put: #s3;  "Smalltalk extra1"
		at: #x20 put: #s4;  "Smalltalk extra2"
		at: #x21 put: #s5;
		at: #x22 put: #s6;  "Smalltalk temp"
		at: #x23 put: #s7;  "Smalltalk classreg"
		at: #x24 put: #s8;  "Smalltalk receiver"
		at: #x25 put: #s9;  "Smalltalk argnum"
		at: #x26 put: #s10; "Smalltalk varbase"
		at: #x27 put: #s11; "Smalltalk flag"
		at: #x28 put: #t3; 
		at: #x29 put: #t4;
		at: #x30 put: #t5;
		at: #x31 put: #t6
]

{ #category : #initialization }
SpikeRISCVSimulator >> initializeRegisterSmalltalkAliases [

	registerSmalltalkAliases
		at: #x2  put: #sp;
		at: #x5  put: #ip1;
		at: #x6  put: #ip2;
		at: #x8  put: #fp;
		at: #x10 put: #arg0;
		at: #x11 put: #arg1;
		at: #x12 put: #carg0;
		at: #x13 put: #carg1;
		at: #x14 put: #carg2;
		at: #x15 put: #carg3;
		at: #x18 put: #extra0;
		at: #x19 put: #extra1;
		at: #x20 put: #extra2;
		at: #x22 put: #temp;
		at: #x23 put: #class;
		at: #x24 put: #receiver;
		at: #x25 put: #argnum;
		at: #x26 put: #varbase;
		at: #x27 put: #flag
]

{ #category : #registers }
SpikeRISCVSimulator >> instructionPointerRegister [

	^ SpikeRISCVRegisters pc
]

{ #category : #registers }
SpikeRISCVSimulator >> linkRegister [

	^ SpikeRISCVRegisters x1
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
SpikeRISCVSimulator >> ra [ 

	"Return address"
	^ self readRegister: SpikeRISCVRegisters x1
]

{ #category : #registers }
SpikeRISCVSimulator >> receiverRegister [
	
	^ SpikeRISCVRegisters x24
]

{ #category : #registers }
SpikeRISCVSimulator >> registerList [

	^ #(lr pc sp fp 
		 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 
		 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31)
		 "f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 
		 f17 f18 f19 f20 f21 f22 f23 f24 f25 f26 f27 f28 f29 f30 f31)"
]

{ #category : #registers }
SpikeRISCVSimulator >> sendNumberOfArgumentsRegister [

	^ SpikeRISCVRegisters x25 
]

{ #category : #'as yet unclassified' }
SpikeRISCVSimulator >> simulateLeafCallOf: destinationAddress nextpc: returnAddress memory: anUndefinedObject [ 

	self linkRegisterValue: returnAddress.
	self instructionPointerRegisterValue: destinationAddress
]

{ #category : #registers }
SpikeRISCVSimulator >> smashRegisterAccessors [
	
	"Caller saved registers to smash"
	^#( x1: x5: x6: x7: x10: x11: x12: x13: x14: x15: x16: x17: x28: x29: x30: x31:)
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
SpikeRISCVSimulator >> temporaryRegister [

	^ SpikeRISCVRegisters x22
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
