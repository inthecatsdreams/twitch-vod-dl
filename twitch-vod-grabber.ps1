param (     
    [string]$twitchurl = $(throw "-twitchurl is required")
)
[string]$final_command = ""
[string]$file_name = Get-Random
Write-Output "url is $twitchurl"
if ($null -eq (Get-Command "ffmpeg.exe" -ErrorAction SilentlyContinue)) 
{ 
   Write-Host "Unable to find ffmpeg.exe in your PATH"
}
else {
    $final_command += "ffmpeg.exe -i '$twitchurl' -c copy -bsf:a aac_adtstoasc '$file_name.mp4'"
    iex "& $final_command"
}
