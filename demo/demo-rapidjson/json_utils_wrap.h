#pragma once

#include <string>
#include "rapidjson/reader.h"
#include "rapidjson/stringbuffer.h"
#include "rapidjson/filereadstream.h"
#include "rapidjson/filewritestream.h"
#include "rapidjson/error/en.h"
#include "rapidjson/document.h"

namespace jsonutils
{
    inline bool doesFileExist(const std::string& /* file */)
    {
        //Simulate that we are checking file existence
        return true;
    }
    rapidjson::Document loadFromUrl(const std::string&  url );
    rapidjson::Document loadFromFile(const std::string& file);
}
