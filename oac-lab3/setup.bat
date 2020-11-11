@echo off

rem Quartus Prime Lite Edition
rem -- Installs the software and/or devices to the Quartus Prime Lite Edition

rem Copyright (C) 2018 Intel Corporation. All rights reserved.

rem Your use of Intel Corporation's design tools, logic functions and other
rem software and tools, and its AMPP partner logic functions, and any output files
rem any of the foregoing (including device programming or simulation files), and
rem any associated documentation or information are expressly subject to the terms
rem and conditions of the Intel Program License Subscription Agreement, Intel
rem MegaCore Function License Agreement, or other applicable license agreement,
rem including, without limitation, that your use is for the sole purpose of
rem programming logic devices manufactured by Intel and sold by Intel or its
rem authorized distributors.  Please refer to the applicable agreement for
rem further details.

echo Please wait while setup is loading...
set SCRIPT_PATH=%~d0"%~p0"
set CMD_NAME=%SCRIPT_PATH%components/QuartusLiteSetup-18.1.0.625-windows.exe
START %CMD_NAME% %*
