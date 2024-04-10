param(
    [Parameter(Mandatory=$true)]
    [string]$PathListFile
)

# Define the file extensions to search within
$fileExtensions = "*.txt","*.ps1","*.ps","*.cmd","*.bat","*.vbs","*.pdf","*.xlsx","*.csv","*.docx","*.doc","*.msg","*.eml"

# Define keywords to search for
$keywords = @("password", "pwd", "ConvertTo-SecureString")

$results = @()

# Read remote paths from the text file
$remotePaths = Get-Content $PathListFile

foreach ($remotePath in $remotePaths) {
    Write-Host "Checking files in $remotePath" -ForegroundColor Green
    $remoteFiles = Get-ChildItem -Path $remotePath -Recurse -Include $fileExtensions -ErrorAction SilentlyContinue
    foreach ($file in $remoteFiles) {
        Write-Host "Checking file: $($file.FullName)" -ForegroundColor Cyan
        if ($file.GetType() -eq [System.IO.FileInfo]) {
            foreach ($keyword in $keywords) {
                $matches = Select-String -Path $file.FullName -Pattern $keyword -Include $fileExtensions
                if ($matches) {
                    Write-Host "Match Found: $keyword in $($file.FullName)" -ForegroundColor Red
                    foreach ($match in $matches) {
                        $results += [PSCustomObject]@{
                            "Keyword" = $keyword
                            "File Path" = $file.FullName
                            "Line" = $match.Line
                        }
                    }
                }
            }
        }
    }
}

# Export the results to a CSV file
$results | Export-Csv -Path "scan-output.csv" -NoTypeInformation

Write-Host "Search completed. Results exported to scan-output.csv"
