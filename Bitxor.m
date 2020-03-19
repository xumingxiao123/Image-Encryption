function P= Bitxor(p,a1,q)
[M,N]=size(p);
s1=zeros(M,N);
for i=1:M*N
    s1(i)=mod(floor(double(a1(i))*q),q);%这个值越大扩散越好2000
end
t1=zeros(M,N);
for i=1:M*N
t1(i)=bitxor(floor(p(i)),s1(i));
end
t2(1)=t1(1);
for i=1:M*N-1
 t2(i+1)=bitxor(t2(i),t1(i+1));
 end
P=reshape(t2,M,N);
end