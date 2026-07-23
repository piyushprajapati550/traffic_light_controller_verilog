`timescale 1ns / 1ps

module Traffic_Light_Controller(
    input clk,
    input rst,

    output reg [2:0] light_M1,
    output reg [2:0] light_M2,
    output reg [2:0] light_MT,
    output reg [2:0] light_S);

parameter DIV = 10;        // Simulation:10  FPGA:100000000

parameter S1=0,S2=1,S3=2,S4=3,S5=4,S6=5;
parameter sec7=7,sec5=5,sec3=3,sec2=2;

reg [31:0] div_counter;
reg clk_1s;

reg [2:0] ps;
reg [3:0] count;

// Clock Divider

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        div_counter <= 0;
        clk_1s <= 0;
    end
    else
    begin
        if(div_counter == DIV-1)
        begin
            div_counter <= 0;
            clk_1s <= 1;
        end
        else
        begin
            div_counter <= div_counter + 1;
            clk_1s <= 0;
        end
    end
end
// FSM

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        ps <= S1;
        count <= 0;
    end
    else if(clk_1s)
    begin
        case(ps)

        S1:
        begin
            if(count<sec7)
                count<=count+1;
            else
            begin
                count<=0;
                ps<=S2;
            end
        end

        S2:
        begin
            if(count<sec2)
                count<=count+1;
            else
            begin
                count<=0;
                ps<=S3;
            end
        end

        S3:
        begin
            if(count<sec5)
                count<=count+1;
            else
            begin
                count<=0;
                ps<=S4;
            end
        end

        S4:
        begin
            if(count<sec2)
                count<=count+1;
            else
            begin
                count<=0;
                ps<=S5;
            end
        end

        S5:
        begin
            if(count<sec3)
                count<=count+1;
            else
            begin
                count<=0;
                ps<=S6;
            end
        end

        S6:
        begin
            if(count<sec2)
                count<=count+1;
            else
            begin
                count<=0;
                ps<=S1;
            end
        end

        default:
        begin
            ps<=S1;
            count<=0;
        end

        endcase
    end
end
// Output Logic
always @(*)
begin

case(ps)

S1:
begin
    light_M1 = 3'b001;
    light_M2 = 3'b001;
    light_MT = 3'b100;
    light_S  = 3'b100;
end

S2:
begin
    light_M1 = 3'b001;
    light_M2 = 3'b010;
    light_MT = 3'b100;
    light_S  = 3'b100;
end

S3:
begin
    light_M1 = 3'b001;
    light_M2 = 3'b100;
    light_MT = 3'b001;
    light_S  = 3'b100;
end

S4:
begin
    light_M1 = 3'b010;
    light_M2 = 3'b100;
    light_MT = 3'b010;
    light_S  = 3'b100;
end

S5:
begin
    light_M1 = 3'b100;
    light_M2 = 3'b100;
    light_MT = 3'b100;
    light_S  = 3'b001;
end

S6:
begin
    light_M1 = 3'b100;
    light_M2 = 3'b100;
    light_MT = 3'b100;
    light_S  = 3'b010;
end

default:
begin
    light_M1 = 3'b000;
    light_M2 = 3'b000;
    light_MT = 3'b000;
    light_S  = 3'b000;
end

endcase

end

endmodule
