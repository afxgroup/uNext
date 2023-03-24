NAME = uNext
CC = ppc-amigaos-g++
FLAGS = -mcrt=clib2 -O2 -mstrict-align -I/usr/ppc-amigaos/SDK/local/clib2/include/SDL2 -std=c++11 -w -Wfatal-errors
DEBUG_FLAGS ?= -gstabs
SRC = $(shell find $(SOURCEDIR) -name '*.cpp')
LIBS =-lSDL2_mixer -lmpg123 -lmad -lvorbisfile -lvorbis -logg -lSDL2_ttf -lSDL2_NO_GL4ES -lz -athread=native
OBJ = $(SRC:.cpp=.o)
RM = rm -rf
STRIP = ppc-amigaos-strip

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(FLAGS) $(OBJ) -o $(NAME)_no_strip $(LIBS)
	$(STRIP) $(NAME)_no_strip -o $(NAME)

.cpp.o:
	$(CC) $(DEBUG_FLAGS) $(FLAGS) -c $< -o $@

clean:
	$(RM) *.o
	$(RM) $(NAME)_no_strip
	$(RM) $(NAME)
