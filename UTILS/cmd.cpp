#include "cmd.h"
#include <QString>
#include <array>
#include <stdexcept>
#include <stdio.h>
#include <QVariant>
#include <cstdio>
CMD::CMD(){
}
QString CMD::exec(char *cmd){

            std::array<char, 128> buffer;
            QString result;
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
