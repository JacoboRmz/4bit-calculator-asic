# 4-bit Calculator ASIC

Este proyecto implementa una **calculadora de 4 bits en Verilog** capaz de realizar operaciones aritméticas básicas.  
El diseño incluye un **testbench para simulación** y está preparado para integrarse en un flujo de diseño ASIC utilizando OpenLane.

El objetivo del proyecto es demostrar conceptos fundamentales de:

- Diseño RTL en Verilog
- Simulación mediante testbench
- Visualización de señales
- Flujo básico de diseño ASIC

---

# Operaciones soportadas

La calculadora recibe dos operandos de 4 bits (`A` y `B`) y un selector de operación (`OP`).

| OP | Operación |
|----|-----------|
| 00 | Suma |
| 01 | Resta |
| 10 | Multiplicación |
| 11 | División |

Salida principal:

- `RESULT[7:0]` → resultado de la operación

La suma incluye el **bit de acarreo (carry)**.

Para la división se incluye una **protección contra división por cero**, retornando `0` si `B = 0`.

---

# Arquitectura del diseño

El módulo principal `calculator` utiliza:

- `adder4` → suma de 4 bits
- `subtractor4` → resta de 4 bits
- operador `*` → multiplicación
- operador `/` → división

La selección de operación se realiza mediante una estructura `case(OP)`.

---

# Testbench

El testbench realiza pruebas automáticas para múltiples combinaciones de entrada.

Se recorren:

- 4 operaciones (`OP`)
- valores de `A` de `0` a `9`
- valores de `B` de `0` a `9`

Esto permite verificar el comportamiento del diseño en diferentes escenarios.

Durante la simulación se genera el archivo de ondas:
wave.vcd


---

# Estructura del proyecto

4bit-calculator-asic

│

├── src

│ ├── calculator.v

│ ├── adder4.v

│ └── subtractor4.v

│

├── testbench

│ ├── calculator_tb.v

│ └── TestSimulation.pdf

│

├── runs

│ └── (archivos generados por OpenLane)

│

└── README.md


---

# Simulación

La simulación se realiza utilizando **Icarus Verilog**.


### Compilar el diseño
iverilog -o sim.vvp src/*.v testbench/calculator_tb.v

### Ejecutar la simulación
vvp sim.vvp

Esto generará el archivo:
wave.vcd


### Visualizar las señales
gtkwave wave.vcd


---

# Resultado de la simulación

La captura de las señales obtenidas durante la simulación puede consultarse en:
testbench/TestSimulation.pdf


Este archivo contiene el resultado visual del testbench ejecutado en GTKWave.

---

# Flujo ASIC

El proyecto está preparado para ejecutarse dentro del flujo **OpenLane**, que permite automatizar las siguientes etapas del diseño ASIC:

- síntesis lógica
- placement
- routing
- generación del layout del chip

---

# Herramientas utilizadas

- Verilog HDL
- OpenLane
- Icarus Verilog
- GTKWave

---

# Autor

Jacobo Ramírez

Proyecto educativo de diseño digital orientado a ASIC.
