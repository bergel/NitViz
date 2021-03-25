Class {
	#name : #NitVizExample,
	#superclass : #Object,
	#category : #NitViz
}

{ #category : #'as yet unclassified' }
NitVizExample >> data [
	<script: 'self new data inspect'>
	"
	self new data
	"
	| entries raw entry |
	entries := OrderedCollection new.
	raw := (NeoCSVReader on: self dataAsString readStream) upToEnd.
	raw := raw allButFirst. 
	
	raw do: [ :aLine |
		entry := NVEntry new.
		entry index: aLine first asInteger.
		entry toolIdentifier: aLine second.
		entry year: aLine third asInteger.
		entry activities: aLine fourth.
		entry mainRETopics: aLine fifth.
		entry subtopics: aLine sixth.
		entry otherTopics: aLine seventh.
		entries add: entry
	].
	
	^ entries.
]

{ #category : #'as yet unclassified' }
NitVizExample >> dataAsString [

^ 'Index,Tool identifier,Year,Activities,Main RE topic,Subtopics,Other topics
1,T1,2019,S,Requirments documentation quality,Use Case,NLP
2,T2,2019,"A, E",CrowdRE,User feedback,"ML,
NLP"
3,T3,2019,V,Requirements validation,Prototyping,-
4,T4,2019,"S, A",GORE,i* modelling,-
5,T5,2019,S,GORE,i* modelling,-
6,T6,2018,M,Requirements and tests,-,NLP
7,T7,2018,M,Requirements @ Runtime,"Monitoring, 
Traceability",-
8,T8,2018,"M, S",Requirements and tests,Use Case,"NLP, 
Agile"
9,T9,2018,A,GORE,i* modelling,-
10,T10,2018,E,Requirements extraction,-,"NLP,
ML"
11,T11,2018,S,RE and usability evaluations,Modeling,-
12,T12,2018,S,GORE,i*modelling,-
13,T13,2018,A,RE and software sustainability,-,-
14,T14,2018,M,Requirements management,User stories,Agile
15,T15,2018,E,CrowdRE,"User feedback, 
Monitoring",ML
16,T16,2017,"S, A",GORE,"Model reasoning, 
i*modelling",ML
17,T17,2017,"A, S",Requirements and tests,-,-
18,T18,2017,M,Requiremenents prioritization,Gamification,"Collaborative,
Distributed"
19,T19,2017,A,Requirements documentation quality,Use Case,NLP
20,T20,2017,E,CrowdRE,-,ML
21,T21,2017,"A, M","CrowdRE
",Requirements visualization,"Collaborative,
ML"
22,T22,2017,V,Requirements and tests,Requirements validation,-
23,T23,2017,"A, M, S","
Requirements Extraction",CrowdRE,"ML,
NLP"
24,T24,2017,S,Requirments documentation quality,Requirements authoring,NLP
25,T25,2016,A,GORE,i*modelling,-
26,T26,2016,E,Video-based RE,-,-
27,T27,2016,S,Requirements modelling,"Model extraction/generation, 
User stories",NLP
28,T28,2016,S,Requirements and tests,-,Collaborative
29,T29,2016,S,Requirements modelling,CrowdRE,Collaborative
30,T30,2016,M,Requirements traceability,-,-
31,T31,2016,A,"RE and mobile software development, 
Scenario-based RE ",Use case,-
32,T32,2015,S,Requirments documentation quality,User stories,"Agile,
NLP"
33,T33,2015,S,Requirements modelling,Sketching,Collaborative
34,T34,2015,A,Requirements @ Runtime,Requirements and uncertainty,ML
35,T35,2015,"S, V",Requirements documentation quality,-,NLP
36,T36,2015,"S, A",RE and software architectures,NFR,-
37,T37,2015,E,Requirements extraction,-,-
38,T38,2015,"S, A",GORE,-,-
39,T39,2015,S,GORE,-,-
40,T40,2019,E,CrowdRE,User feedback,NLP
41,T41,2018,S,Automated classification,Requirments documentation quality,"NLP,
ML"
42,T42,2018,S,Requirments documentation quality,User stories,"Agile,
NLP"
43,T43,2017,S,RE and software product lines,-,-
44,T44,2017,"S, M","Requirements traceability, 
GORE",-,NLP
45,T45,2017,S,Requirments documentation quality,-,NLP
46,T46,2016,"S, A",GORE,-,-
47,T47,2016,S,RE education/training,Requirements modeling,-
48,T48,2015,A,"Safety/Security requirements, 
GORE",-,-
49,T49,2015,S,Formal specification,-,NLP
50,T50,2019,S,"RE and software architecture,
RE and software product lines",Variability modelling,-
51,T51,2019,S,CrowdRE,-,-
52,T52,2019,S,RE and mobile software development,-,-
53,T53,2019,S,RE and mobile software development ,Prototyping,-
54,T54,2019,"S, M",Requirements and uncertainty,-,Agile
55,T55,2019,S,RE and robotics,-,NLP
56,T56,2019,E,CrowdRE,User feedback,NLP
57,T57,2018,E,CrowdRE,User feedback,NLP
58,T58,2018,V,RE and mobile software development ,-,ML
59,T59,2017,E,"
Requirements extraction",User stories,"Agile,
ML,
NLP"
60,T60,2017,A,"RE and software architecture, 
GORE",-,-
61,T61,2017,S,Formal specification,Requirements documentation quality,-
62,T62,2015,M,Requirements management,"Impact analysis,
Change management",NLP
63,T63,2019,A,Formal specification,-,-
64,T64,2019,E,RE and business engineering,-,NLP
65,T65,2017,V,RE and business engineering,-,-
66,T66,2017,V,RE and usability evaluations,-,Agile
67,T67,2016,A,Requirements modelling,"Use case, 
Model extraction/generation",NLP
68,T68,2016,V,Requirements validation,Use case,Collaborative
69,T69,2018,"E, S",Requirements extraction,Source code,-
70,T70,2019,S,Requirments documentation quality,Use case,NLP
71,T71,2019,"A, S",Requirements and tests,-,NLP
72,T72,2019,S,"Formal specification, 
Safety/Security requirements",-,-
73,T73,2019,E,RE and business engineering ,Information requirements gathering,-
74,T74,2018,E,Values and emotions in RE,-,-
75,T75,2018,"A, E","Requirements generation, Safety/Security requirements",-,-
76,T76,2018,"A, M","CrowdRE,
Decision support

",Requirements visualization,"NLP,
ML"
77,T77,2018,M,Decision support,Requirements visualization,Agile
78,T78,2018,"S, A",GORE,-,-
79,T79,2018," A, S, V",RE and business engineering,Information quality,-
80,T80,2018,"A, E, S, V",CrowdRE,-,Agile
81,T81,2017,M,RE and business engineering,-,"Collaborative,
Agile"
82,T82,2017,S,Requirements modelling,"User stories, 
Model extraction/generation","Agile,
NLP"
83,T83,2017,S,RE and legal,Requirements documentation quality,NLP
84,T84,2017,V,RE and software sustainability,-,ML
85,T85,2017,"A, S","Adaptive systems,
GORE",-,ML
86,T86,2016,E,RE and business engineering,-,Collaborative
87,T87,2016,A,CrowdRE,-,"ML,
NLP"
88,T88,2016,S,Requirments documentation quality,User stories,"NLP,
Agile"
89,T89,2015,S,Requirements traceability,-,"ML,
NLP"
90,T90,2015,A,RE and legal,Requirements extraction,NLP
91,T91,2019,E,CrowdRE,-,"ML,
NLP"
92,T92,2015,M,Requiremenents prioritization,-,NLP
93,T93,2018,"M, S, V",Requirements validation,-,-
94,T94,2018,M,Requirements traceability,-,Collaborative
95,T95,2018,"A, S, V",Requirements and uncertainty,Use case,-
96,T96,2018,"A, V","Rquirements and tests
",Variability modelling,-
97,T97,2017,"S, V",Requirments documentation quality,-,"Agile,
NLP"
98,T98,2019,S,Requirments documentation quality,User stories,"NLP,
Agile"
99,T99,2019,M,Requirements and tests,-,Agile
100,T100,2019,"A, S, V",Information quality,"
GORE",RE and business engineering
101,T101,2019,"A, E","GORE, 
RE and creativity",-,-
102,T102,2018,V,"RE education/training, 
Safety/Security requirements",-,-
103,T103,2018,E,"Requirements extraction, 
RE and business engineering",-,BPM
104,T104,2017,E,Adaptive systems ,Variability modelling,-
105,T105,2016,S,"GORE, 
Requirements @ Runtime",-,-
106,T106,2016,A,Requirments documentation quality,-,"NLP,
ML"
107,T107,2016,M,Requirements management,Cost estimation,-
108,T108,2016,M,Requirements management,"Impact analysis,
Change management",Distributed
109,T109,2015,"A, E, M",Requirements modelling,GORE,-
110,T110,2015,A,Requirements and software architecture,-,"ML,
NLP"
111,T111,2019,S,Formal specification,-,-
112,T112,2018,A,"GORE, 
Safety/Security requirements",i* modelling,-'
]

{ #category : #'as yet unclassified' }
NitVizExample >> model [
	<script: 'self new model inspect'>
	"
	self new model
	"
	| model |
	model := NVModel new.
	model entries: self data.
	model build.
	^ model
]
