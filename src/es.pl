% CS3210 - Principles of Programming Languages - Fall 2022
% Instructor: Thyago Mota
% Description: Expert system that asks for your Meyers-Brigg's personality type and then recommmends a TV show based on it
% Student(s) Name(s): Cameron Colliver, Stilian Balasopoulov
:- dynamic known/2.

is_true(Question) :-
  (
    known(yes, Question) ->
      true;
      known(no, Question) ->
         false;
         format('~w?~n', [Question]),
         Answer = read(yes),
         ( Answer -> assert(known(yes, Question)); assert(known(no ,Question)) ),
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

personality(i) :- is_option('Are you introverted. or extroverted.', [introverted]).
personality(e) :- is_option('Are you introverted. or extroverted.', [extroverted]).
personality(n) :- is_option('Are you intuitive. or sensible.', [intuitive]).
personality(s) :- is_option('Are you intuitive. or sensible.', [sensible]).
personality(t) :- is_option('Are you a thinker. or a feeler.', [thinker]).
personality(f) :- is_option('Are you a thinker. or a feeler.', [feeler]).
personality(p) :- is_option('Are you perceptive. or judgemental.', [perceptive]).
personality(j) :- is_option('Are you perceptive. or judgemental.', [judgemental]).

type(istj) :- personality(i), personality(s), personality(t), personality(j).
type(isfj) :- personality(i), personality(s), personality(f), personality(j).
type(istp) :- personality(i), personality(s), personality(t), personality(p).
type(isfp) :- personality(i), personality(s), personality(f), personality(p).
type(estj) :- personality(e), personality(s), personality(t), personality(j).
type(esfj) :- personality(e), personality(s), personality(f), personality(j).
type(estp) :- personality(e), personality(s), personality(t), personality(p).
type(esfp) :- personality(e), personality(s), personality(f), personality(p).
type(intj) :- personality(i), personality(n), personality(t), personality(j).
type(infj) :- personality(i), personality(n), personality(f), personality(j).
type(intp) :- personality(i), personality(n), personality(t), personality(p).
type(infp) :- personality(i), personality(n), personality(f), personality(p).
type(entj) :- personality(e), personality(n), personality(t), personality(j).
type(enfj) :- personality(e), personality(n), personality(f), personality(j).
type(entp) :- personality(e), personality(n), personality(t), personality(p).
type(enfp) :- personality(e), personality(n), personality(f), personality(p).

recommend(community) :- personality(n), personality(f).
recommend(breaking-bad) :- personality(i), personality(p).
recommend(seinfeld) :- personality(s), personality(j).
recommend(stranger-things) :- personality(e), personality(t).

begin :-
    (
      retractall(known(_,_)) ->
      writeln('Welcome to this ES for tv-shows!') ->
      writeln('Im going to ask you about your personality, then recommend a tv show!') ->
      writeln('When prompted, answer with either the answer to the question or yes./no.') ->
      ( is_true('Ready'); writeln('Bye! You can start again by typing begin.'), false ) ->
      type(A) -> format('Youre personality type is ~w~n',[A]) ->
      ( is_true('is this correct') -> writeln('Nice. Time to recommend a show!'); writeln('lets restart then'), begin) ->
      recommend(B) -> format('I think you will enjoy ~w~n', [B]) ->
      ( is_true('yes. or no.') -> writeln('great! enjoy'); writeln('hm, lets try again'), begin, false )

    ).

