Class {
	#name : #SpikeRISCVRegisters,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'SPIKE_RISCV_REG_F0',
		'SPIKE_RISCV_REG_F1',
		'SPIKE_RISCV_REG_F10',
		'SPIKE_RISCV_REG_F11',
		'SPIKE_RISCV_REG_F12',
		'SPIKE_RISCV_REG_F13',
		'SPIKE_RISCV_REG_F14',
		'SPIKE_RISCV_REG_F15',
		'SPIKE_RISCV_REG_F16',
		'SPIKE_RISCV_REG_F17',
		'SPIKE_RISCV_REG_F18',
		'SPIKE_RISCV_REG_F19',
		'SPIKE_RISCV_REG_F2',
		'SPIKE_RISCV_REG_F20',
		'SPIKE_RISCV_REG_F21',
		'SPIKE_RISCV_REG_F22',
		'SPIKE_RISCV_REG_F23',
		'SPIKE_RISCV_REG_F24',
		'SPIKE_RISCV_REG_F25',
		'SPIKE_RISCV_REG_F26',
		'SPIKE_RISCV_REG_F27',
		'SPIKE_RISCV_REG_F28',
		'SPIKE_RISCV_REG_F29',
		'SPIKE_RISCV_REG_F3',
		'SPIKE_RISCV_REG_F30',
		'SPIKE_RISCV_REG_F31',
		'SPIKE_RISCV_REG_F4',
		'SPIKE_RISCV_REG_F5',
		'SPIKE_RISCV_REG_F6',
		'SPIKE_RISCV_REG_F7',
		'SPIKE_RISCV_REG_F8',
		'SPIKE_RISCV_REG_F9',
		'SPIKE_RISCV_REG_PC',
		'SPIKE_RISCV_REG_X0',
		'SPIKE_RISCV_REG_X1',
		'SPIKE_RISCV_REG_X10',
		'SPIKE_RISCV_REG_X11',
		'SPIKE_RISCV_REG_X12',
		'SPIKE_RISCV_REG_X13',
		'SPIKE_RISCV_REG_X14',
		'SPIKE_RISCV_REG_X15',
		'SPIKE_RISCV_REG_X16',
		'SPIKE_RISCV_REG_X17',
		'SPIKE_RISCV_REG_X18',
		'SPIKE_RISCV_REG_X19',
		'SPIKE_RISCV_REG_X2',
		'SPIKE_RISCV_REG_X20',
		'SPIKE_RISCV_REG_X21',
		'SPIKE_RISCV_REG_X22',
		'SPIKE_RISCV_REG_X23',
		'SPIKE_RISCV_REG_X24',
		'SPIKE_RISCV_REG_X25',
		'SPIKE_RISCV_REG_X26',
		'SPIKE_RISCV_REG_X27',
		'SPIKE_RISCV_REG_X28',
		'SPIKE_RISCV_REG_X29',
		'SPIKE_RISCV_REG_X3',
		'SPIKE_RISCV_REG_X30',
		'SPIKE_RISCV_REG_X31',
		'SPIKE_RISCV_REG_X4',
		'SPIKE_RISCV_REG_X5',
		'SPIKE_RISCV_REG_X6',
		'SPIKE_RISCV_REG_X7',
		'SPIKE_RISCV_REG_X8',
		'SPIKE_RISCV_REG_X9'
	],
	#category : #SpikeRISCVSimulator
}

{ #category : #initialization }
SpikeRISCVRegisters class >> enumDecl [ 

	"self initialize to make the changes effective"
	^ #(
	"General registers"
   #SPIKE_RISCV_REG_X0  0
   #SPIKE_RISCV_REG_X1  1 
	#SPIKE_RISCV_REG_X2  2
	#SPIKE_RISCV_REG_X3  3 
	#SPIKE_RISCV_REG_X4  4
	#SPIKE_RISCV_REG_X5  5
	#SPIKE_RISCV_REG_X6  6
	#SPIKE_RISCV_REG_X7  7 
	#SPIKE_RISCV_REG_X8  8
	#SPIKE_RISCV_REG_X9  9
	#SPIKE_RISCV_REG_X10 10
	#SPIKE_RISCV_REG_X11 11
	#SPIKE_RISCV_REG_X12 12
	#SPIKE_RISCV_REG_X13 13
	#SPIKE_RISCV_REG_X14 14 
	#SPIKE_RISCV_REG_X15 15 
	#SPIKE_RISCV_REG_X16 16
	#SPIKE_RISCV_REG_X17 17
	#SPIKE_RISCV_REG_X18 18 
	#SPIKE_RISCV_REG_X19 19 
	#SPIKE_RISCV_REG_X20 20
	#SPIKE_RISCV_REG_X21 21 
	#SPIKE_RISCV_REG_X22 22
	#SPIKE_RISCV_REG_X23 23
	#SPIKE_RISCV_REG_X24 24
	#SPIKE_RISCV_REG_X25 25
	#SPIKE_RISCV_REG_X26 26
	#SPIKE_RISCV_REG_X27 27
	#SPIKE_RISCV_REG_X28 28
	#SPIKE_RISCV_REG_X29 29
	#SPIKE_RISCV_REG_X30 30 
	#SPIKE_RISCV_REG_X31 31
	"PC"
	#SPIKE_RISCV_REG_PC  32 
	"Floating Point Registers"
	#SPIKE_RISCV_REG_F0  33
	#SPIKE_RISCV_REG_F1  34
	#SPIKE_RISCV_REG_F2  35  
	#SPIKE_RISCV_REG_F3  36
	#SPIKE_RISCV_REG_F4  37
	#SPIKE_RISCV_REG_F5  38
	#SPIKE_RISCV_REG_F6  39
	#SPIKE_RISCV_REG_F7  40
	#SPIKE_RISCV_REG_F8  41
	#SPIKE_RISCV_REG_F9  42
	#SPIKE_RISCV_REG_F10 43
	#SPIKE_RISCV_REG_F11 44
	#SPIKE_RISCV_REG_F12 45
	#SPIKE_RISCV_REG_F13 46
	#SPIKE_RISCV_REG_F14 47
	#SPIKE_RISCV_REG_F15 48
	#SPIKE_RISCV_REG_F16 49
	#SPIKE_RISCV_REG_F17 50
	#SPIKE_RISCV_REG_F18 51
	#SPIKE_RISCV_REG_F19 52
	#SPIKE_RISCV_REG_F20 53
	#SPIKE_RISCV_REG_F21 54
	#SPIKE_RISCV_REG_F22 55
	#SPIKE_RISCV_REG_F23 56
	#SPIKE_RISCV_REG_F24 57
	#SPIKE_RISCV_REG_F25 58
	#SPIKE_RISCV_REG_F26 59
	#SPIKE_RISCV_REG_F27 60
	#SPIKE_RISCV_REG_F28 61
	#SPIKE_RISCV_REG_F29 62
	#SPIKE_RISCV_REG_F30 63
	#SPIKE_RISCV_REG_F31 64
	)
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f0 [
	
	^ SPIKE_RISCV_REG_F0
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f1 [
	
	^ SPIKE_RISCV_REG_F1
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f10 [
	
	^ SPIKE_RISCV_REG_F10
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f11 [
	
	^ SPIKE_RISCV_REG_F11
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f12 [
	
	^ SPIKE_RISCV_REG_F12
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f13 [
	
	^ SPIKE_RISCV_REG_F13
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f14 [
	
	^ SPIKE_RISCV_REG_F14
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f15 [
	
	^ SPIKE_RISCV_REG_F15
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f16 [
	
	^ SPIKE_RISCV_REG_F16
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f17 [
	
	^ SPIKE_RISCV_REG_F17
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f18 [
	
	^ SPIKE_RISCV_REG_F18
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f19 [
	
	^ SPIKE_RISCV_REG_F19
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f2 [
	
	^ SPIKE_RISCV_REG_F2
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f20 [
	
	^ SPIKE_RISCV_REG_F20
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f21 [
	
	^ SPIKE_RISCV_REG_F21
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f22 [
	
	^ SPIKE_RISCV_REG_F22
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f23 [
	
	^ SPIKE_RISCV_REG_F23
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f24 [
	
	^ SPIKE_RISCV_REG_F24
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f25 [
	
	^ SPIKE_RISCV_REG_F25
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f26 [
	
	^ SPIKE_RISCV_REG_F26
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f27 [
	
	^ SPIKE_RISCV_REG_F27
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f28 [
	
	^ SPIKE_RISCV_REG_F28
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f29 [
	
	^ SPIKE_RISCV_REG_F29
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f3 [
	
	^ SPIKE_RISCV_REG_F3
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f30 [
	
	^ SPIKE_RISCV_REG_F30
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f31 [
	
	^ SPIKE_RISCV_REG_F31
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f4 [
	
	^ SPIKE_RISCV_REG_F4
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f5 [
	
	^ SPIKE_RISCV_REG_F5
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f6 [
	
	^ SPIKE_RISCV_REG_F6
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f7 [
	
	^ SPIKE_RISCV_REG_F7
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f8 [
	
	^ SPIKE_RISCV_REG_F8
]

{ #category : #accessing }
SpikeRISCVRegisters class >> f9 [
	
	^ SPIKE_RISCV_REG_F9
]

{ #category : #initialization }
SpikeRISCVRegisters class >> initialize [ 
	
	self initializeEnumeration 
]

{ #category : #accessing }
SpikeRISCVRegisters class >> pc [
	
	^ SPIKE_RISCV_REG_PC
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x0 [ 
	
	^ SPIKE_RISCV_REG_X0
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x1 [ 
	
	^ SPIKE_RISCV_REG_X1
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x10 [
	
	^ SPIKE_RISCV_REG_X10
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x11 [
	
	^ SPIKE_RISCV_REG_X11
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x12 [
	
	^ SPIKE_RISCV_REG_X12
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x13 [
	
	^ SPIKE_RISCV_REG_X13
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x14 [
	
	^ SPIKE_RISCV_REG_X14
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x15 [
	
	^ SPIKE_RISCV_REG_X15
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x16 [
	
	^ SPIKE_RISCV_REG_X16
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x17 [
	
	^ SPIKE_RISCV_REG_X17
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x18 [
	
	^ SPIKE_RISCV_REG_X18
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x19 [
	
	^ SPIKE_RISCV_REG_X19
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x2 [ 
	
	^ SPIKE_RISCV_REG_X2
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x20 [
	
	^ SPIKE_RISCV_REG_X20
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x21 [
	
	^ SPIKE_RISCV_REG_X21
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x22 [
	
	^ SPIKE_RISCV_REG_X22
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x23 [
	
	^ SPIKE_RISCV_REG_X23
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x24 [
	
	^ SPIKE_RISCV_REG_X24
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x25 [
	
	^ SPIKE_RISCV_REG_X25
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x26 [
	
	^ SPIKE_RISCV_REG_X26
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x27 [
	
	^ SPIKE_RISCV_REG_X27
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x28 [
	
	^ SPIKE_RISCV_REG_X28
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x29 [
	
	^ SPIKE_RISCV_REG_X29
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x3 [ 
	
	^ SPIKE_RISCV_REG_X3
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x30 [
	
	^ SPIKE_RISCV_REG_X30
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x31 [
	
	^ SPIKE_RISCV_REG_X31
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x4 [ 
	
	^ SPIKE_RISCV_REG_X4
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x5 [ 
	
	^ SPIKE_RISCV_REG_X5
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x6 [ 
	
	^ SPIKE_RISCV_REG_X6
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x7 [ 
	
	^ SPIKE_RISCV_REG_X7
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x8 [
	
	^ SPIKE_RISCV_REG_X8
]

{ #category : #accessing }
SpikeRISCVRegisters class >> x9 [
	
	^ SPIKE_RISCV_REG_X9
]

{ #category : #converting }
SpikeRISCVRegisters >> asInteger [
	^ self value
]
