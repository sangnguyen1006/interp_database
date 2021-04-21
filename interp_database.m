%noi suy cho mo phong MC
lamda_interp=[400 1100];%khoang buoc song muon noi suy
xq=lamda_interp(1):1:lamda_interp(length(lamda_interp));%các buoc song cho noi suy

name=["epi","der","subf","musc","blo"; %ten file.txt
      "epi_interp.mat","der_interp.mat","subf_interp.mat","musc_interp.mat","blo_interp.mat"];

  for i=1:length(name)
      
    %doc file.txt
    nn=name(1,i)+ '.txt';
    fileID =fopen(nn,'r');
    value = fscanf(fileID,'%f %f %f %f',[4 Inf]);
    fclose(fileID); 
    %lay cac gia tri lamda, mua, mus va g
    lamda=value(1,1:size(value,2));    
    mua=value(2,1:size(value,2));   
    mus=value(3,1:size(value,2));    
    g=value(4,1:size(value,2));   
    %noi suy mua, mus va g 
    mua_interp=interp1(lamda, mua, xq,'spline');
    mus_interp=interp1(lamda, mus, xq,'spline');
    g_interp=interp1(lamda, g, xq,'spline');
    %luu vao file.mat
    if name(1,i)=='epi'   epi_interp=[xq',mua_interp',mus_interp',g_interp'];save(name(2,i),'epi_interp');  end
    if name(1,i)=='der'   der_interp=[xq',mua_interp',mus_interp',g_interp'];save(name(2,i),'der_interp');  end
    if name(1,i)=='subf' subf_interp=[xq',mua_interp',mus_interp',g_interp'];save(name(2,i),'subf_interp'); end
    if name(1,i)=='musc' musc_interp=[xq',mua_interp',mus_interp',g_interp'];save(name(2,i),'musc_interp'); end
    if name(1,i)=='blo'   blo_interp=[xq',mua_interp',mus_interp',g_interp'];save(name(2,i),'blo_interp');  end
    
end


     
