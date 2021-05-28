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
	raw := (NeoCSVReader on: self dataAsString2 readStream) upToEnd.
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
NitVizExample >> data3 [
	<script: 'self new data3 inspect'>
	"
	self new data
	"
	| entries raw entry |
	entries := OrderedCollection new.
	raw := (NeoCSVReader on: self dataAsString3 readStream) upToEnd.
	raw := raw allButFirst. 
	
	raw do: [ :aLine |
		entry := NVEntry new.
		entry index: aLine first asInteger.
		entry toolIdentifier: aLine second.
		entry year: aLine third asInteger.
		"entry activities: aLine fourth."
		entry mainRETopicsAsString: aLine fourth.
		entry subtopicsAsString: aLine fifth.
		entry otherTopics: aLine sixth.
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
NitVizExample >> dataAsString2 [

^ 'Index,Tool identifier,Year,Activities,Author keywords,Main RE topic,Subtopics,Other topics
1,T1,2019,S,"Use case descriptions,
Smell detection,
GQM
",Requirements documentation quality,Use Case,NLP
2,T2,2019,"A, E","Requirements Intelligence, 
Data-Driven Requirements, 
Data Mining, 
Social Media Analytics, 
App Store Analytics",CrowdRE,User feedback,"ML,
NLP"
3,T3,2019,V,"Requirements, 
Requirements Validation, 
Consistency Checking, 
Prototype, 
Prototyping",Requirements validation,Prototyping,-
4,T4,2019,"S, A","Goal model annotation, 
Context accumulation,
Conflict resolution",GORE,i* modelling,-
5,T5,2019,S,"i*, 
Textual modelling, 
Textual template, 
Prototype",GORE,i* modelling,-
6,T6,2018,M,-,Requirements and tests,-,NLP
7,T7,2018,M,"Requirements Monitoring, 
Systems of Systems,
Requirements Traceability",Requirements @ Runtime,"Monitoring, 
Traceability",-
8,T8,2018,"M, S","Agile Development, 
Requirements Engineering,
Model-Based Testing, 
Use case specification",Requirements and tests,Use Case,"NLP, 
Agile"
9,T9,2018,A,-,GORE,i* modelling,-
10,T10,2018,E,"Requirements elicitation, 
Natural language processing, 
Tool support, 
SVMs, 
Information extraction",Requirements extraction,-,"NLP,
ML"
11,T11,2018,S,"Graphical Models, 
Requirements Engineering,
modelling Tools, 
User Interface",RE and usability evaluations,modelling,-
12,T12,2018,S,"Requirements Engineering,
Goal modelling,
modelling tool",GORE,i*modelling,-
13,T13,2018,A,"Sustainability Profiling,
Requirement Engineering,
Analysing Sustainability,
Sustainable Software,
SuSoftPro,
Supporting Tool,
Sustainability Requirements",RE and software sustainability,-,-
14,T14,2018,M,"Requirements engineering,
Large-scale agile, 
Tooling",Requirements management,User stories,Agile
15,T15,2018,E,"Feedback gathering, 
Usage monitoring, 
Requirements, 
User involvement, 
Feedback acquisition, 
Data collection, 
Requirements elicitation, 
Software evolution, 
User feedback",CrowdRE,"User feedback, 
Monitoring",ML
16,T16,2017,"S, A","Requirements engineering,
Softgoals,
Optimization, 
Search-based software engineering",GORE,"Model reasoning, 
i*modelling",ML
17,T17,2017,"A, S","Model, 
Requirements capture, 
Formal methods",Requirements and tests,-,-
18,T18,2017,M,"Gamification,
Collaborative requirements prioritization, 
Quasi-experiment",Requirements  prioritization,Gamification,"Collaborative,
Distributed"
19,T19,2017,A,"Use case,
Checklist,
Authoring guidelines,
Requirement analysis",Requirements documentation quality,Use Case,NLP
20,T20,2017,E,"Requirements engineering, 
Transportation Management, 
Tool Development, 
Traffic Signal Timing",CrowdRE,-,ML
21,T21,2017,"A, M","Tools,
Personnel,
Data models,
Predictive models,
Companies","CrowdRE
",Requirements visualization,"Collaborative,
ML"
22,T22,2017,V,"Conceptual Schema Validation, 
Requirements based testing, 
Model-driven validation, 
Conceptual Schema Testing",Requirements and tests,Requirements validation,-
23,T23,2017,"A, M, S","Data mining,
Requirements engineering,
Natural languages,
Java,
Relational databases,
Social network services,
Systematics","
Requirements Extraction",CrowdRE,"ML,
NLP"
24,T24,2017,S,"Requirements authoring tool,
Client server tool,
Relationships,
Transport sector,
Tool demo,
Constrained natural language,
Parser generator",Requirements documentation quality,Requirements authoring,NLP
25,T25,2016,A,"Urban areas,
Stakeholders,
Analytical models,
Compounds,
Waste management,
Stochastic processes,
Requirements engineering",GORE,i*modelling,-
26,T26,2016,E,"Requirements elicitation, 
workshop video, 
requirements quality, 
video analysis",Video-based RE,-,-
27,T27,2016,S,"User stories, 
conceptual modelling, 
NLP",Requirements modelling,"Model extraction/generation, 
User stories",NLP
28,T28,2016,S,"Problem Frames,
Problem progression, 
Behavior-driven development",Requirements and tests,-,Collaborative
29,T29,2016,S,"Stigmergy, 
Conceptual modelling,
Collaborative modelling",Requirements modelling,CrowdRE,Collaborative
30,T30,2016,M,"Traceability, 
Requirements Traceability",Requirements traceability,-,-
31,T31,2016,A,"Mobility Requirements, 
Scenarios, 
Situational Contexts, 
Interaction, 
Tools",RE and mobile software development,"Use case,
Scenario-based RE",-
32,T32,2015,S,"User stories, 
Requirements quality, 
AQUSA,
QUS Framework, 
Requirements engineering, 
NLP",Requirements documentation quality,User stories,"Agile,
NLP"
33,T33,2015,S,"Requirements engineering, 
Collaboration, 
Tool,
Sketching, 
Ad-hoc modelling, 
Notation definition, 
Meetings",Requirements modelling,Sketching,Collaborative
34,T34,2015,A,"Vehicles,
Runtime,
Uncertainty,
Context,
Java,
Data mining,
Adaptive systems",Requirements @ Runtime,Requirements and uncertainty,ML
35,T35,2015,"S, V","Unified modelling language,
Documentation,
Requirements engineering,
Natural languages,
Analytical models,
Automotive engineering,
Lighting",Requirements documentation quality,-,NLP
36,T36,2015,"S, A","Non-functional requirements (NFRs), 
Software architecture, 
Architecture reconfiguration",RE and software architecture,NFR,-
37,T37,2015,E,"Cloud computing,
Lattices,
Analytical models,
Unified modelling language,
Computational modelling,
Decision making,
Data models",Requirements extraction,-,-
38,T38,2015,"S, A","Cognition,
Unified modelling language,
Requirements engineering,
Estimation,
Statistical analysis,
Safety,
Analytical models",GORE,-,-
39,T39,2015,S,"Goal modelling tool, 
Web tool, 
Statechart Derivation, 
Requirements-driven software adaptation",GORE,-,-
40,T40,2019,E,"Requirements engineering,
SWOT analysis,
Natural language processing,
Requirements analytics,
CrowdRE",CrowdRE,User feedback,NLP
41,T41,2018,S,"Requirements engineering,
Machine learning, 
Convolution Nneural networks,
Natural language processing",Automated classification,Requirements documentation quality,"NLP,
ML"
42,T42,2018,S,"Natural language processing,
Requirements engineerring,
Information visualization,
User stories,
Ambiguity",Requirements documentation quality,User stories,"Agile,
NLP"
43,T43,2017,S,"Product line engineering,
Use case-driven development",RE and software product lines,-,-
44,T44,2017,"S, M","Requirements traceability,
Goal modelling,
Controlled English,
Mission assurance,
Mission configurability",Requirements traceability,GORE,NLP
45,T45,2017,S,"Requirements engineering,
Business requirements,
Natural language,
Ambiguity,
Software quality,
Context-insensitive analysis,
Tactile check",Requirements documentation quality,-,NLP
46,T46,2016,"S, A","Analytic Hierarchy Process,
Enterprise Architecture,
Goal model,
Multi Criterion Decision Analysis,
Soft System Methodology",GORE,-,-
47,T47,2016,S,"Requirements engineering,
Metamodel,
CASE tool,
Engineering education,
Embedded domain-specific language,
Empirical software engineering",RE education/training,Requirements modelling,-
48,T48,2015,A,"Security requirement,
Security mechanism,
Goal model,
Requirements engineer,
Virtual private network",Safety/Security requirements,GORE,-
49,T49,2015,S,"Formal specification,
Temporal requirements,
Translation,
Requirementts comprehension",Formal specification,-,NLP
50,T50,2019,S,"Embedded system design engineering,
Variability modelling,
Model checking,
Non functional property,
Multi objective optimization",RE and software architecture,"Variability modelling,
RE and software product lines",-
51,T51,2019,S,"End-user programming,
Trigger-action programming,
Program synthesis,
Program repair,",CrowdRE,-,-
52,T52,2019,S,"Android app,
Story board,
Competitive analysis,
App review",RE and mobile software development,-,-
53,T53,2019,S,"Search engine,
Android,
GUI,
UI/UX",RE and mobile software development ,Prototyping,-
54,T54,2019,"S, M","Uncertainity,
Management,
Trace,
Git,
IDE",Requirements and uncertainty,-,Agile
55,T55,2019,S,"Specification Patterns,
Mobile Robots,
Dependable Robotic Missions,
Software Engineering",RE and robotics,-,NLP
56,T56,2019,E,"Mobile apps,
App reviews,
Emerging issue detection,
Anomaly",CrowdRE,User feedback,NLP
57,T57,2018,E,"App reviews,
Online analysis,
Engineering issues",CrowdRE,User feedback,NLP
58,T58,2018,V,-,RE and mobile software development ,-,ML
59,T59,2017,E,"Developer communication,
User story generation,
Software engineering,
Productivity,
Transcripts","
Requirements extraction",User stories,"Agile,
ML,
NLP"
60,T60,2017,A,"Decision analysis,
Requirements engineeriing,
Software architecture,
Goal modelling,
Monte-Carlo simulation,
Multi-objective optimization,
Search-based software engineering,
Expected value of information",RE and software architecture,GORE,-
61,T61,2017,S,"Forensic-ready systems, 
Requirements, 
Specification synthesis",Formal specification,Requirements documentation quality,-
62,T62,2015,M,"Natural Language Requirements, 
Natural Language Processing (NLP), 
Change Impact Analysis.",Requirements management,"Impact analysis,
Change management",NLP
63,T63,2019,A,"Formal methods, 
Requirements modelling, 
Requirements verification, 
Formal engineering methods",Formal specification,-,-
64,T64,2019,E,"Business Rules Extraction, 
Rule Document, 
Rule Components, 
SBVR, 
Natural Language Processing, 
Text Mining,
Graphs, 
Match and Gap, 
Search and Query, 
Source Code",RE and business engineering,-,NLP
65,T65,2017,V,"Business Processes,
BPMN,
Structural Operational Semantics, 
MAUDE,
Software Verification",RE and business engineering,-,-
66,T66,2017,V,"Web Usability, 
Software as a Service, 
Usability Refactoring",RE and usability evaluations,-,Agile
67,T67,2016,A,"Automated tool for analysis modelling, 
Model transformation,
Analysis class diagram,
Problem level sequence diagram,
Template code,
Automated approach",Requirements modelling,"Use case, 
Model extraction/generation",NLP
68,T68,2016,V,"Abstract test, 
Essential Use Cases, 
Essential User Interface,
Requirement-based testing, 
Requirements validation,
Communication and collaboration",Requirements validation,Use case,Collaborative
69,T69,2018,"E, S","Feature extraction,
Tools,
Software,
Documentation,
Industries,
Iterative methods,
Manuals",Requirements extraction,Source code,-
70,T70,2019,S,"Recommendation to omitted steps,
Use case specification,
Software requirements completeness,
Scenario patterns",Requirements documentation quality,Use case,NLP
71,T71,2019,"A, S","Requirements formalization,
Formal analysis of requirements,
Ontology,
Automated requirements-based test generation,
Requirements engineering,
Formal methods",Requirements and tests,-,NLP
72,T72,2019,S,"Syntactic,
Contracts,
Conditions,
Requirements engineering,
Specification,
Structuring,
Authoring,
Safety,
FuSa,
Architecture,
IEC 61508,
ISO 26262,
Elements,
Compositional,
Tool Support","
Safety/Security requirements",Formal specification,-
73,T73,2019,E,"Information,
Decision,
Decision-information,
CSFI,
ENDSI,
MEANSI,
Outcome feedback",RE and business engineering ,Information requirements gathering,-
74,T74,2018,E,"Requirements elicitation,
Values,
Motivations,
Emotions",Values and emotions in RE,-,-
75,T75,2018,"A, E","Security,
RE,
Domain,
Ontologies,
Case study",Safety/Security requirements,Requirements generation,-
76,T76,2018,"A, M","Customer relationship management,
Machine learning,
Escalation prediction,
Customer support tickets,
Decision science research","
Decision support

","Requirements visualization,
CrowdRE","NLP,
ML"
77,T77,2018,M,"Agile,
Agile development,
Agilr requirements,
Requirements management,
Requirements knowledge,",Decision support,Requirements visualization,Agile
78,T78,2018,"S, A","Requirements engineering,
Goal models,
SAT/SMT/OMT",GORE,-,-
79,T79,2018," A, S, V","Information quality,
Business process,
Workflow nets,
RE,
Socio-technical systems,",RE and business engineering,Information quality,-
80,T80,2018,"A, E, S, V","RE,
Web engineering,
Web augmentation,",CrowdRE,-,Agile
81,T81,2017,M,"Semantic technologies,
Software process modelling,
Process requirements,
Semantic wiki,
SPEM",RE and business engineering,-,"Collaborative,
Agile"
82,T82,2017,S,"User stories,
RE,
Conceptual modelling,
NLP,
Case study,
Conceptual model visualization,",Requirements modelling,"User stories, 
Model extraction/generation","Agile,
NLP"
83,T83,2017,S,"Legal complience,
NLP,
Cross reference,
Conceptual modelling",RE and legal,Requirements documentation quality,NLP
84,T84,2017,V,"Software engineering,
Energy consumption model,
Grreen software,
Green requirements,
Software development,
Green software engineering,
Random decision forest,
Multiple regression model",RE and software sustainability,-,ML
85,T85,2017,"A, S","Requirements engineering,
Agent-oriented software engineerring,
Adaptive software,
BDI agents,
Empirical study",Adaptive systems,GORE,ML
86,T86,2016,E,"Virtual organization,
RE,
Collaboration modelling,
Business process",RE and business engineering,-,Collaborative
87,T87,2016,A,"User feedback,
Review analysis,
Software analytics,
Machine learning,
Natural language processing,
Data-driven RE",CrowdRE,-,"ML,
NLP"
88,T88,2016,S,"User stories,
Requirements quality,
AQUSA,
QUS framework,
Natural language processing,
Multi-case study",Requirements documentation quality,User stories,"NLP,
Agile"
89,T89,2015,S,"Traceability,
Quesries,
Search recognition,
Natural language processing",Requirements traceability,-,"ML,
NLP"
90,T90,2015,A,"Semantic annotation,
Legal documents,
RE,
Regulation complience problem,
Legal requirements,
Multilingual annotation",RE and legal,Requirements extraction,NLP
91,T91,2019,E,"Requirements elicitation,
NFR,
Application store,
Classification",CrowdRE,-,"ML,
NLP"
92,T92,2015,M,"Requirements prioritization,
RE,
Release planning,
NLP,
SMTT solver,
Controlled experiment",Requirements prioritization,-,NLP
93,T93,2018,"M, S, V","Rigorous system design,
Requirements formalization,
Model-based design,
Correctness-by-construction",Requirements validation,-,-
94,T94,2018,M,"Model-based systems engineering,
Traceability,
Product service systems,
Model integration",Requirements traceability,-,Collaborative
95,T95,2018,"A, S, V","Use case modelling,
Belief,
Uncertainty",Requirements and uncertainty,Use case,-
96,T96,2018,"A, V","Variability analysis,
Ontology,
Software reuse,
Software product lines,
Application lifecycle management","Rquirements and tests
",Variability modelling,-
97,T97,2017,"S, V","Requirements engineering, 
Automatic defect detection, 
Requirements Smells",Requirements documentation quality,-,"Agile,
NLP"
98,T98,2019,S,"Natural language processing,
 Requirements engineering, 
Empirical software engineering, 
Ambiguity, 
User stories",Requirements documentation quality,User stories,"NLP,
Agile"
99,T99,2019,M,"Requirements, 
Acceptance tests, 
Document alignment,
Software engineering tools, 
Software evolution",Requirements and tests,-,Agile
100,T100,2019,"A, S, V","Information quality requirements, 
Goal-oriented requirements engineering ,
GORE, 
Conceptual modelling,
Framework",Information quality,"
GORE",RE and business engineering
101,T101,2019,"A, E","Requirements engineering, 
Creativity, 
Goal modelling",GORE,RE and creativity,-
102,T102,2018,V,"Organizational security,
Security requirements inception,
Requirements engineering,
Security awareness,
Security education,
Serious game,
Social engineering,
Cyber security,
Empirical study","
Safety/Security requirements",RE education/training,-
103,T103,2018,E,"Requirements elicitation, 
Business process model, 
Natural language generation",Requirements extraction,RE and business engineering,BPM
104,T104,2017,E,"Requirements elicitation, 
Adaptive systems,
Socio-technical systems,
Repertory grid ",Adaptive systems ,Variability modelling,-
105,T105,2016,S,"Software engineering, 
System analysis, 
Run-time requirements verification, 
Goal models reasoning,
Fuzzy reasoning",GORE,Requirements @ Runtime,-
106,T106,2016,A,"Requirements analysis,
Requirements management,
Terminological inconsistency analysis, 
Alias identification,
Entity disambiguation,
Latent semantic analysis",Requirements documentation quality,-,"NLP,
ML"
107,T107,2016,M,"Function Point measurement automation,
Function Point measurement procedure,
COSMIC Function Point,
ISO/IEC 19761: 2011,
Requirements ontology",Requirements management,Cost estimation,-
108,T108,2016,M,"Requirements change management,
Distributed teams,
Global software development",Requirements management,"Impact analysis,
Change management",Distributed
109,T109,2015,"A, E, M","Requirements engineering,
Activity Theory,
User Requirements Notation,
Goal modelling,
Scenario modelling,",Requirements modelling,GORE,-
110,T110,2015,A,"Requirements engineering,
Similarity analysis,
Shared service discovery",Requirements and software architecture,-,"ML,
NLP"
111,T111,2019,S,"FSL,
Graphical properties,
UML,
MARTE,
CCSL,
modelling,
Embedded systems",Formal specification,-,-
112,T112,2018,A,"Security requirements,
Goal model,
Socio-technical systems,
Security pattterns"," 
Safety/Security requirements","i* modelling,
GORE",-'
]

{ #category : #'as yet unclassified' }
NitVizExample >> dataAsString3 [
	^ 'Index,Tool identifier,Year,Main RE topic,Subtopic,Other topic
1,T1,2019,Requirements documentation quality,Use Case,NLP
2,T2,2019,CrowdRE,User feedback,"ML,
NLP"
3,T3,2019,Requirements validation,Prototyping,-
4,T4,2019,GORE,i* modelling,-
5,T5,2019,GORE,i* modelling,-
6,T6,2018,Requirements and tests,-,NLP
7,T7,2018,Requirements@Runtime,"Monitoring, 
Traceability",-
8,T8,2018,Requirements and tests,Use Case,"NLP,
Agile"
9,T9,2018,GORE,i* modelling,-
10,T10,2018,Requirements extraction,-,"NLP,
ML"
11,T11,2018,RE and usability evaluations,Modelling,-
12,T12,2018,GORE,i*modelling,-
13,T13,2018,RE and software sustainability,-,-
14,T14,2018,Requirements management,User stories,Agile
15,T15,2018,CrowdRE,"User feedback,
Monitoring",ML
16,T16,2017,GORE,"Model reasoning,
i*modelling",ML
17,T17,2017,Requirements and tests,-,-
18,T18,2017,Requirements prioritization,Gamification,"Collaborative,
Distributed"
19,T19,2017,Requirements documentation quality,Use Case,NLP
20,T20,2017,CrowdRE,-,ML
21,T21,2017,CrowdRE,Requirements visualization,"Collaborative,
ML"
22,T22,2017,Requirements and tests,Requirements validation,-
23,T23,2017,Requirements extraction,CrowdRE,"ML,
NLP"
24,T24,2017,Requirements documentation quality,Requirements authoring,NLP
25,T25,2016,GORE,i*modelling,-
26,T26,2016,Video-based RE,-,-
27,T27,2016,Requirements modelling,"Model extraction/generation,
User stories",NLP
28,T28,2016,Requirements and tests,-,Collaborative
29,T29,2016,Requirements modelling,CrowdRE,Collaborative
30,T30,2016,Requirements traceability,-,-
31,T31,2016,RE and mobile software development,Use case,-
32,T32,2015,Requirements documentation quality,User stories,"Agile,
NLP"
33,T33,2015,Requirements modelling,Sketching,Collaborative
34,T34,2015,Requirements@Runtime,Requirements and uncertainty,ML
35,T35,2015,Requirements documentation quality,-,NLP
36,T36,2015,RE and software architecture,NFR,-
37,T37,2015,Requirements extraction,-,-
38,T38,2015,GORE,-,-
39,T39,2015,GORE,-,-
40,T40,2019,CrowdRE,User feedback,NLP
41,T41,2018,Automated classification,Requirements documentation quality,"NLP,
ML"
42,T42,2018,Requirements documentation quality,User stories,"Agile,
NLP"
43,T43,2017,RE and software product lines,-,-
44,T44,2017,Requirements traceability,GORE,NLP
45,T45,2017,Requirements documentation quality,-,NLP
46,T46,2016,GORE,-,-
47,T47,2016,Requirements modelling,,RE education/training
48,T48,2015,Safety/Security requirements,GORE,-
49,T49,2015,Formal specification,-,NLP
50,T50,2019,RE and software architecture,"Variability modelling,
RE and software product lines",-
51,T51,2019,CrowdRE,-,-
52,T52,2019,RE and mobile software development,-,-
53,T53,2019,RE and mobile software development ,Prototyping,-
54,T54,2019,Requirements and uncertainty,-,Agile
55,T55,2019,RE and robotics,-,NLP
56,T56,2019,CrowdRE,User feedback,NLP
57,T57,2018,CrowdRE,User feedback,NLP
58,T58,2018,RE and mobile software development ,-,ML
59,T59,2017,Requirements extraction,User stories,"Agile,
ML,
NLP"
60,T60,2017,RE and software architecture,GORE,-
61,T61,2017,Formal specification,Requirements documentation quality,-
62,T62,2015,Requirements management,"Impact analysis,
Change management",NLP
63,T63,2019,Formal specification,-,-
64,T64,2019,RE and business engineering,-,NLP
65,T65,2017,RE and business engineering,-,-
66,T66,2017,RE and usability evaluations,-,Agile
67,T67,2016,Requirements modelling,"Use case,
Model extraction/generation",NLP
68,T68,2016,Requirements validation,Use case,Collaborative
69,T69,2018,Requirements extraction,Source code,-
70,T70,2019,Requirements documentation quality,Use case,NLP
71,T71,2019,Requirements and tests,-,NLP
72,T72,2019,Safety/Security requirements,Formal specification,-
73,T73,2019,RE and business engineering ,Information requirements gathering,-
74,T74,2018,Values and emotions in RE,-,-
75,T75,2018,Safety/Security requirements,Requirements generation,-
76,T76,2018,Requirements management,"Requirements visualization,
CrowdRE","NLP,
ML"
77,T77,2018,Requirements management,Requirements visualization,Agile
78,T78,2018,GORE,-,-
79,T79,2018,RE and business engineering,Information quality,-
80,T80,2018,CrowdRE,-,Agile
81,T81,2017,RE and business engineering,-,"Collaborative,
Agile"
82,T82,2017,Requirements modelling,"User stories,
Model extraction/generation","Agile,
NLP"
83,T83,2017,RE and legal,Requirements documentation quality,NLP
84,T84,2017,RE and software sustainability,-,ML
85,T85,2017,Adaptive systems,GORE,ML
86,T86,2016,RE and business engineering,-,Collaborative
87,T87,2016,CrowdRE,-,"ML,
NLP"
88,T88,2016,Requirements documentation quality,User stories,"NLP,
Agile"
89,T89,2015,Requirements traceability,-,"ML,
NLP"
90,T90,2015,RE and legal,Requirements extraction,NLP
91,T91,2019,CrowdRE,-,"ML,
NLP"
92,T92,2015,Requirements prioritization,-,NLP
93,T93,2018,Requirements validation,-,-
94,T94,2018,Requirements traceability,-,Collaborative
95,T95,2018,Requirements and uncertainty,Use case,-
96,T96,2018,Rquirements and tests,Variability modelling,-
97,T97,2017,Requirements documentation quality,-,"Agile,
NLP"
98,T98,2019,Requirements documentation quality,User stories,"NLP,
Agile"
99,T99,2019,Requirements and tests,-,Agile
100,T100,2019,Information quality,GORE,RE and business engineering
101,T101,2019,GORE,RE and creativity,-
102,T102,2018,Safety/Security requirements,-,RE education/training
103,T103,2018,Requirements extraction,RE and business engineering,BPM
104,T104,2017,Adaptive systems ,Variability modelling,-
105,T105,2016,GORE,Requirements@Runtime,-
106,T106,2016,Requirements documentation quality,-,"NLP,
ML"
107,T107,2016,Requirements management,Cost estimation,-
108,T108,2016,Requirements management,"Impact analysis,
Change management",Distributed
109,T109,2015,Requirements modelling,GORE,-
110,T110,2015,Requirements and software architecture,-,"ML,
NLP"
111,T111,2019,Formal specification,-,-
112,T112,2018, Safety/Security requirements,"i* modelling,
GORE",-'
]

{ #category : #'as yet unclassified' }
NitVizExample >> model [
	<script: 'self new model inspect'>
	"
	self new model
	"
	| model |
	model := NVModel new.
	model entries: self data3.
	model build.
	^ model
]
