# Compiler and flags
CC = gcc

# Directories
SRC_DIR = src
OBJ_DIR = build
INC_DIR = include
DATA_DIR = data

# Files
SRC_FILES = $(SRC_DIR)/main.c $(SRC_DIR)/tan_lut.c $(SRC_DIR)/cordic_cos.c
OBJ_FILES = $(SRC_FILES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
EXEC = $(OBJ_DIR)/main

# OS detection
UNAME_S := $(shell uname -s)
ifeq (,$(filter($(UNAME_S),Linux Darwin)))
    RM = rm -f
    MKDIR = mkdir -p
else
    RM = del /f /q
    MKDIR = mkdir
endif

# Default target
all: $(EXEC)

# Create build and data directories if they don't exist
$(OBJ_DIR) $(DATA_DIR):
	$(MKDIR) $(OBJ_DIR) $(DATA_DIR)

# Build executable from object files
$(EXEC): $(OBJ_FILES)
	$(CC) $(OBJ_FILES) -o $(EXEC)

# Build object files from source files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(OBJ_DIR)
	$(CC) -c $< -o $@

# Run the program
run: $(EXEC)
	./$(EXEC) $(ARG)

# Clean up build files
clean:
	$(RM) $(OBJ_DIR)/*.o
	$(RM) $(OBJ_DIR)/*.exe
	$(RM) data/*.txt