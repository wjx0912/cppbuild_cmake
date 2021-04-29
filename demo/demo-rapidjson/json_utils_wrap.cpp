#include <iostream>
#include "json_utils_wrap.h"

namespace jsonutils
{
    //Extremely poor regex pattern for matching urls
    constexpr auto URL_PATTERN = "(http|https)://(\\w+\\.)+(\\w)/?(\\w+/{0,1})*";

    rapidjson::Document loadFromUrl(const std::string&  url )
    {
        //Download resource and extract message body
        //Return boost::none if something went wrong, e.g. status code >= 300
        rapidjson::Document doc;
        doc.Parse("{\"source\": \"url\"}");

        // force-move into the optional, as some compilers don't do this automatically
        return doc;
    }

    rapidjson::Document loadFromFile(const std::string& file)
    {
        //Load file from local filesystem
        if(!doesFileExist(file))
        {
            return {};
        }

        rapidjson::Document doc;
        doc.Parse("{\"source\": \"file\"}");

        // force-move into the optional, as some compilers don't do this automatically
        return doc;
    }
}
