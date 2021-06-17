Class {
	#name : #SpikeRISCVRegisters,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
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
	#category : #SpikeRiscVSimulator
}

{ #category : #accessing }
SpikeRISCVRegisters class >> enumDecl [ 

	^ #(
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
	#SPIKE_RISCV_REG_PC 32 
	)
]

{ #category : #accessing }
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
