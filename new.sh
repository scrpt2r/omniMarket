CURRENT_USER=$(whoami)
DIRECTORY=$(pwd)

echo "Welcome Mr.$CURRENT_USER"
echo "Working on a new project are we sir?"
echo 

read -p "Enter project name: " INPUT
PROJECT_NAME=${INPUT:-project}

mkdir $PROJECT_NAME
cd $PROJECT_NAME

touch LICENSE
cat <<EOF >> LICENSE
The MIT License (MIT)

Copyright (c) 2026 Axon Corporation

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. 
EOF

touch README.md
cat <<EOF >> README.md
<h1 id="$PROJECT_NAME" align="center">$PROJECT_NAME</h1>
<div align="center">
    <img src="https://img.shields.io/badge/version-1.0.0-orange" alt="Version">
    <br/>
    <a href="https://opensource.org/licenses/MIT">
        <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License">
    </a>
    <img src="https://img.shields.io/badge/Language-Luau-2C3E50?style=&logo=lua" alt="Luau">
    <img src="https://img.shields.io/badge/Maintained%3F-Sometimes-green.svg" alt="Luau">
    <img src="https://img.shields.io/badge/Open%20Source-%E2%9D%A4-brightgreen" alt="Luau">
</div>
<div align="center">
    Description
</div>

## Table of Contents

## Why does this even exist?

## Features

## Installation
To install this to your computer you have this options;

1. Clone this repository by running following command
    \`\`\`bash
    git clone https://github.com/USERNAME/$PROJECT_NAME
    \`\`\`
2. Get the latest release of .rbxm file from [releases](../../releases)
3. Or add this as a submodule to your project
    \`\`\`bash
    git submodule add https://github.com/USERNAME/$PROJECT_NAME [PATH]
    \`\`\`
Wally will be added in future (I hope).

## Usage

## API

## Found a Bug?
If you encounter any issues or unexpected behavior, please let me know! Your feedback helps make this library more stable.

1. Check the [existing issues](../../issues) to see if it has already been reported.
2. If not, open a [new issue](../../issues/new) and describe the problem.
3. Provide a small code snippet to reproduce the bug if possible.

## Contribution
Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

### Contributing
To maintain the stability of the library, **direct commits to the main branch are restricted.** Please follow the workflow below to suggest changes:

1.  **Fork the Project:** Create your own copy of this repository.
2.  **Create a Feature Branch:**
    \`\`\`bash
    git checkout -b feature/AmazingFeature
    \`\`\`
3.  **Commit your changes:**
    \`\`\`bash
    git commit -m 'Add some AmazingFeature'
    \`\`\`
4.  **Push to branch:**
    \`\`\`bash
    git push origin feature/AmazingFeature
    \`\`\`
5.  **Open a Pull Request:** Navigate to the original repository and click "New Pull Request". Describe your changes in detail so they can be reviewed.

Once your Pull Request is merged, GitHub will automatically list you in the official "Contributors" section of the repository. (i guess so)

After a successful merge, I will also manually add your name and contribution to the table below!

### Guidelines
We appreciate contributions you will make but we will also highly appreciate you to follow our guidelines while contributing.

1.  Of course make sure your code is efficient.
2.  No nsfw links, swearing or anything like those.
3.  Maybe follow the coding style we do.
4.  That's it!

<div id="contributors">
    <h2>Contributors</h2>
    <div align="center">
        <table width="75%">
            <thead>
                <tr>
                    <th align="left">Contributor</th>
                    <th align="left">Description</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><b><a href="https://github.com/USERNAME">USERNAME</a></b></td>
                    <td>Creator</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

## [LICENSE](./LICENSE)
This project is licensed under [The MIT License](https://opensource.org/license/mit)

<div align="right">
    <a href="#$PROJECT_NAME">
        <img src="https://img.shields.io/badge/TOP-↑-blue?style=flat-square" alt="Back to Top">
    </a>
</div>
EOF

aftman init
aftman add rojo-rbx/rojo
aftman install

touch .rojoignore
cat <<EOF >> .rojoignore
.github/
.vscode/
default.project.json
build.project.json
*.md
*.yml
.git/
LICENSE
tests/
EOF

touch build.project.json
cat <<EOF >> build.project.json
{
    "name": "$PROJECT_NAME",
    "tree": {
        "\$path": "src/__index.luau",
        "\$properties": {
            "Attributes": {
                "version": {
                    "String": "1.0.0"
                }
            }
        },
        "libs": {
            "\$className": "Folder",
            "\$path": "src/libs"
        },
        "__log__": {
            "\$path": "src/__log__"
        }
    }
}
EOF

touch default.project.json
cat <<EOF >> default.project.json
{
    "name": "$PROJECT_NAME",
    "tree": {
        "\$className": "DataModel",
        "ReplicatedStorage": {
            "replicated": {
                "\$className": "Folder",
                "packages": {
                    "\$className": "Folder",
                    "$PROJECT_NAME": {
                        "\$properties": {
                            "Attributes": {
                                "version": {
                                    "String": "1.0.0"
                                }
                            }
                        },
                        "\$path": "src/__index.luau",
                        "libs": {
                            "\$path": "src/libs"
                        },
                        "__log__": {
                            "\$path": "src/__log__"
                        }
                    }
                }
            }
        }
    }
}
EOF

touch .gitignore
cat <<EOF >> .gitignore
.vscode
EOF
touch .gitattributes
cat <<EOF >> .gitattributes
# Auto detect text files and perform LF normalization
* text=auto
EOF

mkdir src
mkdir bin
mkdir src/__log__
mkdir src/libs
mkdir src/libs/global

touch src/__index.luau
touch src/__log__/__log__.luau
touch src/__log__/_config.luau
touch src/__log__/_messages.luau

cat <<EOF >> src/__index.luau
--[[
    ******************************************************************************
    * @name         : $PROJECT_NAME
    * @authors      : 
    * @date         : 
    * @lastEdit     : 
    * @brief        : 
    * @version      : 1.0.0
    ******************************************************************************
    * @attention
    *
    * Copyright © 2026 Axon Corporation.
    * All rights reserved.
    *
    * This software is licensed under terms that can be found in the LICENSE file
    * in the root directory of this software component.
    * If no LICENSE file comes with this software, it is provided AS-IS.
    *
    ******************************************************************************
--]]

--// Libs
local libs = script.libs

--$PROJECT_NAME.src.__index.luau
return 
EOF

cat <<EOF >> src/__log__/__log__.luau
--[[
    ******************************************************************************
    * @file		: __log__.lua
    * @author	: Cod2rDude & Scpt2r
    * @date		: April 26 2025
    * @lastEdit	: January 31 2026 @ 11:38
    * @brief	: Customizable logging lib with cache and customization.
    * @version	: 1.2.5
    ******************************************************************************
    * @attention
    *
    * Copyright © 2026 Axon Corporation.
    * All rights reserved.
    *
    * This software is licensed under terms that can be found in the LICENSE file
    * in the root directory of this software component.
    * If no LICENSE file comes with this software, it is provided AS-IS.
    *
    ******************************************************************************
--]]

--// Libs
local _config               = require(script.Parent._config)
local _messages             = require(script.Parent._messages)

--// Constants
local MAX_CACHE_SIZE        = 128

--// Logs
local cantFindMessageErr    = 0x1
local messageIsntAStringErr = 0x2
local messageEmptyErr       = 0x3
local errDoesntIncludeLevelErr  = 0x4

--// Functions
function addZeroOn(v : number) : string
    if v < 10 then return "0"..tostring(v) end
    return tostring(v)
end

function getDateAndTime() : (string, string, string)
    local dt            = DateTime.now():ToUniversalTime()

    local day           = addZeroOn(dt.Day)
    local month         = addZeroOn(dt.Month)
    local year          = dt.Year
    local hour          = (dt.Hour + 3)
    local fixedHour     = addZeroOn(hour)
    local minute        = addZeroOn(dt.Minute)
    local second        = addZeroOn(dt.Second)
    local milliSecond   = addZeroOn(dt.Millisecond)

    return day .. "/" .. month .. "/" .. year,
        fixedHour .. ":" .. minute .. ":" .. second,
        fixedHour .. ":" .. minute .. ":" .. second .. ":" .. milliSecond
end

--// Lib Decleration
local log = {}

--// Lib Variables
log.cache = {}

--// Lib Functions
function log.new(id:number, extra:{string}|string, traceback : string?, ...)
    if _messages[id] == nil then log.new(cantFindMessageErr, {"Id:", tostring(id)}); return end
    if extra == {} then extra = "" end
  
    local trace = traceback :: string or debug.traceback(nil, 1)

    local baseplate = _config.index .. _config.spacing
    local message = baseplate

    for i, v in pairs(_messages[id].message) do
        if type(v) ~= "string" then log.new(messageIsntAStringErr, {"Message: ", tostring(v)}); continue end

        message = message .. v  .. (i == #_messages[id].message and " " or _config.spacing)
    end

    if message == baseplate then
        log.new(messageEmptyErr, {"Id:", tostring(id)})
        return
    end

    if type(extra) == "table" then
        for i, v in pairs(extra) do
            message = message .. v .. " "
        end
    else
        message = message .. extra .. " "
    end

    message = message .. string.sub(_config.spacing, 2)

    local date, t1me, timeDetailed = getDateAndTime()

    if _config.includeDate then message = message .. date .. " " end
    if _config.includeTime and not _config.includeDetailedTime  then message = message .. t1me .. " " end
    if _config.includeDetailedTime and not _config.includeTime then message = message .. timeDetailed .. " " end
    
    trace = trace.split(trace, "\n")
    trace[1] = "Traceback:    " .. trace[1]
    local traceback_ = table.concat(trace, "\n"..string.rep(" ", 14), 1, #trace)
    
    message = string.format(message, ...) .. "\n" .. traceback_

    if _messages[id].type == "log" then
        print(message)
    elseif _messages[id].type == "warning" then
        warn(message)
    elseif _messages[id].type == "error" then
        if _messages[id].level == nil then log.new(errDoesntIncludeLevelErr, {}); return end
        error(message, _messages[id].level)
    end

    table.insert(log.cache, message)

    if #log.cache == MAX_CACHE_SIZE then
        table.clear(log.cache)
    end
end

return log
EOF

cat <<EOF >> src/__log__/_config.luau
return {
	index = "$PROJECT_NAME";
	spacing = " || "; -- These censor message in discord
	includeDate = true;
	includeTime = false;
	includeDetailedTime = true;
}
EOF

cat <<EOF >> src/__log__/_messages.luau
return {
	[0x1] = {
		type = "warning";
		message = {
			[1] = "Logger";
			[2] = "Can not find message in given id. Please check if given index is valid.";
		};
	};
	[0x2] = {
		type = "warning";
		message = {
			[1] = "Logger";
			[2] = "Given message partition is not a string.";
		};
	};
	[0x3] = {
		type = "warning";
		message = {
			[1] = "Logger";
			[2] = "Message is empty.";
		};
	};
	[0x4] = {
		type = "warning";
		message = {
			[1] = "Logger";
			[2] = "While given message is an error, it does not include a level. Did you forget it?";
		};
    };
    [0x5] = {
        type = "warning";
        message = {
            [1] = "%s";
        };
    };
    
    -- Custom Messages can be added below this line.
}
EOF

rojo sourcemap -o sourcemap.json

read -p "Initalize a new git project? [Y/n] " git
git=${git:-Y}

if [[ "${git,,}" == "y" ]]; then
    read -p "Enter github username: " USERNAME

    git init
    git branch -M main
    git remote add origin https://github.com/$USERNAME/$PROJECT_NAME.git
    git add .
    git commit -m "Initial Commit"
    git push --set-upstream origin main
else
    rm ./.gitattributes
    rm ./.gitignore
fi