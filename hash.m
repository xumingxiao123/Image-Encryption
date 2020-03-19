
function h = hash(inp,meth) 
% HASH - Convert an input variable into a message digest using any of  several common hash algorithms 
% 将输入信息转换的几种常见的哈希算法解释
% USAGE: h = hash(inp,'meth') 
% 使用方法，inp为输入变量，meth是要使用的哈希函数
% inp  = input variable, of any of the following classes: 
%输入下面任何一种变量都可以
%        char, uint8, logical, double, single, int8, uint8, 
%        int16, uint16, int32, uint32, int64, uint64 
% h    = hash digest output, in hexadecimal notation  用16进制表示“哈希摘要”输出
% meth = hash algorithm, which is one of the following: 下面那个是哈希算法
%        MD2, MD5, SHA-1, SHA-256, SHA-384, or SHA-512  
% 这些哈希算法有啥区别呢？一种将任意长度的消息压缩到某一固定长度的消息摘要的函数。
% NOTES: (1) If the input is a string or uint8 variable, it is hashed  as usual for a byte stream. Other classes are converted into  their byte-stream values. In other words, the hash of the  following will be identical: 
%       如果输入是字符串或uint8变量，它将像往常一样对字节流进行散列。其他类被转换为它们的字节流值。换句话说，下面的哈希是相同的: 
%                     'abc' 
%                     uint8('abc') 
%                     char([97 98 99]) 
%            The hash of the follwing will be different from the above, because class "double" uses eight byte elements: 
%            下面的散列将与上面的不同，因为类“double”使用了8个字节元素:
%                     double('abc') 
%                     [97 98 99] 
%            You can avoid this issue by making sure that your inputs  are strings or uint8 arrays.
%              您可以通过确保您的输入是字符串或uint8数组来避免这个问题。
%        (2) The name of the hash algorithm may be specified in lowercase  and/or without the hyphen, if desired. For example
%           如果需要，哈希算法的名称可以用小写字母和/或不带连字符指定。例如
%            h=hash('my text to hash','sha256'); 
%        (3) Carefully tested, but no warranty. Use at your own risk. 
 %        经过仔细测试，但没有保证。自行承担使用风险。
%        (4) Michael Kleder, Nov 2005 
% 
% EXAMPLE: 
% 
% algs={'MD2','MD5','SHA-1','SHA-256','SHA-384','SHA-512'}; 
% for n=1:6 
%     h=hash('my sample text',algs{n}); 
%     disp([algs{n} ' (' num2str(length(h)*4) ' bits):']) 
%     disp(h) 
% end 

inp=inp(:); 
% convert strings and logicals into uint8 format 
if ischar(inp) || islogical(inp) 
    inp=uint8(inp); 
else % convert everything else into uint8 format without loss of data 
    inp=typecast(inp,'uint8'); 
end 

% verify hash method, with some syntactical forgiveness: 
meth=upper(meth); 
switch meth 
    case 'SHA1' 
        meth='SHA-1'; 
    case 'SHA256' 
        meth='SHA-256'; 
    case 'SHA384' 
        meth='SHA-384'; 
    case 'SHA512' 
        meth='SHA-512'; 
    otherwise 
end 
algs={'MD2','MD5','SHA-1','SHA-256','SHA-384','SHA-512'}; 
if isempty(strmatch(meth,algs,'exact')) 
    error(['Hash algorithm must be ' ... 
        'MD2, MD5, SHA-1, SHA-256, SHA-384, or SHA-512']); 
end 

% create hash 
x=java.security.MessageDigest.getInstance(meth); 
x.update(inp); 
h=typecast(x.digest,'uint8'); 
h=dec2hex(h)'; 
if(size(h,1))==1 % remote possibility: all hash bytes  128, so pad: 
    h=[repmat('0',[1 size(h,2)]);h]; 
end 
h=lower(h(:)'); 
clear x 
return