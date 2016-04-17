%%vid url: https://10.106.50.174/cgi/admin/getSDFile.cgi?file=20160210_181200.mp4&path=DCS-942L/20160210/18/20160210_181200.mp4
%%pic url: https://10.106.50.174/cgi/admin/getSDFile.cgi?file=20160210_181200.mp4&path=DCS-942L/20160210/18/20160210_181200.jpg

%% (1) LOVIS cam: 10.106.50.174
%% (2) LENA cam: 10.106.51.220

%% Initial Variables
startHour = 8;
totalHour = 18;
hour = startHour;

%% Automatic Downloader
while hour <= totalHour
    %% URL variables
    format = {'mp4','jpg'};
    date = '20160412';
    camIP = {'10.106.50.174','10.106.51.220'};
    c = 1;          % camera index: 1 for LOVIS, 2 for LENA
    
    %% Time format manipulation
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
    
    while(minutes <= minutesEnd)
        % Concatenations for single digit situations
        minutesStr = int2str(minutes);
        if minutes < 10
            minutesStrCat = strcat('0',minutesStr);
            minutesStr = minutesStrCat;
        end     
        time = strcat(hourStr,minutesStr ,'00');
        
        %% for all formats available
        for f = 1:length(format)
            %% URL concatenations
            baseUrl = ['https://',camIP{c},'/cgi/admin/getSDFile.cgi?file=',date,'_',time,'.',format{f},'&path=DCS-942L/'];

            semifullPath = [date,hourFolder,date,'_',time,'.',format{f}];
            semifullPath2 = ['https://',camIP{c},'/cgi/admin/getSDFile.cgi?file=',date,'_',time,'.',format{f},'&path=DCS-942L/'] ;
            fullPath = strcat(semifullPath2,semifullPath);

            %% Use browser to save
            web(fullPath,'-browser');
        end
        
        %% update time to next item, then pause
        minutes = minutes + 6;          
       
        pause(35);   % pause here better, 20s enough per download
    end
    %% Counter Increment
    hour = hour + 1;
end