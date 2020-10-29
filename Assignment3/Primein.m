function [Primeout] = Primein(number1)
%%% This funtion takes a one number input and uses the 'isprime' funciton to
%%% determine if a that number is prime or not. If the number is prime then
%%% 'Pimeout' is returned as a true logical '1', if the number is not prime
%%% 'Primeout' is returned as a false logical '0'.

Primeout = isprime(number1);
end
