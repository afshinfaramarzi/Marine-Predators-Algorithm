%_________________________________________________________________________
%  Marine Predators Algorithm source code (Developed in MATLAB R2015a)
%
%  programming: Afshin Faramarzi & Seyedali Mirjalili
%
% paper:
%  A. Faramarzi, M. Heidarinejad, S. Mirjalili, A.H. Gandomi, 
%  Marine Predators Algorithm: A Nature-inspired Metaheuristic
%  Expert Systems with Applications
%  DOI: doi.org/10.1016/j.eswa.2020.113377
%  
%  E-mails: afaramar@hawk.iit.edu            (Afshin Faramarzi)
%           muh182@iit.edu                   (Mohammad Heidarinejad)
%           ali.mirjalili@laureate.edu.au    (Seyedali Mirjalili) 
%           gandomi@uts.edu.au               (Amir H Gandomi)
%_________________________________________________________________________

% --------------------------------------------
% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of iterations
% SearchAgents_no = number of search agents
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n
% ---------------------------------------------------------

clear all
clc
format long
SearchAgents_no=25; % Number of search agents

Function_name='F23';
   
Max_iteration=500; % Maximum number of iterations

[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

[Best_score,Best_pos,Convergence_curve]=MPA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

% function topology
figure('Position',[500 400 700 290])
subplot(1,2,1);
func_plot(Function_name);
title('Function Topology')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])

% Convergence curve
subplot(1,2,2);
semilogy(Convergence_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');


display(['The best solution obtained by MPA is : ', num2str(Best_pos,10)]);
display(['The best optimal value of the objective function found by MPA is : ', num2str(Best_score,10)]);
disp(sprintf('--------------------------------------'));
