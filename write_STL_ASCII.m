function write_STL_ASCII(p1,meth)
switch meth 
    case '密文' 
        fid=fopen('密文.txt','a+');
    case '明文' 
        fid=fopen('明文.txt','a+');
    otherwise 
end 
% fid=fopen('密文.txt','a+');%创建文件b,暂时无法读取。
%          fid=fopen（文件名，‘打开方式’）
%说明：其中fid用于存储文件句柄值，如果返回的句柄值大于0，则说明文件打开成功。文件名用字符串形式，表示待打开的数据文件。常见的打开方式如下：
%‘r’：    只读方式打开文件（默认的方式），该文件必须已存在。
%‘r+’： 读写方式打开文件，打开后先读后写。该文件必须已存在。
%‘w’：   打开后写入数据。该文件已存在则更新；不存在则创建。
%‘w+’：读写方式打开文件。先读后写。该文件已存在则更新；不存在则创建。
%‘a’：   在打开的文件末端添加数据。文件不存在则创建。
%‘a+’： 打开文件后，先读入数据再添加数据。文件不存在则创建。
%由于三角面片外法矢量可以通过右手螺旋法则由3顶点坐标值计算出来，因此可不对其进行存储，以节省存储空间。如果后续处理需用到法矢量，可以重新进行计算
P3=p1;
[M,N]=size(P3);
 P4=zeros(M/3,N);
 for  n=1:3:M
 v1x = P3(n,1);
 v1y = P3(n,2);
 v1z = P3(n,3);
 
 v2x = P3(n+1,1);
 v2y = P3(n+1,2);
 v2z = P3(n+1,3);
 
 v3x = P3(n+2,1);
 v3y = P3(n+2,2);
 v3z = P3(n+2,3);
 m=floor(n/3)+1;
 P4(m,1) = (v1y-v3y)*(v2z-v3z)-(v1z-v3z)*(v2y-v3y);
 P4(m,2)  = (v1z-v3z)*(v2x-v3x)-(v2z-v3z)*(v1x-v3x);
 P4(m,3) = (v1x-v3x)*(v2y-v3y)-(v2x-v3x)*(v1y-v3y);
%  nxyz= power(P4(m,1)* P4(m,1)+P4(m,2)*P4(m,2)+P4(m,3)*P4(m,3),1/3);
% strline = cell(1,1);精度精度
% striline{1}='solid';
% striline{2}='facet normal';
% striline{3}='outer loop';
% striline{4}='vertex';
% striline{5}='endloop';
% striline{6}='endfacet';
% striline{7}='endsolid';
 fprintf(fid,'%s\r\n','solid');
fprintf(fid,'  %s','facet normal');
% fprintf(fid,' %+.7E %+.7E %+.7E\r\n',P4(m,1)\nxyz,P4(m,2)\nxyz,P4(m,3)\nxyz);
fprintf(fid,' %+.7E %+.7E %+.7E\r\n',P4(m,1),P4(m,2),P4(m,3));
fprintf(fid,'    %s\r\n','outer loop');
fprintf(fid,'      %s   %+.7E %+.7E %+.7E\r\n','vertex',P3(n,1),P3(n,2),P3(n,3));
fprintf(fid,'      %s   %+.7E %+.7E %+.7E\r\n','vertex',P3(n+1,1),P3(n+1,2),P3(n+1,3));
fprintf(fid,'      %s   %+.7E %+.7E %+.7E\r\n','vertex',P3(n+2,1),P3(n+2,2),P3(n+2,3));
fprintf(fid,'    %s\r\n','endloop');
fprintf(fid,'  %s\r\n','endfacet');
end
fprintf(fid,'%s\r\n','endsolid');
fclose(fid);