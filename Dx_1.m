function Y=Dx_1(X)
    bz=reshape(X,[40,12])';
    bs=zeros(1,12);
       d=0.1554343132;
    for n=1:12
        c=0;
        for m=1:40
            c=c+bz(n,m)*2^(-m);
          
        end
        bs(n)=c;
    end
    Y=bs;
end