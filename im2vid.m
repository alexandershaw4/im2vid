function im2vid(fn)


try   fpath = [pwd, '/', fn];
catch fpath = [pwd, '/im'];
end

pathname = pwd;
D        = 'right';
cam      = camlight(D);
vidObj   = VideoWriter(fpath,'MPEG-4');
set(vidObj,'Quality',100);
open(vidObj);

for num = 1:360
    if num > 1; fprintf(repmat('\b',[1 length(str)])); end
    str = sprintf('building: %d of %d\n',num,360);
    fprintf(str);
    camorbit(1,0,'camera');
    camlight(cam); drawnow;
    
    print(gcf,[pathname,'temp.bmp'],'-dbmp');
    tempimg   = imread([pathname,'temp.bmp']);
    currFrame = im2frame(tempimg);
    currFrame.cdata = imresize(currFrame.cdata,[534,735]);
    writeVideo(vidObj,currFrame);
end

close(vidObj);
delete([pathname,'temp.bmp']);
fprintf('finished\n');