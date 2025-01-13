module mirorNumber( 
    input iClk, 
    input iReset_n, 
    input iChipSelect_n, 
    input iWrite_n, 
    input iRead_n, 
    input [1:0] iAddress, 
    input [31:0] iData, 
    output reg [31:0] oData 
);
 
reg [31:0]a, x; 
reg [31:0]reversed;
reg [31:0]original;
reg [31:0]temp;
reg [3:0] i;
 
    always@(posedge iClk, negedge iReset_n) 
    begin 
        if(~iReset_n) 
        begin 
            oData = 32'd0; 
            a = 32'd0; 
            x = 32'd0;
				temp = 32'd0;
				reversed = 32'd0;
				original = 32'd0;
        end 
        else 
        begin 
		  if( ~iChipSelect_n & ~iWrite_n) 
			begin 
				case (iAddress) 
					2'd0: begin
						a[31:0] = iData[31:0];
						temp = a;
						reversed = 32'd0;
					end	
				endcase 
			end 
			if (~iChipSelect_n & ~iRead_n) 
			begin 
				case (iAddress) 
					2'd0: oData = a; 
					2'd1: begin
					
						for (i = 0; i < 10; i = i + 1) begin
							if (temp != 0) begin
							reversed = reversed * 10 + (temp % 10);
							temp = temp / 10;
							end
						end
						
						if (reversed == a) begin
							oData = 32'd1;
						end
						else begin
							oData = 32'd0;
						end
						
					end  
				endcase 
			end 
		end 
	end 
endmodule