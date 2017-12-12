function varargout = formtoko(varargin)
% FORMTOKO M-file for formtoko.fig
%      FORMTOKO, by itself, creates a new FORMTOKO or raises the existing
%      singleton*.
%
%      H = FORMTOKO returns the handle to a new FORMTOKO or the handle to
%      the existing singleton*.
%
%      FORMTOKO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORMTOKO.M with the given input arguments.
%
%      FORMTOKO('Property','Value',...) creates a new FORMTOKO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before formtoko_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to formtoko_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help formtoko

% Last Modified by GUIDE v2.5 20-Nov-2016 14:47:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @formtoko_OpeningFcn, ...
                   'gui_OutputFcn',  @formtoko_OutputFcn, ...
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


% --- Executes just before formtoko is made visible.
function formtoko_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to formtoko (see VARARGIN)

% Choose default command line output for formtoko
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes formtoko wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = formtoko_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function nama_Callback(hObject, eventdata, handles)
% hObject    handle to nama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nama as text
%        str2double(get(hObject,'String')) returns contents of nama as a double


% --- Executes during object creation, after setting all properties.
function nama_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.nama,'String',num2str(''));
set(handles.teddy,'String',num2str(''));
set(handles.doraemon,'String',num2str(''));
set(handles.stitch,'String',num2str(''));
set(handles.domo,'String',num2str(''));
set(handles.kitty,'String',num2str(''));

% --- Executes on button press in kwitansi.
function kwitansi_Callback(hObject, eventdata, handles)
% hObject    handle to kwitansi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Radiobutton
konten = get(get(findobj(gcf,'Tag','metode'),'SelectedObject'),'String');
pilihan = strcmp(konten,'Uang Tunai');
if pilihan
    mtd = 'Uang Tunai';
else
    mtd = 'Kartu Kredit';
end;

%Checkbox
syarat = get(handles.diskon,'value');

if syarat == 1 
    diskon = 'mendapatkan';
else
    diskon = 'tidak mendapatkan';
end;

nama = get(handles.nama,'String');

%Cetak Tanggal
tanggal = datestr(now,'dd-mm-yyyy')

%Daftar Barang
tddy = get(handles.teddy,'String');
drmn = get(handles.doraemon,'String');
sttch = get(handles.stitch,'String');
dmo = get(handles.domo,'String');
ktty = get(handles.kitty,'String');

teddyy = str2num(tddy);
doraemonn = str2num(drmn);
stitchh = str2num(sttch);
domoo = str2num(dmo);
kittyy = str2num(ktty);

item1 = (teddyy);
item2 = (doraemonn);
item3 = (stitchh);
item4 = (domoo);
item5 = (kittyy);

angka = ((teddyy*950)+(doraemonn*650)+(stitchh*900)+(domoo*800)+(kittyy*700));
item = (teddyy+doraemonn+stitchh+domoo+kittyy);

%Konversi ke huruf
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

struk();
set(findobj(gcf,'Tag','nama'),'String',nama);
set(findobj(gcf,'Tag','metode'),'String',mtd);
set(findobj(gcf,'Tag','angka'),'String',angka);
set(findobj(gcf,'Tag','konversi'),'String',konversi);
set(findobj(gcf,'Tag','tanggal'),'String',tanggal);
set(findobj(gcf,'Tag','item'),'String',item);
set(findobj(gcf,'Tag','item1'),'String',item1);
set(findobj(gcf,'Tag','item2'),'String',item2);
set(findobj(gcf,'Tag','item3'),'String',item3);
set(findobj(gcf,'Tag','item4'),'String',item4);
set(findobj(gcf,'Tag','item5'),'String',item5);
set(findobj(gcf,'Tag','diskon'),'String',diskon);

% --- Executes on button press in grafik.
function grafik_Callback(hObject, eventdata, handles)
% hObject    handle to grafik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Daftar Barang
tddy = get(handles.teddy,'String');
drmn = get(handles.doraemon,'String');
sttch = get(handles.stitch,'String');
dmo = get(handles.domo,'String');
ktty = get(handles.kitty,'String');

teddyy = str2num(tddy);
doraemonn = str2num(drmn);
stitchh = str2num(sttch);
domoo = str2num(dmo);
kittyy = str2num(ktty);

stiker1 = (teddyy*950);
stiker2 = (doraemonn*650);
stiker3 = (stitchh*900);
stiker4 = (domoo*800);
stiker5 = (kittyy*700);

stiker6 = (teddyy*950)-(teddyy*950*0.1);
stiker7 = (doraemonn*650)-(doraemonn*650*0.1);
stiker8 = (stitchh*900)-(stitchh*900*0.1);
stiker9 = (domoo*800)-(domoo*800*0.1);
stiker10 = (kittyy*700)-(kittyy*700*0.1);

grafik();
x=1:5;
y=[stiker1 stiker2 stiker3 stiker4 stiker5];
y1 = [stiker6 stiker7 stiker8 stiker9 stiker10];
set(findobj(gcf,'Tag','graf'),'Visible','on');
plot(x,y,x,y1)

function teddy_Callback(hObject, eventdata, handles)
% hObject    handle to teddy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
% Hints: get(hObject,'String') returns contents of teddy as text
%        str2double(get(hObject,'String')) returns contents of teddy as a double


% --- Executes during object creation, after setting all properties.
function teddy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to teddy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function doraemon_Callback(hObject, eventdata, handles)
% hObject    handle to doraemon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of doraemon as text
%        str2double(get(hObject,'String')) returns contents of doraemon as a double


% --- Executes during object creation, after setting all properties.
function doraemon_CreateFcn(hObject, eventdata, handles)
% hObject    handle to doraemon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stitch_Callback(hObject, eventdata, handles)
% hObject    handle to stitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stitch as text
%        str2double(get(hObject,'String')) returns contents of stitch as a double


% --- Executes during object creation, after setting all properties.
function stitch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function domo_Callback(hObject, eventdata, handles)
% hObject    handle to domo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of domo as text
%        str2double(get(hObject,'String')) returns contents of domo as a double


% --- Executes during object creation, after setting all properties.
function domo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to domo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kitty_Callback(hObject, eventdata, handles)
% hObject    handle to kitty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kitty as text
%        str2double(get(hObject,'String')) returns contents of kitty as a double


% --- Executes during object creation, after setting all properties.
function kitty_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kitty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in diskon.
function diskon_Callback(hObject, eventdata, handles)
% hObject    handle to diskon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of diskon
