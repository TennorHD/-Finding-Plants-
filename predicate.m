function flag = predicate(region)

%   The following simple example of function PREDICATE is used in 
%   Example 10.9 of the book.  It sets FLAG to TRUE if the 
%   intensities of the pixels in REGION have a standard deviation  
%   that exceeds 10, and their mean intensity is between 0 and 125. 
%   Otherwise FLAG is set to false. 
%
%       
       sd = std2(region);
       m = mean2(region);
       flag = (sd > 10) & (m > 0) & (m < 125);
