function im2vid_multi(h,fn)
% 3D Image to video by rotating camera. 
% This version for figures with SUBPLOTS.
%
%
% AS

try   fpath = [pwd, '/', fn];
catch fpath = [pwd, '/im'];
end

C = findobj(h,'type','axes');
vidObj   = VideoWriter(fpath,'MPEG-4');
set(vidObj,'Quality',100);
open(vidObj);

for num = 1:360
    if num > 1; fprintf(repmat('\b',[1 length(str)])); end
    str = sprintf('building: %d of %d\n',num,360);
    fprintf(str);
    
    for i = 1:length(C)
        set(h, 'currentaxes', C(i));
        camorbit(1,0,'camera');
    end
        currFrame = getframe(h);
        writeVideo(vidObj,currFrame);
end

close(vidObj);
fprintf('finished\n');