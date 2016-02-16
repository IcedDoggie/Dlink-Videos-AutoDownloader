%%format: https://10.106.50.174/cgi/admin/getSDFile.cgi?file=20160210_181200.mp4&path=DCS-942L/20160210/18/20160210_181200.mp4
%% Initial Variables
startHour = 8;
totalHour = 18;
hour = startHour;

%% Automatic Downloader
while hour < totalHour
    %% URL credentials
    format = '.mp4';
    date = '20160215';
    
    
    minutes = 0;
    minutesEnd = 54; % For most case, except from 18(6pm) and 08(8am)
    if hour == 8
        minutes = 30;
    elseif hour == 18
        minutesEnd = 24;
    end 
    
    hourStr = int2str(hour);
    minutesStr = int2str(minutes);
    
    if hour < 10
        hourStr = strcat('0',hourStr);
    end
    
    hourFolder = strcat('/',hourStr,'/');
    
    while(minutes ~= minutesEnd)
        % Concatenations for single digit situations
        if minutes < 10
            minutesStrCat = strcat('0',minutesStr);
            minutesStr = minutesStrCat;
        end
     
        

        time = strcat(hourStr,minutesStr ,'00');
        %% URL concatenations

        baseUrl = strcat( 'https://10.106.50.174/cgi/admin/getSDFile.cgi?file=',date,'_',time,format,'&path=DCS-942L/');

        semifullPath = strcat(date,hourFolder,date,'_',time,'.mp4');
        semifullPath2 = 'https://10.106.50.174/cgi/admin/getSDFile.cgi?file=20160210_181200.mp4&path=DCS-942L/' ;
        fullPath = strcat(semifullPath2,semifullPath);

        %% Complete URL and showtime!
        web(fullPath,'-browser');
        minutes = minutes + 6;
    end
    %% Counter Increment
    hour = hour + 1;
end


