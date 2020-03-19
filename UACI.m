function [uaci] = UACI(f1,f2)
MAX=floor(max(max(f1)))+1;
MIN=min(min(f1)); 
t=MAX-MIN;
[M, N] =size(f1);
c = 0.000000;
for i = 1 : M * N
        
        c = c + abs( double( f1(i)) - double( f2(i)));
    
end
uaci = c / (t * M * N);