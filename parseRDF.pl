:- module(parseRDF,[parseRDF/2,
					first_atom_uppercase/2,
					find_text/2,
					find_sent/4,
					find_object/3,
					find_subject/3,
					find_predicate/4,
					assemble_sent/7,
					create_graph/1,
					assemble_turtle/6

					]).

:- use_module(library(semweb/rdf11)).
:- use_module(library(semweb/turtle)).

parseRDF([FOL], Turtle):-
	find_text(FOL,TurtText).
%%   	assemble_goal(TurtText,Turtgoal).

find_text(FOL,TurtText):-
	FOL=.. [Cood|[FOL1,FOL2]],
	first_atom_uppercase(Cood,Goaltype),
	create_graph(Graph),
	find_sent(FOL1,Sent1,Graph,Bnode1),
	find_sent(FOL2,Sent2,Graph,Bnode2),
	assemble_turtle(Goaltype,Graph,Turtletext,Bnode1,Bnode2,Fbnode).


%% find_text(FOL,TurtText):-
%% 	FOL = and(FOL1,FOL2),
%%	Cood = "And",
%%	find_sent(FOL1,Sent1),
%%	find_sent(FOL2,Sent2).
%%	assemble_text(Cood,Sent1,Sent2,TurtText).

first_atom_uppercase(WordLC, AtomUC):-
    atom_chars(WordLC, [FirstChLow|LWordLC]),
    atom_chars(FirstLow, [FirstChLow]),
    upcase_atom(FirstLow, FirstUpp),
    atom_chars(FirstUpp, [FirstChUpp]),
    atom_chars(WordUC, [FirstChUpp|LWordLC]),
    atom_chars(WordUC, AtomUC).



find_text(FOL,TurtText):-
    Cood = [],
    find_sent(FOL,Sent,sent,bnode).

find_sent(FOL_NO_Cood,Sent,Graph,Bnode):-
	find_object(FOL_NO_Cood,Subject,FOL_No_OBJ),
	find_subject(FOL_No_OBJ,Object,FOl_No_SUB),
	find_predicate(FOl_No_SUB,Subpredicate1,Subpredicate2,Predicate),
	assemble_sent(Subject,Predicate,Subpredicate1,Subpredicate2,Object,Graph,Bnode).

find_object(FOL_NO_Cood,Subject,FOL_No_OBJ):-
	FOL_NO_Cood = some(_,X),
	X = and(Y,FOL_No_OBJ),
	Y =.. [Subject,_].
%%	format(Subject).

find_subject(FOL_No_OBJ,Object,FOl_No_SUB):-
	FOL_No_OBJ = some(_,X),
	X = and(Y,FOl_No_SUB),
	Y =.. [Object,_]. 
%%	format(Object).

find_predicate(FOl_No_SUB,Subpredicate1,Subpredicate2,Predicate):-
	FOl_No_SUB = location(X,_),
	X=.. [Predicate|_],
	term_to_atom(Predicate-x,Subpredicate1),
	term_to_atom(Predicate-y,Subpredicate2).


assemble_sent(Subject,Predicate,Subpredicate1,Subpredicate2,Object,Graph,Bnode):-
	rdf_create_bnode(Bnode),

	rdf_global_id(pddle:Predicate,Pred),
	rdf_global_id(pddle:Subpredicate1,Subpred1),
	rdf_global_id(pddle:Subpredicate2,Subpred2),
	rdf_global_id(pddle:Subject,Sub),
	rdf_global_id(pddle:Object,Obj),

	rdf_assert(Bnode,rdf:type,Pred,Graph),
	rdf_assert(Bnode,Subpred1,Sub,Graph),
	rdf_assert(Bnode,Subpred2,Obj,Graph).


create_graph(Graph):-
	rdf_retractall(O,P,S),
	atom_string(Graph,"text"),
	rdf_create_graph(Graph),
	rdf_register_prefix(pddl,'http://ontology.cf.ericsson.net/pddl/'),
	rdf_register_prefix(pddle,'http://ontology.cf.ericsson.net/pddl_example/.').




assemble_turtle(Goaltypechars,Graph,Turtle,Bnode1,Bnode2,Fbnode):-
%	atom_string(Pddlgoal,"pddl:goal"),
%	atom_string(Rdftype,"rdf:type"),
%	atom_string(Pddlgoal,"goal"),
%	atom_string(Rdftype,"type"),
	rdf_create_bnode(Fbnode),

%	atom_string(Pddl,"pddl:"),
%	atom_chars(Goaltype, Goaltypechars),
%	atom_concat(Pddl,Goaltype,Pddltype),
%	atom_string(Pddlargument,"pddl:argument"),

	%% Convert to Pddl:Or
	atom_chars(Goaltype,Goaltypechars),
	rdf_global_id(pddl:Goaltype, Pddlgoal),
	%% Convert type to Type
	%% Convert to Pddl:Type
%	atom_string(Pddlargument,"argument"),
	
	rdf_assert(Fbnode,pddl:argument,Bnode1,Graph),
	rdf_assert(Fbnode,pddl:argument,Bnode2,Graph),
	rdf_assert(Fbnode,rdf:type,Pddlgoal,Graph),
	rdf_save_turtle(Turtle,[align_prefixes(true),prefixes([rdf,pddl,pddle])]).
