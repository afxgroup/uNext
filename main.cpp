#include "header.h"
#include "Core.h"

static const char __attribute__((used)) min_stack[] = "$STACK:1024000";
static const char __attribute__((used)) nano_version[] = "\0$VER: uNext for AmigaOS4 (23.03.2023)";

int main(int argc, char *argv[]) {
	CCore oCore;
	oCore.mainLoop();
	return 0;
}
