module blink_1s(
    input clk,        // Reloj de entrada de 50 MHz de la Altera.
    input rst,        // Señal de reset, utilizada para reiniciar el módulo.
    output reg fdiv   // Salida que genera una señal de frecuencia dividida (1 Hz).
);

parameter tam = $clog2(50000000);  // Calcula el tamaño del contador para contar hasta 50 Millones.
reg [tam-1:0] count;               // Registro que se utiliza para contar los ciclos del reloj de entrada.

initial begin
    fdiv = 1'b0; // Inicializa la salida 'fdiv' en 0 (inicia con un estado bajo).
    count = 'b0;  // Inicializa el contador en 0.
end

always @(posedge clk) begin
    if (rst == 1) begin                   // Si la señal de reset está activada...
        fdiv <= 1'b0;                     // Reinicia la señal de salida 'fdiv' a 0.
        count <= 1'b0;                    // Reinicia el contador 'count' a 0.
    end else if(count == 25000000) begin  // Si el contador alcanza 25 millones...
        count <= 1'b0;                    // Reinicia el contador a 0 para comenzar a contar de nuevo.
        fdiv <= ~fdiv;                    // Invierte el valor de 'fdiv', generando una señal de 1 Hz.
    end else begin                        // Si el contador no ha alcanzado el valor de 25 Millones...
        count <= count + 1'b1;            // Incrementa el contador en 1.
    end
end
    
endmodule

