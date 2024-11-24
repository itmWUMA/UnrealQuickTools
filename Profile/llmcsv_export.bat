@echo off
REM 检查是否提供了目录参数
if "%~1"=="" (
    echo Error: Source folder is not specified!
    echo Usage: script.bat [Path to Source folder] [Path to PerfreportTool.exe]
    pause
    exit /b
)

if "%~2"=="" (
    echo Error: PerfreportTool.exe path is not specified!
    echo Usage: script.bat [Path to Source folder] [Path to PerfreportTool.exe]
    pause
    exit /b
)

REM 获取目录A和目录B路径
set "SrcPath=%~1"
set "ToolPath=%~2"

REM 遍历目录A中所有的.csv文件
for %%f in ("%SrcPath%\*.csv") do (
    REM 调用A.exe并传入当前.csv文件的路径作为参数
    %ToolPath% -csv "%%f" -o %SrcPath% -reporttype LLM -topng. -graphxml LLMReportGraphs.xml -reportxml LLMReportTypes.xml -nostripevents
)