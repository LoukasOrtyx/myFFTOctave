function X = myfftOrtega(x)
  stages = log2(length(x));         # Quantidade de estágios da FFT
  X = myBitReversalOrtega(x);       # Sinal de saída
  W = e ^ -(2j * pi / length(x));   # Fator de Giro
  for stage = 1 : stages
    n_pts = 2^stage;                # Quantidade de pontos em cada bloco da FFT
    half = n_pts / 2;                 
    temp = X;
    count = 1;                      # Variável que percorre os pontos da FFT
    while count < length(x)    
      # k percorre metade de cada bloco e garante que soma e subtração preencham
      # o n-ésimo elemento de X e seu correspondente n-ésimo + length(x) / 2
      for k = 0 : half - 1          
        m = (k * length(x) / (2 ^ stage));    # Expoente do fator de giro.
        X(count) = temp(count) + W ^ m * temp(count + half);
        X(count + half) = temp(count) - W ^ m * temp(count + half);
        count += 1;
      endfor
      count += half;
    endwhile
  endfor
endfunction
