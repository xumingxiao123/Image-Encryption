 function [b] = T_16_to_2(h,n)%声明函数，输入A，返回输出b
%     h =hash(A,'SHA512');%将图像A哈希化
%h =bd9b02ae16db05a25a8f3c00fd03d2fb8f9d0988e5f8960ec75f824c549aa8c4e1884e38ce8f2c694eba809df422799fdeba5d9262e4cedf3800122efb651709
    b=zeros(1,n); %创建全零数组1x480大小
    for n=1:n/4%初值为1在，终值为120的核心的循环。
         switch h(n)%将数值转化为4位2进制
             case '0' 
                 a(:)=[0 0 0 0];
             case '1' 
                 a(:)=[0 0 0 1];
             case '2' 
                 a(:)=[0 0 1 0];
             case '3' 
                 a(:)=[0 0 1 1];
             case '4' 
                 a(:)=[0 1 0 0];
             case '5' 
                 a(:)=[0 1 0 1];
             case '6' 
                 a(:)=[0 1 1 0];
             case '7' 
                 a(:)=[0 1 1 1];
             case '8' 
                 a(:)=[1 0 0 0];
             case '9' 
                 a(:)=[1 0 0 1];
             case 'a' 
                 a(:)=[1 0 1 0];
             case 'b' 
                 a(:)=[1 0 1 1];
             case 'c' 
                 a(:)=[1 1 0 0];
             case 'd' 
                 a(:)=[1 1 0 1];
             case 'e' 
                 a(:)=[1 1 1 0];
             case 'f' 
                 a(:)=[1 1 1 1];
         end
         b(4*(n-1)+1:4*n)=a(:);
    end
%     zl=b(1:300);
%     zl=reshape(zl,[100,3]);
%     for n=1:100
%         t=1;
%         for m=1:3
%             t=t+zl(n,m)*2^(m-1);
%         end
%         Z(n)=t;
%     end
%     b=reshape(b,[10,40]);
%     i=1;
%     t=1;
%     bz=zeros(22,40);
%     for n=1:10
%         for m=n+1:10
%             bz(i,:)=bitxor(b(n,:),b(m,:));
%             i=i+1;
%             if i>22
%                 t=0;
%                 break;
%             end
%         end
%         if t==0
%             break;
%         end
%     end
%     bs=zeros(1,22);
%     for n=1:22
%         c=0;
%         for m=1:40
%             c=c+bz(n,m)*2^(-m);
%         end
%         bs(n)=c;
%     end
%     x=bs;
end    


