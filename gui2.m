function gui2()
clc
global tv1 ;
tv1 = 0 ;

global flg_light ;
flg_light = 0 ;

global flg_hlight ;
flg_hlight = 0 ;

hFig = figure('Toolbar','none','Menubar', 'none',...
    'Name','gui1','Resize','off','CloseRequestFcn',{@my_closereq},...
    'Position',[800 400 400 300],'Color',[0.6 0.6 0.6]);

s1 = uicontrol('Style','slider','Callback', {@s1_callback},'FontSize',14,...
                'Units','normalized','Position',[0.1 0.8 0.5 .08],'Max',10,...
                'Min',0,'SliderStep',[0.01 0.10]);
            
sv1 = uicontrol(gcf,'Style','edit','FontSize',12,'String','',...
        'Units','normalized','Position',[0.6 0.8 0.2 .09],'BackgroundColor','w');  
    
sv1l = uicontrol(gcf,'Style','text','FontSize',12,'String','speed',...
        'Units','normalized','Position',[0.8 0.8 0.2 .09]);    
               
s2 = uicontrol('Style','slider','Callback', {@s2_callback},'FontSize',14,...
                'Units','normalized','Position',[0.1 0.7 0.5 .08],'Max',10,...
                'Min',0,'SliderStep',[0.01 0.10]);            
            
sv2 = uicontrol(gcf,'Style','edit','FontSize',12,'String','',...
        'Units','normalized','Position',[0.6 0.7 0.2 .09],'BackgroundColor','w'); 
    
sv2l = uicontrol(gcf,'Style','text','FontSize',12,'String','',...
        'Units','normalized','Position',[0.8 0.7 0.2 .09]);    
   
s3 = uicontrol('Style','slider','Callback', {@s3_callback},'FontSize',14,...
                'Units','normalized','Position',[0.1 0.6 0.5 .08],'Max',10,...
                'Min',0,'SliderStep',[0.01 0.10]);            
            
sv3 = uicontrol(gcf,'Style','edit','FontSize',12,'String','',...
        'Units','normalized','Position',[0.6 0.6 0.2 .09],'BackgroundColor','w');  
           
sv3l = uicontrol(gcf,'Style','text','FontSize',12,'String','',...
        'Units','normalized','Position',[0.8 0.6 0.2 .09]);     
    
s4 = uicontrol('Style','slider','Callback', {@s4_callback},'FontSize',14,...
                'Units','normalized','Position',[0.1 0.5 0.5 .08],'Max',1,...
                'Min',0,'SliderStep',[0.01 0.10]);            
            
sv4 = uicontrol(gcf,'Style','edit','FontSize',12,'String','',...
        'Units','normalized','Position',[0.6 0.5 0.2 .09],'BackgroundColor','w'); 
    
sv4l = uicontrol(gcf,'Style','text','FontSize',12,'String','transp-cy',...
        'Units','normalized','Position',[0.8 0.5 0.2 .09]);
    
s5 = uicontrol('Style','slider','Callback', {@s5_callback},'FontSize',14,...
                'Units','normalized','Position',[0.1 0.4 0.5 .08],'Max',10,...
                'Min',0,'SliderStep',[0.01 0.10]);            
            
sv5 = uicontrol(gcf,'Style','edit','FontSize',12,'String','',...
        'Units','normalized','Position',[0.6 0.4 0.2 .09],'BackgroundColor','w');
    
sv5l = uicontrol(gcf,'Style','text','FontSize',12,'String','light int',...
        'Units','normalized','Position',[0.8 0.4 0.2 .09]);
    
   
s6 = uicontrol('Style','slider','Callback', {@s6_callback},'FontSize',14,...
                'Units','normalized','Position',[0.1 0.3 0.5 .08],'Max',10,...
                'Min',0,'SliderStep',[0.01 0.10]);            
            
sv6 = uicontrol(gcf,'Style','edit','FontSize',12,'String','',...
        'Units','normalized','Position',[0.6 0.3 0.2 .09],'BackgroundColor','w');  
    
sv6l = uicontrol(gcf,'Style','text','FontSize',12,'String','sun int',...
        'Units','normalized','Position',[0.8 0.3 0.2 .09]);
    
start_wrl = uicontrol('String','start','Callback', {@start_wrl_callback},'FontSize',14,...
            'Units','normalized','Position',[0.1 0.18 0.15 .1]);
        
stop_wrl = uicontrol('String','stop','Callback', {@stop_wrl_callback},'FontSize',14,...
            'Units','normalized','Position',[0.1 0.06 0.15 .1]);     

light_wrl = uicontrol('String','light','Callback', {@light_wrl_callback},'FontSize',14,...
            'Units','normalized','Position',[0.3 0.18 0.15 .1]);
        
hlight_wrl = uicontrol('String','hlight','Callback', {@hlight_wrl_callback},'FontSize',14,...
            'Units','normalized','Position',[0.3 0.06 0.15 .1]);  
        
t = timer('period',0.02);
set(t,'ExecutionMode','fixedrate','StartDelay',0.5);
set(t,'timerfcn',@mytimer_callback);
% start(t);

myw = vrworld('FC1.wrl');
%  myw = vrworld('HELICAL GEAR .wrl');

open(myw)
f = vrfigure(myw);

% tg41 = vrnode(myw,'group04-TIMER');
% tg51 = vrnode(myw,'group05-TIMER');

light1 = vrnode(myw,'light');
sun1   = vrnode(myw,'sun');

axis off; 

% [X> B^ W H]
function s1_callback(hObject,eventdata)
    
 T1=get(s1,'value');
 set(sv1,'string',T1)
 tg41.cycleInterval = T1;


end 
function s2_callback(hObject,eventdata)
    
 T1=get(s2,'value');
 set(sv2,'string',T1)
 tg51.cycleInterval = T1;



end 
function s3_callback(hObject,eventdata)
    
 T1=get(s3,'value');
 set(sv3,'string',T1)

 
end

function s4_callback(hObject,eventdata)
    
 T1=get(s4,'value');
 set(sv4,'string',T1)
 myw.Elev_box_01.children.appearance.material.transparency=T1;
 myw.Elev_box_0.children.appearance.material.transparency=T1;
 myw.Elev_box.children.appearance.material.transparency=T1;
  
 end
function s5_callback(hObject,eventdata)
    
 T1=get(s5,'value');
 set(sv5,'string',T1)
 light1.intensity = T1;
 
end

function s6_callback(hObject,eventdata)
    
 T1=get(s6,'value');
 set(sv6,'string',T1)
 sun1.intensity = T1;

end

function start_wrl_callback(hObject,eventdata)
    
 start(t);
  
end    
function stop_wrl_callback(hObject,eventdata)
    
 stop(t);
  
end    
function light_wrl_callback(hObject,eventdata)

if (flg_light == 0)
set(f,'Lighting','off')
flg_light = 1 ;
else
set(f,'Lighting','on')
flg_light = 0 ;
end
  
end
function hlight_wrl_callback(hObject,eventdata)

if (flg_hlight == 0)
set(f,'Headlight','off')
flg_hlight = 1 ;
else
set(f,'Headlight','on')
flg_hlight = 0 ;
end
    

%%

  
end    

function mytimer_callback(hObject,eventdata)
    
 tv1 = tv1 + 0.01 ;   
 set(myw,'Time', tv1);
%  vrdrawnow;
  
end    
        %%
function my_closereq(hObject,eventdata)
   delete(timerfind)
   close(myw); 
   delete(myw);
   delete(gcf);
 end 
end