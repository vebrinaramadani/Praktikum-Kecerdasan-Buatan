function varargout = formhasil(varargin)
% FORMHASIL M-file for formhasil.fig
%      FORMHASIL, by itself, creates a new FORMHASIL or raises the existing
%      singleton*.
%
%      H = FORMHASIL returns the handle to a new FORMHASIL or the handle to
%      the existing singleton*.
%
%      FORMHASIL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORMHASIL.M with the given input arguments.
%
%      FORMHASIL('Property','Value',...) creates a new FORMHASIL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before formhasil_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to formhasil_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help formhasil

% Last Modified by GUIDE v2.5 19-Nov-2016 14:51:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @formhasil_OpeningFcn, ...
                   'gui_OutputFcn',  @formhasil_OutputFcn, ...
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


% --- Executes just before formhasil is made visible.
function formhasil_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to formhasil (see VARARGIN)

% Choose default command line output for formhasil
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes formhasil wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = formhasil_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
%fungsi konversi untuk satuan 
function huruf = satuan(angka)

hasilnya = [];

switch(angka)
    case 1, hasilnya = [' satu'];
    case 2, hasilnya = [' dua'];
    case 3, hasilnya = [' tiga'];
    case 4, hasilnya = [' empat'];
    case 5, hasilnya = [' lima'];
    case 6, hasilnya = [' enam'];
    case 7, hasilnya = [' tujuh'];
    case 8, hasilnya = [' delapan'];
    case 9, hasilnya = [' sembilan'];
    case 10, hasilnya = [' sepuluh'];
    case 11, hasilnya = [' sebelas'];
end

huruf = hasilnya;

%fungsi konversi untuk belasan
function huruf = belasan(angka)

hasilsisa = mod(angka, 10);
hasilbagi = floor(angka / 10);
hasilnya = [];

   hasilbagi == 1
   hasilnya = [' belas'];    
        hasilsisa ~= 0 && hasilsisa <= 11 
        hasilnya = [satuan(hasilsisa) hasilnya];
huruf = hasilnya;

%fungsi konversi untuk puluhan
function huruf = puluhan(angka)

hasilsisa = mod(angka, 10);
hasilbagi = floor(angka / 10);
hasilnya = [];

if hasilbagi == 1
   hasilnya = [' puluh'];
    
   hasilsisa ~= 0 && hasilsisa <= 11
   hasilnya = [hasilnya satuan(hasilsisa)];
else
    hasilnya = satuan(hasilbagi);
    hasilnya = [hasilnya ' puluh'];
    
    hasilsisa ~= 0 && hasilsisa <= 9 
    hasilnya = [hasilnya satuan(hasilsisa)];
end

huruf = hasilnya;

%fungsi konversi untuk ratusan
function huruf = ratusan(angka)

hasilsisa = mod(angka, 100);
hasilbagi = floor(angka / 100);
hasilnya = [];

if hasilbagi == 1
    
    hasilnya = [' seratus'];
    
    if hasilsisa ~= 0 && hasilsisa <= 11
       hasilnya = [hasilnya satuan(hasilsisa)];
    elseif hasilsisa >= 12 && hasilsisa <= 19
           hasilnya = [hasilnya belasan(hasilsisa)];
    elseif hasilsisa >= 20 && hasilsisa <= 99
           hasilnya = [hasilnya puluhan(hasilsisa)];
    end
else
    hasilnya = satuan(hasilbagi);
    hasilnya = [hasilnya ' ratus'];
    
    if hasilsisa ~= 0 && hasilsisa <= 11
       hasilnya = [hasilnya satuan(hasilsisa)];
    elseif hasilsisa >= 12 && hasilsisa <= 19
           hasilnya = [hasilnya belasan(hasilsisa)];
    elseif hasilsisa >= 20 && hasilsisa <= 99
           hasilnya = [hasilnya puluhan(hasilsisa)];
    end
end

huruf = hasilnya;

%fungsi konversi untuk ribuan 
function huruf = ribuan(angka)

hasilsisa = mod(angka, 1000);
hasilbagi = floor(angka / 1000);
hasilnya = [];

if hasilbagi == 1
    hasilnya = [' seribu'];
    
    if hasilsisa ~= 0 && hasilsisa <= 11
       hasilnya = [hasilnya satuan(hasilsisa)];
    elseif hasilsisa >= 12 && hasilsisa <= 19
           hasilnya = [hasilnya belasan(hasilsisa)];
    elseif hasilsisa >= 20 && hasilsisa <= 99
           hasilnya = [hasil puluhan(hasilsisa)];
    elseif hasilsisa >= 100 && hasilsisa <= 999
           hasilnya = [hasilnya ratusan(hasilsisa)];
    end
else
    hasilnya = satuan(hasilbagi);
    hasilnya = [hasilnya ' ribu'];
    if hasilsisa ~= 0 && hasilsisa <= 11
       hasilnya = [hasilnya satuan(hasilsisa)];
    elseif hasilsisa >= 12 && hasilsisa <= 19
           hasilnya = [hasilnya belasan(hasilsisa)];
    elseif hasilsisa >= 20 && hasilsisa <= 99
           hasilnya = [hasilnya puluhan(hasilsisa)];
    elseif hasilsisa >= 100 && hasilsisa <= 999
           hasilnya = [hasilnya ratusan(hasilsisa)];
    end
end

huruf = hasilnya;

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
satu = get(handles.edit1,'String');
dua = get(handles.edit2,'String');

st = str2num(satu);
da = str2num(dua);

angka = ((st*95000)+(da*65000));

konversi = []; hasilnya = [];
if angka >= 0 && angka <= 11 
    hasilnya = satuan(angka);
elseif angka >=12 && angka <= 19 
    hasilnya = belasan(angka);
elseif angka >= 20 && angka <= 99
    hasilnya = puluhan(angka);
elseif angka >= 100 && angka <= 999 
    hasilnya = ratusan(angka);
elseif angka >= 1000 && angka <= 9999
    hasilnya = ribuan(angka);
end

konversi = [hasilnya];
clear hasilnya;
clc;

hasil();
set(findobj(gcf,'Tag','angka'),'String',angka);
set(findobj(gcf,'Tag','konversi'),'String',konversi);
