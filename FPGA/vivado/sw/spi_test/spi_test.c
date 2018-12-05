#include "xparameters.h"
#include "xstatus.h"
#include "xspi_l.h"
#include "xil_printf.h"

#define BUFFER_SIZE			 16
#define SPI_BASEADDR	XPAR_AXI_QUAD_SPI_0_BASEADDR

int main(void){
	u32 Control;
	u8 tx_buf[BUFFER_SIZE];
	u8 rx_buf[BUFFER_SIZE];
	u8 curr, prev_a, prev_b;
	int i;

	xil_printf("SPI loopback test\r\n");
	prev_a = 0;
	prev_b = 1;
	for(i=0;i<BUFFER_SIZE;i++){	// Initialize the buffer
		curr = prev_a + prev_b;
		tx_buf[i] = curr;
		prev_a = prev_b;
		prev_b = curr;
	}

	Control = XSpi_ReadReg(SPI_BASEADDR, XSP_CR_OFFSET);
	Control |= (XSP_CR_MASTER_MODE_MASK);
	XSpi_WriteReg(SPI_BASEADDR, XSP_CR_OFFSET, Control);	// Set master mode

	for(i=0;i<BUFFER_SIZE;i++){
		xil_printf("Send [%di] 0x%02x\r\n",i , tx_buf[i]);
		XSpi_WriteReg((SPI_BASEADDR), XSP_DTR_OFFSET, tx_buf[i]);
	}
	// Enable the device.
	Control = XSpi_ReadReg(SPI_BASEADDR, XSP_CR_OFFSET);
	Control |= XSP_CR_ENABLE_MASK;
	Control &= ~XSP_CR_TRANS_INHIBIT_MASK;
	XSpi_WriteReg(SPI_BASEADDR, XSP_CR_OFFSET, Control);
	// Wait for transmit end
	while (!(XSpi_ReadReg(SPI_BASEADDR, XSP_SR_OFFSET) & XSP_SR_TX_EMPTY_MASK));
	for(i=0;i<BUFFER_SIZE;i++){
		if((XSpi_ReadReg(SPI_BASEADDR, XSP_SR_OFFSET) & XSP_SR_RX_EMPTY_MASK) == 0){
			xil_printf("Error, no data in buffer at step %d\r\n",i);
			return XST_FAILURE;
		}
		rx_buf[i] = XSpi_ReadReg((SPI_BASEADDR),	XSP_DRR_OFFSET);
		if(i != 0){	// Skip first byte
			if(rx_buf[i] != tx_buf[i-1]){
				xil_printf("Error, wrong data 0x%02x != 0x%02x at step %d\r\n", rx_buf[i], tx_buf[i-1], i);
				return XST_FAILURE;
			}
		}
	}

	xil_printf("SPI test OK\r\n");
	return XST_SUCCESS;
}
