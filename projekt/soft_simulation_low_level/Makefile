# Compiler and flags
CC?=gcc

# Directories
SRC_DIR:=src
OBJ_DIR:=build
DATA_DIR:=data

# Files
SRC_FILES:=$(SRC_DIR)/main.c $(SRC_DIR)/low_level.c $(SRC_DIR)/preprocess_angle.c $(SRC_DIR)/postprocess_quarters.c
OBJ_FILES:=$(SRC_FILES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
EXEC:=$(OBJ_DIR)/main

RM:=rm -f
MKDIR:=mkdir -p

# Default target
all: $(EXEC)

# Create object directory
$(OBJ_DIR):
	$(MKDIR) $(OBJ_DIR)

# Create data directory
${DATA_DIR}:
	$(MKDIR) ${DATA_DIR}
	
# Build executable from object files
$(EXEC): $(OBJ_FILES) ${DATA_DIR}
	$(CC) $(OBJ_FILES) -o $(EXEC) -lm

# Build object files from source files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(OBJ_DIR)
	$(CC) -c $< -o $@

# Clean up build files
clean:
	$(RM) $(OBJ_DIR)/*
	$(RM) ${DATA_DIR}/*.txt