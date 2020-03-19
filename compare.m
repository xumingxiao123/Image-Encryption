function compare(p1,p2)
[M,N]=size(p1);
T1=reshape(floor(p1),1,[]);
T2=reshape(floor(p2),1,[]);
% for n=1:2160
%   if
%     T1(n)==T2(n);
%    return  n;
%   else
%   end
for n=1:M*N
if(T1(n)~=T2(n)) 
         disp(n);
end
end