function X = myBitReversalOrtega(x)
  X = zeros(1, length(x));
  num_bits = log2(length(x));
  assert(floor(num_bits) == num_bits, 'o tamanho do vetor de entrada x não é uma potência de 2');
  for i = 0 : length(x) - 1
    rev_bin = flip(dec2bin(i, num_bits));
    num = bin2dec(rev_bin) + 1;
    X(num) = x(i + 1);
  endfor
endfunction
