function v_filled = solve_unknowns(A, v, I)
    % Identify indices of known and unknown values in v
    known_idx = ~isnan(v);
    unknown_idx = isnan(v);

    % Extract submatrices based on known and unknown indices
    A11 = A(known_idx, known_idx);
    A12 = A(known_idx, unknown_idx);
    A21 = A(unknown_idx, known_idx);
    A22 = A(unknown_idx, unknown_idx);
    
    v_known = v(known_idx);
    I_known = I(known_idx);
    I_unknown = I(unknown_idx);

    % Compute the reduced system: A22 * v_unknown = I_unknown - A21 * v_known
    v_unknown = A22 \ (I_unknown - A21 * v_known);

    % Fill the values back into v
    v_filled = v;
    v_filled(unknown_idx) = v_unknown;
end
a