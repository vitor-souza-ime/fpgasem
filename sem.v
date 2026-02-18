module semaforo (
    input  wire clk,      
    input  wire reset_n,  
    output reg  led_verde,
    output reg  led_amarelo,
    output reg  led_vermelho
);

    // Parametros de tempo (em segundos)
    parameter VERDE_TIME    = 10;
    parameter AMARELO_TIME  = 3;
    parameter VERMELHO_TIME = 5;

    // Clock da placa
    parameter CLK_FREQ = 27000000;

    // Estados
    localparam S_VERDE    = 2'd0;
    localparam S_AMARELO  = 2'd1;
    localparam S_VERMELHO = 2'd2;

    reg [1:0] estado;
    reg [31:0] contador;

    // Logica sequencial
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            estado   <= S_VERDE;
            contador <= 0;
        end else begin
            contador <= contador + 1;

            case (estado)

                S_VERDE: begin
                    if (contador >= VERDE_TIME * CLK_FREQ) begin
                        estado   <= S_AMARELO;
                        contador <= 0;
                    end
                end

                S_AMARELO: begin
                    if (contador >= AMARELO_TIME * CLK_FREQ) begin
                        estado   <= S_VERMELHO;
                        contador <= 0;
                    end
                end

                S_VERMELHO: begin
                    if (contador >= VERMELHO_TIME * CLK_FREQ) begin
                        estado   <= S_VERDE;
                        contador <= 0;
                    end
                end

            endcase
        end
    end

    // Logica de saida (LED ativo em 0)
    always @(*) begin
        // Todos apagados (nivel alto)
        led_verde    = 1;
        led_amarelo  = 1;
        led_vermelho = 1;

        case (estado)
            S_VERDE:    led_verde    = 0;
            S_AMARELO:  led_amarelo  = 0;
            S_VERMELHO: led_vermelho = 0;
        endcase
    end

endmodule
