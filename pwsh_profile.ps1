#### Don't forget to add this to the the profile default location is $PROFILE
function Write-Display-Header
{
    param (
        [string]$HeaderText = "Hello",
        [ConsoleColor]$HeaderTextColor = [ConsoleColor]::Magenta
    )
    $HeaderText = "💻 Hello Daveanand 💻"

    # Get terminal width
    $width = $host.UI.RawUI.WindowSize.Width

    # Create the header line and padding
    $line = "=" * $width
    $padding = [math]::Max(0, ($width - $HeaderText.Length) / 2)
    
    # Print the header line with `=` characters
    Write-Host $line

    # Print the header text centered
    Write-Host (" " * $padding) -NoNewline
    Write-Host $HeaderText -ForegroundColor $HeaderTextColor -NoNewline
    Write-Host (" " * $padding)

    # Print the bottom line
    Write-Host $line
}
function Show-LoadingWheel
{
    $duration = 2
    # Define spinner characters
    $spinnerChars = @('|', '/', '', '\')

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
            Write-Host -NoNewline "$char $char $char $char $char $char" -ForegroundColor Magenta

            # Break the loop if the total elapsed time exceeds the duration
            if ((Get-Date) -gt $startTime.AddSeconds($duration))
            {
                break
            }
        }
    }

    # Clear the spinner character after the loading is done
    $host.UI.RawUI.CursorPosition = @{X=0;Y=$host.UI.RawUI.CursorPosition.Y}
    Write-Host "                  " | Out-Null
}
######### execution ###############
Show-LoadingWheel | Out-Null
Write-Display-Header

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
