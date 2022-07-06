
partida :-
    write('--------------------------------------------------------------'), nl,
    write('--------------------Diagnóstico de doenças--------------------'), nl,
    write('--------------------------------------------------------------'),nl,
    principal,
    nl,
    nl,
    write('Se nenhuma doença foi apresentada após a inserção dos sintomas é em razão de que o sistema não
foi capaz de diagnosticas sua doença a partir dos seus sintomas.'),
    nl,
    nl,
    write('O resultado do protótipo é apenas informativo, o paciente deve consultar um médico para
obter um diagnóstico correto e preciso.'),
    nl,
    nl,
    write('Caso queira visualizar todos os sintomas associados de sua possivel doença escreva
\'todosSintomas(nomeDaDoença).\'.'),nl.
%
%
%doenças
%doencas(aids).
%doencas(catapora).
%doencas(caxumba).
%doencas(chikungunya).
%doencas(dengue).
%doencas(ebola).
%doencas(febre_amarela).
%doencas(gripe).
%doencas(variola).
%doencas(zika).

%sintoma(X,Y) onde X é o sintoma de Y, Y é a doença
%
%aids  20%
sintoma(febre, aids).
sintoma(alteracoes_da_imunidade, aids).
sintoma(diarreia, aids).
sintoma(perda_de_peso, aids).
sintoma(sudorese, aids).
%catapora 12,5%
sintoma(febre, catapora).
sintoma(fadiga, catapora).
sintoma(perda_de_apetite, catapora).
sintoma(bolhas, catapora).
sintoma(manchas_vermelhas, catapora).
sintoma(sarna_ou_ulceras, catapora).
sintoma(coceira, catapora).
sintoma(dor_de_gaganta, catapora).
%caxumba 25%
sintoma(febre, caxumba).
sintoma(dor_de_cabeca, caxumba).
sintoma(fadiga, caxumba).
sintoma(perda_de_apetite, caxumba).
%chikungunya 12,5%
sintoma(dor_atras_dos_olhos, chikungunya).
sintoma(dor_nas_articulacoes, chikungunya).
sintoma(calafrios, chikungunya).
sintoma(fadiga, chikungunya).
sintoma(febre, chikungunya).
sintoma(nausea, chikungunya).
sintoma(vomito, chikungunya).
sintoma(dor_de_cabeca, chikungunya).
%dengue 11,1%
sintoma(febre, dengue).
sintoma(dor_nos_musculos, dengue).
sintoma(fadiga, dengue).
sintoma(calafrios, dengue).
sintoma(perda_de_apetite, dengue).
sintoma(dor_de_cabeca, dengue).
sintoma(manchas_vermelhas, dengue).
sintoma(nausea, dengue).
sintoma(sudorese, dengue).
%ebola 12,5%
sintoma(nausea, ebola).
sintoma(dor_de_garganta, ebola).
sintoma(vomito_com_sangue, ebola).
sintoma(tosse, ebola).
sintoma(diarreia_com_sangue, ebola).
sintoma(sangramento, ebola).
sintoma(manchas_vermelhas, ebola).
sintoma(bolhas, ebola).
%febre_amarela 25%
sintoma(febre, febre_amarela).
sintoma(dor_de_cabeca, febre_amarela).
sintoma(nausea, febre_amarela).
sintoma(vomito, febre_amarela).
%gripe 11,1%
sintoma(febre, gripe).
sintoma(calafrios, gripe).
sintoma(dor_de_cabeca, gripe).
sintoma(tosse, gripe).
sintoma(espirros, gripe).
sintoma(dor_de_garganta, gripe).
sintoma(fadiga, gripe).
sintoma(perda_de_apetite, gripe).
sintoma(dor_nos_musculos, gripe).
%variola 10%
sintoma(febre, variola).
sintoma(calafrios, variola).
sintoma(dor_de_garganta, variola).
sintoma(tosse, variola).
sintoma(espirros, variola).
sintoma(dor_de_cabeca, variola).
sintoma(fadiga, variola).
sintoma(dor_nos_musculos, variola).
sintoma(manchas_vermelhas, variola).
sintoma(bolhas, variola).
%zika 16,6%
sintoma(febre, zika).
sintoma(dor_nos_musculos, zika).
sintoma(dor_de_cabeca, zika).
sintoma(dor_atras_dos_olhos, zika).
sintoma(manchas_vermelhas, zika).
sintoma(coceira, zika).
%
%prosseguir
prosseguir([S|L]):-
    write('Escreva \'continuar.\' para prosseguir:'),
    nl,
    read(S),
    dif(S, 'continuar'),
    prosseguir(L).
prosseguir([]).
%
%lista
lista([I|F]):-
    write(I),nl,
    lista(F).
lista([]):-!.
%
%achaDoença
acharDoenca([I|F], X):-
    acharDoenca(F, X), sintoma(I, X).
acharDoenca([],_X):- !.
%
%
%probDoenca():-.
%
%
%pegarSintomas
pegarSintomas(X,L):-
    findall(S, sintoma(S,X),L).
%
%todosSintomas
todosSintomas(X):-
    pegarSintomas(X,L),
    lista(L).
todosSintomas:-
    findall(X,sintoma(X,_),L),
    sort(L,Y),
    lista(Y).
%
%vai dentro do partida
principal:-
    write('Verifique se seus sintomas estão dentro da lista a seguir:'),
    nl,
    write('--------------------------------------------------------------'), nl,
    todosSintomas,
    write('--------------------------------------------------------------'), nl,
    prosseguir(_S),
    write('\nEscreva seus sintomas nesse formato \'sintoma.\' seguindo a lista acima e escreva \'fim.\'quando
terminar\n.'),nl,
    sintomasPaciente(Lista),
    listaPossiveis(Lista),
    nl.
%
%lista de possiveis doenças
listaPossiveis([I|F]):-
    findall(X, acharDoenca([I|F], X),L),
    resultado(L).
listaPossiveis([]):- !.
%
%resultado do diagnostico
resultado([I|F]):-
    write('========================================================='),nl,
    write('Possivel doença:'),nl,
    write(I),nl,
    write('========================================================='),nl,
    resultado(F).
resultado([]):-!.

%
%sintomas do Paciente
sintomasPaciente([S|L]) :-
    write('Escreva seu sintoma:'), nl,
    read(S),
    dif(S, 'fim'),
    sintomasPaciente(L).

sintomasPaciente([]).
%


%Cadastro de paciente não terminado
cadastro:-
  open('D:/USER SSD/Desktop/aualas ERE/2 semestre/PPLF/pacientes.txt', append, F),
    write('Nome do paciente da seguinte maneira \'nome.\':'),nl,
    read(X),
    write(F,X),
    nl(F),
    close(F).
%
%
%consulta :-
%      open('D:/USER SSD/Desktop/aualas ERE/2
%      semestre/PPLF/pacientes.txt', read, F),
%
%      close(F).
%
%remocao :-
%
%alteracao :-
%
:- begin_tests(sistema).
:- use_module(library(plunit)).
test(sisT1) :- principal.
test(sisT2) :- principal.
test(sisT3) :- principal.

:- end_tests(sistema).






