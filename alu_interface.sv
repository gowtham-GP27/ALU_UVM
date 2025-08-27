interface alu_interface(input bit clk);
	logic ce, mode , cin , rst;
	logic [`DATA_WIDTH - 1 :0] opa , opb; 
	logic [`CMD_WIDTH - 1 :0] cmd;
	logic [1:0] inp_valid;
	logic [RESULT_WIDTH - 1 :0] res ;
	logic  err , oflow , cout , g , l , e;

	clocking alu_driver_cb @(posedge clk);
		default input #0 output #0;
		output rst;
		output ce , mode ,cin;
		output cmd;
		output inp_valid;
		output opa , opb;  
	endclocking

	clocking alu_monitor_cb @(posedge clk);
		default input #0 output #0;
		input ce , mode ,cin ,rst;
		input cmd;
		input inp_valid;
		input opa , opb;  
		input res ;
		input err , oflow , cout , g , l , e;
	endclocking

	modport DRIVER(clocking alu_driver_cb);
  modport MONITOR(clocking alu_monitor_cb);

endinterface
