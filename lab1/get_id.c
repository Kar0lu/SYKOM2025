#include "include/functions.h"

#define ID_ADDR (0xF800012C)

unsigned long get_id() {
	return RAW_SPACE(ID_ADDR);
}