# This is a sample Python script.
from urllib.parse import unquote
from urllib.parse import quote
import re

def encodeURL(url):
    url = url.replace(":///", "://")
    index = url.find("://")
    prefix = ""
    subfix = url
    if index >= 0:
        prefix = url[:index+3]
        subfix = url[index+3:]
        subfix = subfix.replace("//", "/")

    new_subfix = quote(subfix)

    new_url = prefix + new_subfix

    return new_url

def parse_warning(warning):
    line = -1
    url = ""

    regex = "\[\s*line:\s*\d+,\scol:\s*\d+\s*\]"
    x = re.findall(regex, warning)
    if x:
        line_col = x[0]
        line_regex = "\d+"
        line = int(re.findall(line_regex, line_col)[0])
        warning_msg = warning.split(line_col)[1].strip()
        if "Bad IRI" in warning_msg:
            url_regex = "\<.+\>"
            url = re.findall(url_regex, warning_msg)[0]
            url = url[1:-1]
        else:
            line = -1

    return line, url



# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    #warning = "12:03:01 WARN  riot            :: [line: 2449951321, col: 3 ] Bad IRI: <https://dramanze@gmail.com> Code: 58/PROHIBITED_COMPONENT_PRESENT in USER: A component that is prohibited by the scheme is present."
    #warning = "10:29:29 WARN  riot            :: [line: 3123177, col: 10] Bad IRI: <https://memory-alpha.fandom.com/wiki/USS_Voyager#Crew?oldid=2476206#Command_crew> Code: 0/ILLEGAL_CHARACTER in FRAGMENT: The character violates the grammar rules for URIs/IRIs."
    #line, url = parse_warning(warning)
    #print(line)
    #print(url)
    #print(encodeURL(url))

    # riot_log_file = "riot_validate_ttl.log"
    # line_url_dic = {}
    # with open(riot_log_file, encoding="utf8") as f:
    #     for line in f:
    #         line_num, url = parse_warning(line)
    #         if line_num != -1:
    #             line_url_dic[line_num] = url
    #         else:
    #             if "Bad IRI" in line:
    #                 print(line)

    riot_log_file = "riot_validate_ttl.log"
    input_wikidata_file = "/org_input/latest-all.ttl"
    line_url_dic = {}
    with open(riot_log_file, encoding="utf8") as f:
        for line in f:
            line_num, url = parse_warning(line)
            if line_num != -1:
                line_url_dic[line_num] = url

    with open(input_wikidata_file, encoding="utf8") as f:
        for i,line in enumerate(f):
            line = line.replace("\n", "", 1)
            if i + 1 in line_url_dic.keys():
                url = line_url_dic[i+1]
                new_url = encodeURL(url)
                new_line = line.replace(url, new_url)
                print(new_line)
            else:
                print(line)

