function [lspeed,rspeed] = avoid(readings)

%avoid Returns the left and right wheels speed for collision avoidance
%   Detailed explanation goes here
%
% Copyright (C) 2023 Javier de Lope
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

if (readings(4) < 0.1) || (readings(5) < 0.2)
    lspeed = +0.1;
    rspeed = -0.8;
elseif (readings(2) < 0.1)
    lspeed = +1.3;
    rspeed = +0.6;
elseif (readings(6) < 0.4)
    lspeed = +0.1;
    rspeed = +0.9;
else
    lspeed = +1.5;
    rspeed = +1.5;
end

end