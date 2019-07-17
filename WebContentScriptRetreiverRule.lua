-- 1) Make HTTP request and define/store variables
body, status = request('/') 


-- 2) If the HTTP request is unsuccessful; return error message
if status ~= 200 then
    error('Web Connection Failure')
end 


-- 3.1) Define the IP Address Regex pattern to search for
local ipAddrPattern = "IP Address:</td><td>(.+)</td></tr>"

-- 3.2) Search for the Regex pattern defined above in the HTTP request body
local ipAddr = string.match(body, ipAddrPattern )

-- 3.3) Define the IP Address Regex pattern to search for
local firwarePattern = "Application Firmware:</td><td>(.+)</td></tr>"

-- 3.4) Search for the Regex pattern defined above in the HTTP request body
local firmware = string.match(body, firwarePattern)


-- 4) Define a variable to store Regex results and corresponding titles
local results = ("IP Address: " .. ipAddr[2] .. "\nFirmware: " .. firmware[2])


-- 5) send to output
return results
