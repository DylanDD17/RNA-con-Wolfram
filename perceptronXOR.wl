(* Definir la funcion escalon *)
stepFunction[x_] := If[x >= 0, 1, 0]

(* Definir compuerta OR con perceptron *)
perceptronOR[input1_, input2_] := Module[
  {weights, bias, weightedSum},
  
  weights = {1, 1};       (* Pesos positivos *)
  bias = -0.5;            (* Sesgo negativo *)
  
  weightedSum = weights.{input1, input2} + bias;
  stepFunction[weightedSum]
]

(* Definir compuerta NAND con perceptron *)
perceptronNAND[input1_, input2_] := Module[
  {weights, bias, weightedSum},
  
  weights = {-1, -1};     (* Pesos negativos *)
  bias = 1.5;             (* Sesgo positivo *)
  
  weightedSum = weights.{input1, input2} + bias;
  stepFunction[weightedSum]
]

(* Construir compuerta XOR : (OR y NAND) *)
perceptronXOR[input1_, input2_] := Module[
  {nandOut, orOut, weightedSum},
  
  nandOut = perceptronNAND[input1, input2];
  orOut = perceptronOR[input1, input2];
  
  (* Operacion AND final entre OR y NAND *)
  weightedSum = (orOut + nandOut - 1.5);
  stepFunction[weightedSum]
]

(* Probar compuerta XOR *)
testInputs = {{0, 0}, {0, 1}, {1, 0}, {1, 1}};
outputsXOR = perceptronXOR @@@ testInputs;

Thread[testInputs -> outputsXOR]