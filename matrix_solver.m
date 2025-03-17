function v_final=matrix_solver(A,v,I)

    known_idx=~isnan(v);
    unknown_idx=isnan(v);

    % Extract known and unknown matrices.
    A_u=A(:,unknown_idx); % Columns of unknowns
    A_k=A(:,known_idx); % Columns of knowns
    v_k=v(known_idx); % Known elements of v

    % A_u*v_u=I-A_k*v_k
    temp=I-A_k*v_k;
    v_u=A_u\temp;

    v_final=v;
    v_final(unknown_idx)=v_u;
end
