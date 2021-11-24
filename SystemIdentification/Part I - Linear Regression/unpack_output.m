function Y_out = unpack_output(Y)
% UNPACK_OUTPUT takes the "flattened" (reshaped output into a single column
% vector) and reshapes it in a format that permits plotting. 
dim = sqrt(length(Y));
Y_out = Y(1:dim);
for i = 2:dim  
    Y_out = [Y_out, Y((i-1)*dim+1:dim*i)];
end

end
