.PHONY: clean All Project_Title Project_Build

All: Project_Title Project_Build

Project_Title:
	@echo "----------Building project:[ BLE_peripheral - BuildSet ]----------"

Project_Build:
	@make -r -f BLE_peripheral.mk -j 8 -C  ./ 


clean:
	@echo "----------Cleaning project:[ BLE_peripheral - BuildSet ]----------"

