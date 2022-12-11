#include "utils.h"
#include "QRegularExpression"
#include <QString>
UTILS::UTILS(){
}
QString UTILS::trim(QString str){
       QString st1 =str.split(" ").join("");
       QString st2 =st1.split("\n").join("");
       QString st3 =st2.split("\t").join("");
        return st3;
    }

