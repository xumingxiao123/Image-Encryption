function [ h ] = entropy(x)
%************************************************************%
%             Calculating the Entropy Image                  %
%                     ¼ÆËãÍ¼ÏñµÄìØ                           %
%************************************************************%
% 
% error(nargchk(1,2,nargin));
% x=imread('f-pepper.bmp');
n=256;
if nargin < 2
    n = 256;
end
x = double(x);
xh = hist(x(:),n);
xh = xh / sum(xh(:));
i = find(xh);
h = - sum(xh(i).*log2(xh(i)));
