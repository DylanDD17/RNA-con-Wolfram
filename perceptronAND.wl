(* Definir la función escalon *)
stepFunction[x_] := If[x > 0, 1, 0]

(* Definir la función perceptron para compuerta AND *)
perceptronAND[input1_, input2_] := Module[
  {weights, bias, weightedSum},
  
  weights = {1, 1};   (* Pesos de las entradas *)
  bias = -1.5;        (* Valor de sesgo *)
  
  weightedSum = weights.{input1, input2} + bias;
  stepFunction[weightedSum]
]

(* Probar el perceptron con todas las combinaciones posibles de entrada *)
testInputs = {{0, 0}, {0, 1}, {1, 0}, {1, 1}};
outputs = perceptronAND @@@ testInputs

Thread[testInputs -> outputs]