% Name Game
% Initial set of letters
initial_letters([a, b, c]).

% Start the game
start :-
    initial_letters(Letters),
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters.'), nl,
    write('Add, delete or move letters to create your name.'), nl,
    menu(Letters).

% Display menu
menu(Letters) :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice: '),
    read(Choice),
    process(Choice, Letters).

% Option 1: Display letters
process(1, Letters) :-
    write('Current letters: '),
    write(Letters), nl,
    menu(Letters).

% Option 2: Add a letter at a chosen position
process(2, Letters) :-
    write('Enter a letter: '),
    read(Letter),
    write('Enter position (0-based): '),
    read(Position),
    length(Before, Position),
    append(Before, After, Letters),
    append(Before, [Letter|After], NewLetters),
    write('Letter added successfully.'), nl,
    menu(NewLetters).

% Option 3: Add at the top
process(3, Letters) :-
    write('Enter a letter: '),
    read(Letter),
    NewLetters = [Letter|Letters],
    write('Letter added at the top.'), nl,
    menu(NewLetters).

% Option 4: Add at the bottom
process(4, Letters) :-
    write('Enter a letter: '),
    read(Letter),
    append(Letters, [Letter], NewLetters),
    write('Letter added at the bottom.'), nl,
    menu(NewLetters).

% Option 5: Delete a letter
process(5, Letters) :-
    write('Enter the letter to delete: '),
    read(Letter),
    ( select(Letter, Letters, NewLetters) ->
        write('Letter deleted successfully.'), nl,
        menu(NewLetters)
    ;
        write('Letter not found!'), nl,
        menu(Letters)
    ).

% Option 6: Delete all letters
process(6, _) :-
    write('All letters have been deleted.'), nl,
    menu([]).

% Option 7: Exit
process(7, _) :-
    write('Thank you for playing Name Game!'), nl.

% Invalid choice
process(_, Letters) :-
    write('Invalid choice!'), nl,
    menu(Letters).










