function Y=T_2_to_10(X,n)

[M,N]=size(X);%M=1;N=480;n=12;
m=N/n;%m=40;
    bz=reshape(X,[m,n])'; %40*12
    bs=zeros(1,n);
%        d=0.1554343132;
    for n1=1:n
        c=0;
        for m1=1:m
            c=c+bz(n1,m1)*2^(-m1); 
        end
        bs(n1)=c;
    end
    Y=bs;
end