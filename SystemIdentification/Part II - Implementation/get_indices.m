function [] = get_indices(arr, start, comb, m)
% This function uses backtracking to get all the combinations with
% repetition necessary to create the regressor.
    global indices_;
    if (length(comb) == m)
        indices_ = [indices_; comb];
        return;
    end
    
    for i = start:length(arr)
        get_indices(arr, i, [comb, arr(i)], m);
    end
end
