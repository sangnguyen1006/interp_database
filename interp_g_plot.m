%chuong trinh noi suy cho he so di h??ng g
%cac phuong phap noi suy
%vq = interp1(x,v,xq,method) specifies an alternative interpolation method: 
%'linear', 'nearest', 'next', 'previous', 'pchip', 'cubic', 'v5cubic', 
%'makima', or 'spline'. The default method is 'linear'

%nhap file.txt: 4 cot lan luoc la:buoc song, mua, mus va g
%chuong trinh noi suy va ve do thi 

lamda_interp=[400 1100];%khoang buoc song muon noi suy
xq=lamda_interp(1):1:lamda_interp(length(lamda_interp));%cac buoc song muon noi suy
interp_type='spline';%loai noi suy

for i=1:3
    if i==1
       name_color=["epi","der","subf";
                   "Epidermis","Dermis","Subcutaneous fat";
                   "k","r","g";
                   "Black","Red","Green"];%da(bieu bi,ha bi va mo duoi da)
    else if i==2
       name_color=["musc";
                   "muscle";
                   "r";
                   "red"];%co
        else 
       name_color=["blo";
                   "blood";
                   "r";
                   "red"];%mau
        end
    end

figure;
for j=1:size(name_color,2)
    %doc file .txt
    nn=name_color(1,j)+'.txt';
    fileID =fopen(nn,'r');
    value = fscanf(fileID,'%f %f %f %f',[4 Inf]);
    fclose(fileID); 
    %lay gia tri buoc song mau
    lamda=value(1,1:size(value,2));
    %lay he so di huong g
    g=value(4,1:size(value,2));
    %noi suy 
    vq = interp1 (lamda, g, xq, interp_type );
    %ve do thi
    color_type=name_color(3,j)+':.';
    plot (lamda,g,'o', xq, vq,color_type );
    %ten do thi
    xlabel('Lamda(nm)');
    ylabel('g(1/cm)');
    title ( 'Anisotropy coefficients' );
    hold on;
end

xlim ([lamda_interp(1) lamda_interp(length(lamda_interp))]);
% add note
dim = [0.6 0.6 0.3 0.3];
if i==1 str = {'Epidermis: Black','Dermis: Red','Subcutaneous fat: Green'}; end
if i==2 str ={'Muscle'}; end
if i==3 str ={'Blood'}; dim = [0.7 0.5 0.3 0.3]; end
annotation('textbox',dim,'String',str,'FitBoxToText','on');
end
