function [] = plotCoordinates()
    close all; %closes all previous figures
    global gui; %creates a global gui
    gui.fig = figure(); %creates a figure
    gui.p = plot(0,0); %creates a blank plot
    gui.p.Parent.Position = [0.2 0.25 0.6 0.6]; %determines the position of the plot
    
    gui.buttonGroup = uibuttongroup('visible','on','units','normalized','position',[0 0.4 .15 .25],'selectionchangedfcn',{@dotSelect});
    %creates a button group and calls dotSelect
    gui.r1 = uicontrol(gui.buttonGroup,'style','radiobutton','units','normalized','position',[.1 .8 1 .2],'HandleVisibility','off','string','Blue o');
    %creates a button to change plot points to blue o's
    gui.r2 = uicontrol(gui.buttonGroup,'style','radiobutton','units','normalized','position',[.1 .5 1 .2],'HandleVisibility','off','string','Red -');
    %creates a button to change plot points to a red dash
    gui.r3 = uicontrol(gui.buttonGroup,'style','radiobutton','units','normalized','position',[.1 .2 1 .2],'HandleVisibility','off','string','Green *');
    %creates a button to change plot points to green stars
    
    gui.plotButton = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.43 .03 .14 .07], 'string', 'Plot', 'callback', {@plotData});
    %creates button to plot data by calling plotData
    gui.xEdit = uicontrol('style', 'edit', 'units', 'normalized', 'position',[.3 .87 .14 .06]);
    %creates an edit text box for the x values
    gui.xText = uicontrol('style', 'text', 'units', 'normalized', 'position',[.3 .93 .14 .03], 'string', 'X Values');%creates a label for the X values
    gui.yEdit = uicontrol('style', 'edit', 'units', 'normalized', 'position',[.56 .87 .14 .06]);
    %creates an edit text box for the y values
    gui.yText = uicontrol('style', 'text', 'units', 'normalized', 'position',[.56 .93 .14 .03], 'string', 'Y Values');%creates a label for the Y values  
end

function [] = plotData(~,~) %function that plots the data
    global gui; %uses the global gui
    xArray = str2double(split(get(gui.xEdit, 'String')));
    yArray = str2double(split(get(gui.yEdit, 'String')));
    %converts inputs in edit text boxes to separated values and 
    %converts inputs from a string to a double precision value
    if length(xArray) ~= length(yArray)%checks if the lengths of the arrays are the same
        msgbox('Number of Inputs to not Match!','Input Error','error','modal')
        %error message for different lengths
    %elseif double2num(xArray) && double2num(yArray)
        %msgbox('Not all Inputs are Numbers','Input Error','error','modal')
    else
        plot(xArray,yArray,typeDot())
        %plots the inputs and calls the typeDot function
    end
end

function [type] = dotSelect(~,~) 
    global gui; %uses the global gui
    type = gui.buttonGroup.SelectedObject.String; 
    %determines what button is selected
end

function [str] = typeDot() %outputs type of plot point
    if strcmp(dotSelect(),'Blue o')
        str = 'bo'; %outputs 'bo' if Blue o button is selected
    elseif strcmp(dotSelect(),'Red -')
        str = 'r-'; %outputs 'r-' if Red - button is selected
    elseif strcmp(dotSelect(),'Green *')
        str = 'g*'; %outputs 'g*' if Green * button is selected
    end
end
