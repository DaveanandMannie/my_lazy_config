
#==================== Aliases ===========================#
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
