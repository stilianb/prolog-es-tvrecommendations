% CS3210 - Principles of Programming Languages - Fall 2022
% Instructor: Thyago Mota
% Description: animal - a simple ES based on animals
% Student Name:

:- dynamic fact/1.
:- dynamic fact/2.
:- dynamic known/2.
:- dynamic known/3.


is_true(Question) :-
  (
    known(yes, Question) ->
      true;
      known(no, Question) ->
         false;
         format('~w?~n', [Question]),
         Answer = read(yes),
         ( Answer -> assert(fact(Question)),assert(known(yes, Question)); assert(known(no ,Question)) ),
         known(yes, Question) -> true; false
     ).

is_option(Question, Options) :-
  (
    known(A ,Question) ->
      member(A, Options) ->
         true;
         false;
      format('~w?~n', [Question]),
      read(Answer),
      ( assert(known(Answer, Question)), is_option(Question, Options) )
  ).

animal(dog)  :- is_true('has fur'), is_option('fur color', ['brown', 'white', 'brindle', 'fawn', 'gold', 'speckled', 'black']),      is_true('says woof').
animal(cat)  :- is_true('has fur'), is_option('fur color', ['brown', 'white', 'tabby', 'fawn', 'tortle', 'cow', 'black']),           is_true('says meow').
animal(duck) :- is_true('has feathers'), is_true('says quack').

begin :-
       (retractall(fact(_,_)) -> retractall(known(_,_)) ->
        writeln('Welcome to this ES about animals!') ->
        writeln('I am going to ask questions something') ->
        writeln('Please answer yes. or no.') ->
        ( is_true("Ready"); writeln('Bye!'), false ) ->
        animal(A) -> format('I think your animal is a ~w.~n', [A]) ->
        ( is_true('Did I get it right') -> writeln('Nice!'); writeln('Not my fault!'))

    ).






















