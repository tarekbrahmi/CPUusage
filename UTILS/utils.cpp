#include "utils.h"
#include <string>

UTILS::UTILS(){
}
std::string UTILS::trim(std::string str){
        str.erase(str.find_last_not_of(" \t\r\v\n"));
        str.erase(0, str.find_first_not_of(" \t\r\v\n"));
        return str;
    }

