## RNA con wolfram

Este proyecto implementa una Red Neuronal Artificial (RNA) básica en *Wolfram Language* para simular el funcionamiento de las compuertas lógicas AND, OR y XOR.  

La base teórica usada es la neurona artificial, la cual combina entradas ponderadas con un sesgo (bias), y aplica una función de activación escalón.

---

## 1. Función escalón/Funcion de activacion (Step Function)

En los tres códigos, se define la misma función de activación:

```wolfram
stepFunction[x_] := If[x > 0, 1, 0]
```

- Si la suma ponderada de las entradas es **mayor que 0**, la salida es **1**.  
- En caso contrario, la salida es **0**.  
- Esta función simula la activación de una neurona artificial.

---

##  2. Compuerta AND

Archivo: `perceptronAND`

```wolfram
perceptronAND[input1_, input2_] := Module[
  {weights, bias, weightedSum},
  
  weights = {1, 1};   (* Pesos de las entradas *)
  bias = -1.5;        (* Sesgo negativo *)

  weightedSum = weights.{input1, input2} + bias;
  stepFunction[weightedSum]
]
```

 **Explicación:**
- Los **pesos** `{1,1}` suman los valores de las entradas.  
- El **sesgo -1.5** asegura que la salida sea **1 solo cuando ambas entradas son 1**.  
- Se probó con todas las combinaciones de entradas `{0,0}, {0,1}, {1,0}, {1,1}`.  

Resultado: Simula correctamente la compuerta **AND**.

<img width="72" height="81" alt="image" src="https://github.com/user-attachments/assets/40c1828f-7bd9-49b1-9e24-e2912cf0d903" />

---

##  3. Compuerta OR

Archivo: `perceptronOR`

```wolfram
perceptronOR[input1_, input2_] := Module[
  {weights, bias, weightedSum},
  
  weights = {1, 1};   (* Pesos de las entradas *)
  bias = -0.5;        (* Sesgo menor que en AND *)

  weightedSum = weights.{input1, input2} + bias;
  stepFunction[weightedSum]
]
```

 **Explicación:**
- Pesos `{1,1}` igual que en AND.  
- El **sesgo es -0.5**, lo que hace que con una sola entrada en 1 la salida ya sea 1.  
- Se probó con todas las combinaciones de entradas.  

Resultado: Simula correctamente la compuerta **OR**.

<img width="69" height="83" alt="image" src="https://github.com/user-attachments/assets/73047a4a-dc2c-47ab-8b42-b1b44b82e6ea" />

---

##  4. Compuerta XOR

Archivo: `perceptronXOR`

```wolfram
perceptronXOR[input1_, input2_] := Module[
  {nandOut, orOut, weightedSum},
  
  nandOut = perceptronNAND[input1, input2];
  orOut   = perceptronOR[input1, input2];

  (* Operación final: OR AND NAND *)
  weightedSum = (orOut + nandOut - 1.5);
  stepFunction[weightedSum]
]
```

 **Explicación:**
- La compuerta **XOR no es linealmente separable**, por eso no se puede implementar con un solo perceptrón.  
- Se construye combinando **dos perceptrones previos**:
  - `perceptronNAND`  
  - `perceptronOR`  
- Finalmente, se aplica una **operación AND** entre esas salidas para obtener la XOR.  

Resultado: Simula correctamente la compuerta **XOR**.

<img width="76" height="81" alt="image" src="https://github.com/user-attachments/assets/ce28325e-cd6b-485b-8168-6229e3450fa7" />
  
---

##  Conclusión

- Se implementaron compuertas lógicas básicas (**AND, OR**) y la compuerta **XOR** con una **red neuronal artificial** en Wolfram Language.  
- La función escalón fue la clave para simular la activación neuronal.  
- La **XOR** necesitó una combinación de perceptrones, demostrando el límite de un perceptrón simple y la necesidad de redes más complejas para problemas no linealmente separables.
