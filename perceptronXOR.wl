(* Definir el conjunto de datos para XOR *)
xorData = {
  {{0, 0}, 0},
  {{0, 1}, 1},
  {{1, 0}, 1},
  {{1, 1}, 0}
};

(* Crear una red neuronal con una capa oculta *)
net = NetChain[{
    LinearLayer[2],   (* Capa oculta con 2 neuronas *)
    Tanh,             (* Activación no lineal *)
    LinearLayer[1],   (* Capa de salida con 1 neurona *)
    LogisticSigmoid   (* Activación sigmoide para salida entre 0 y 1 *)
  },
  "Input" -> 2
];

(* Entrenar la red con los datos de XOR *)
trainedNet = NetTrain[net, xorData, ValidationSet -> Scaled[0.2]];

(* Probar la red entrenada *)
results = Table[
  {input, trainedNet[input]},
  {input, {{0, 0}, {0, 1}, {1, 0}, {1, 1}}}
];

(* Mostrar los resultados en una tabla *)
Grid[{{"Input", "Output"}, Sequence @@ results}]
