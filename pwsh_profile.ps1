#### Don't forget to add this to the the profile default location is $PROFILE
Write-Output "Hello Daveanand"

function Show-LoadingWheel
{
    $duration = 1
    # Define spinner characters
    $spinnerChars = @('|', '/', '-', '\')

    $delay = 25 # Adjust this value for spinner speed

    # Calculate the number of iterations based on the duration and spinner delay
    $iterations = [math]::Ceiling(($duration * 1000) / $delay)

    # Record the start time
    $startTime = Get-Date

    # Loop until the specified duration has elapsed
    for ($i = 0; $i -lt $iterations; $i++)
    {
        foreach ($char in $spinnerChars)
        {
            # Clear the current line and display the spinner character
            $host.UI.RawUI.CursorPosition = @{X=0;Y=$host.UI.RawUI.CursorPosition.Y}
            Write-Host -NoNewline "$char $char $char $char $char $char"

            # Break the loop if the total elapsed time exceeds the duration
            if ((Get-Date) -gt $startTime.AddSeconds($duration))
            {
                break
            }
        }
    }

    # Clear the spinner character after the loading is done
    $host.UI.RawUI.CursorPosition = @{X=0;Y=$host.UI.RawUI.CursorPosition.Y}
    Write-Host -NoNewline "               " | Out-Null
}
Show-LoadingWheel | Out-Null

##################### Aliases #############################

function lsd
{
    C:\Users\support\scoop\apps\lsd\current\lsd.exe --config-file C:\Users\support\AppData\Local\nvim\lsd\config.yaml @Args
}


function sudo
{
    param
    (
        [string]$prog,
        [string[]]$arguments
    )
    $cmdline = "$prog $($arguments -join ' ')"
    Start-Process "$cmdline" -Verb RunAs
}
