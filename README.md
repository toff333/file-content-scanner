# File Content Scanner

## Overview

This PowerShell script is designed to search through specified file types within directories for specific keywords. It can be used for security audits or content analysis purposes.

## Usage

### Requirements

- PowerShell environment

### Steps

1. **Clone Repository**: Clone the repository to your local machine.

2. **Prepare Input**:
    - **Direct Input**: If providing paths directly, modify the script and run it, passing the paths as arguments.
    - **Text File Input**: If providing paths via a text file, create a text file containing the list of paths (one path per line).

3. **Modify Script** (if necessary):
    - Adjust file extensions and keywords according to your requirements.

4. **Execute Script**:
    - If using text file input:
      ```powershell
      .\file-content-scanner.ps1 -PathListFile "path_list.txt"
      ```
    - If providing paths directly, modify the script and run it, passing the paths as arguments:
      ```powershell
      .\file-content-scanner.ps1 -InputPath "C:\Path\To\Search"
      ```

5. **Review Results**: Review the detailed results printed on the console and find the exported CSV file named `scan-output.csv`.

## Notes

- Customize the file extensions and keywords according to your requirements.
- Review the exported CSV file for detailed results.
- Use responsibly and ensure compliance with applicable laws and regulations regarding data privacy and security.
