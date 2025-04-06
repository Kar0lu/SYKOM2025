# Compiler and flags
CC?=gcc

# Directories
SRC_DIR=src
OBJ_DIR=build

# Files
SRC_FILES=$(SRC_DIR)/main.c
OBJ_FILES=$(SRC_FILES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
EXEC=$(OBJ_DIR)/main

# OS detection
UNAME_S:=$(shell uname -s)
ifeq (,$(filter($(UNAME_S),Linux Darwin)))
    RM=rm -f
    MKDIR=mkdir -p
else
    RM=del /f /q
    MKDIR=mkdir
endif

# Default target
all: clean $(EXEC)

# Create object directory
$(OBJ_DIR):
	$(MKDIR) $(OBJ_DIR)

# Build executable from object files
$(EXEC): $(OBJ_FILES)
	$(CC) $(OBJ_FILES) -o $(EXEC)

# Build object files from source files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(OBJ_DIR)
	$(CC) -c $< -o $@

# Clean up build files
clean:
	$(RM) $(OBJ_DIR)/*