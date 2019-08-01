
function varargout = miniproject1(varargin)
% MINIPROJECT1 MATLAB code for miniproject1.fig
%      MINIPROJECT1, by itself, creates a new MINIPROJECT1 or raises the existing
%      singleton*.
%
%      H = MINIPROJECT1 returns the handle to a new MINIPROJECT1 or the handle to
%      the existing singleton*.
%
%      MINIPROJECT1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINIPROJECT1.M with the given input arguments.
%
%      MINIPROJECT1('Property','Value',...) creates a new MINIPROJECT1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before miniproject1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to miniproject1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help miniproject1

% Last Modified by GUIDE v2.5 16-Oct-2018 15:44:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @miniproject1_OpeningFcn, ...
                   'gui_OutputFcn',  @miniproject1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before miniproject1 is made visible.
function miniproject1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to miniproject1 (see VARARGIN)

% Choose default command line output for miniproject1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes miniproject1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = miniproject1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function input2_Callback(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input2 as text
%        str2double(get(hObject,'String')) returns contents of input2 as a double
input = str2double(get(hObject,'String')); % string属性是字符串，所以必须转换成数值
% 检验输入是否为空，是则将它置为0
if (isempty(input))
     set(hObject,'String','0')
end
handles.input=input
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function input2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in input1.
function input1_Callback(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile( ...
    {'*.jpg;*.tif;*.png;*.bmp','All Image Files';...
    '*.*','All Files' },...
    '请选择图片（可多选）', ...
    'MultiSelect', 'on');
N=max(size(filename));%文件个数
for i=1:N
  n{i}= [pathname,filename{i}];
end
handles.N=N;        %制作成handles结构体，方便以后调用
handles.n=n;  
guidata(hObject,handles)  %必须更新handles结构体




% --- Executes on button press in runb.
function runb_Callback(hObject, eventdata, handles)
% hObject    handle to runb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

while(1)
       for k=1:handles.N;
            f=imread(handles.n{k});
            imshow(f);
            pause(handles.input);
       end
end
