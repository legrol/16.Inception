# ══ Names ═══════════════════════════════════════════════════════════════════ #
#    -----                                                                     #
NAME 				= PmergeMe

# ══ Colors ══════════════════════════════════════════════════════════════════ #
#    ------                                                                    #
DEL_LINE 			= \033[2K
ITALIC 				= \033[3m
BOLD 				= \033[1m
DEF_COLOR 			= \033[0;39m
GRAY 				= \033[0;90m
RED 				= \033[0;91m
GREEN 				= \033[0;92m
YELLOW 				= \033[0;93m
BLUE 				= \033[0;94m
MAGENTA 			= \033[0;95m
CYAN 				= \033[0;96m
WHITE 				= \033[0;97m
BLACK 				= \033[0;99m
ORANGE 				= \033[38;5;209m
BROWN 				= \033[38;2;184;143;29m
DARK_GRAY 			= \033[38;5;234m
MID_GRAY 			= \033[38;5;245m
DARK_GREEN 			= \033[38;2;75;179;82m
DARK_YELLOW 		= \033[38;5;143m

# ══ Compilation══════════════════════════════════════════════════════════════ #
#    -----------                                                               #
CXX					= c++
RM 					= rm -f
MKD					= mkdir -p

# ══ Directories ═════════════════════════════════════════════════════════════ #
#    -----------                                                               #
SRC_DIR				= ./src
OBJ_DIR				= ./obj
UTL_DIR				= ./utils

# ══ Flags ═══════════════════════════════════════════════════════════════════ #
#    -----                                                                     #
CXXFLAGS 			= -Wall -Werror -Wextra -std=c++98 -Wshadow

# ══ Sources ═════════════════════════════════════════════════════════════════ #
#    -------                                                                   #
SRC 				= ${SRC_DIR}/main.cpp

UTL 				= ${UTL_DIR}/banner.cpp \
						${UTL_DIR}/PmergeMe.cpp

OBJ_SRC				= $(patsubst ${SRC_DIR}/%.cpp, ${OBJ_DIR}/%.o, ${SRC})
OBJ_UTL				= $(patsubst ${UTL_DIR}/%.cpp, ${OBJ_DIR}/%.o, ${UTL})

# ═══ Rules ══════════════════════════════════════════════════════════════════ #
#     -----                                                                    #
all: ${NAME}

${NAME}: ${OBJ_SRC} ${OBJ_UTL}

	@echo "$(YELLOW) Compiling $(NAME) ...$(DEF_COLOR)"
	@${CXX} ${CXXFLAGS} -o ${NAME} ${OBJ_SRC} ${OBJ_UTL}
	@echo "$(WHITE) $(NAME) $(DEF_COLOR) $(GREEN)all created ✓$(DEF_COLOR)"
	@echo ""

${OBJ_DIR}/%.o: ${SRC_DIR}/%.cpp
	@${MKD} $(dir $@)
	@$(CXX) ${CXXFLAGS} -c $< -o $@

${OBJ_DIR}/%.o: ${UTL_DIR}/%.cpp
	@${MKD} $(dir $@)
	@$(CXX) ${CXXFLAGS} -c $< -o $@
	
clean:
	@echo ""
	@echo "$(YELLOW) Removing object files ...$(DEF_COLOR)"
	@$(RM) ${OBJ_DIR}/*.o
	@echo "$(RED)  Object files removed $(DEF_COLOR)"
	@echo ""

fclean:	clean
	@echo "$(YELLOW) Removing binaries ...$(DEF_COLOR)"
	@${RM} ${NAME} ${NAME_BONUS}
	@echo "$(RED)  Binaries removed $(DEF_COLOR)"
	@echo ""

re:	fclean all

.PHONY : all clean fclean bonus re
