(* Definir funcion escalon *)
stepFunction[x_] := If[x > 0, 1, 0]

(* Perceptron OR *)
perceptronOR[input1_, input2_] := Module[
  {weights, bias, weightedSum},
  
  weights = {1, 1};   (* Pesos *)
  bias = -0.5;        (* Sesgo *)
  
  weightedSum = weights.{input1, input2} + bias;
  stepFunction[weightedSum]
]

(* Probar OR *)
testInputs = {{0, 0}, {0, 1}, {1, 0}, {1, 1}};
outputsOR = perceptronOR @@@ testInputs;

Thread[testInputs -> outputsOR]