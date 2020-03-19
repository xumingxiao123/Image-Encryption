function   [A, random]=DCML(Key,Vertex,T,lattice)
[M,N]=size(Vertex);
%   Ar=As(1,1);
%   Ac=As(1,2);
%   kp=max(Ar,Ac)*2+30;
  %% 提取前9个元素
  Lk=length(Key)-3;
  %% 处理并且生成三个初值
  random=(floor(M*N*(Key(9))/100)+1)*3;
  kp=M*N+random+T;
  alpha=3.99+0.01*Key(10);
  mu=3.99+0.01*Key(11); 
  %Key(13)=Key(13)+10^-14;
  e=0.01+0.99*Key(12);
  %%  9个
x(1:lattice)=Key(1: lattice);
  i=0;
  flag=1;
  for n=1:kp
      for m=1:lattice
%             j=mod((m+p*m),lattice);
%             k=mod(q*m+(p*q+1)*m,lattice);
%           j=floor(temp(m)*lattice)+1;
%           temp(m)=mu*temp(m)*(1-temp(m));
          j=m+1;%后一个格子
          k=m-1;%前一个格子
          if j==lattice+1;%如果j和k超出范围则进行循环
              j=1;
          end
          if k==0;
              k=lattice;
          end
%           if j==0
%               j=lattice;
%           end
          y(m)=(1-e)*alpha*x(m)*(1-x(m))+(e/2)*alpha*x(j)*(1-x(j))+(e/2)*alpha*x(k)*(1-x(k));
         e=e*mu*(1-e);
      end
      x(:)=y(:);
      B(1:lattice,n)=y(1:lattice);
  end
   A=B;
end