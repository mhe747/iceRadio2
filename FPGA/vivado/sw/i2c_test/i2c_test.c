#include "xparameters.h"
#include "xbasic_types.h"
#include "xstatus.h"
#include "xiic.h"
#include "xil_printf.h"

#define IIC_ADDR	0x20

int main(void){
	int Status;
	u32 StatusReg;
	int ByteCount;
	u8 rd_data;

	xil_printf("I2C test\r\n");
	Status = XIic_DynInit(XPAR_AXI_IIC_0_BASEADDR);
	if (Status != XST_SUCCESS) {
		xil_printf("IIC Controller Init failure\r\n");
		return XST_FAILURE;
	}
	/* Make sure all the Fifo's are cleared and Bus is Not busy. */
	while (((StatusReg = XIic_ReadReg(XPAR_AXI_IIC_0_BASEADDR,
				XIIC_SR_REG_OFFSET)) &
				(XIIC_SR_RX_FIFO_EMPTY_MASK |
				XIIC_SR_TX_FIFO_EMPTY_MASK |
				XIIC_SR_BUS_BUSY_MASK)) !=
				(XIIC_SR_RX_FIFO_EMPTY_MASK |
				XIIC_SR_TX_FIFO_EMPTY_MASK)) {
	}
	/* Read PCF8574 */
	ByteCount = XIic_Recv(XPAR_AXI_IIC_0_BASEADDR, IIC_ADDR, &rd_data, 1, XIIC_STOP);
	xil_printf("Read %d bytes from IIC [0x%02x]\r\n", ByteCount, rd_data);
}
