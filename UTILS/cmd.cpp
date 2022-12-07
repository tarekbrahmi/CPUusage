#include "cmd.h"
#include <string>
#include <array>
#include <stdexcept>
#include <stdio.h>
#include <cstdio>
CMD::CMD(){
}
std::string CMD::exec(char *cmd){

            std::array<char, 128> buffer;
            std::string result;
            FILE *fp = popen(cmd, "r");
            if (fp == NULL)
            {
                throw std::runtime_error("failed to execute commande");
            }
            while (fgets(buffer.data(), buffer.size(), fp) != nullptr)
            {
                result += buffer.data();
            }
            int status = pclose(fp);
            if (status == -1)
            {
                throw std::runtime_error("failed to execute commande");
            }
            return result;
}
