#ifndef CMD_H
#define CMD_H
#include <string>

class CMD
{
public:
    CMD();
    std::string exec(char *cmd);
};

#endif // CMD_H
