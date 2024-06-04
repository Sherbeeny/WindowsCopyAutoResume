# WindowsCopyAutoResume
# Auto Resume/Retry Copy Script

This repository contains a PowerShell script designed to automatically detect and handle "1 Interrupted Action" error dialogs that appear during file copy operations on Windows. The script will activate the error dialog and send the "Enter" key to press the "Try Again" button, ensuring the copy operation continues without manual intervention.

## Features

- Automatically detects "1 Interrupted Action" dialogs during file copy operations.
- Activates the dialog window and simulates the "Enter" key press to click the "Try Again" button.
- Runs in the background, checking for error dialogs every 5 seconds.
- Provides console output to indicate when dialogs are detected and actions are taken.

## Prerequisites

- Windows operating system (Windows 10/11 recommended).
- PowerShell (installed by default on most Windows systems).

## Usage

1. **Download the Script**: Clone this repository or download the `TryAgain.ps1` script to your local machine.

2. **Run the Script**: Right-click the `TryAgain.ps1` file and select "Run with PowerShell".

3. **Monitor the Output**: The script will provide console output indicating whether the error dialog is detected and if the "Enter" key is sent to click the "Try Again" button.

## Script Details

The script utilizes Windows API calls to interact with the "1 Interrupted Action" error dialog:

- **FindWindow**: Locates the error dialog window by its title.
- **SetForegroundWindow**: Brings the error dialog window to the foreground.
- **SendKeys.SendWait**: Simulates the "Enter" key press to activate the default button (i.e., "Try Again").

## Contributing

Contributions are welcome! Please open an issue or submit a pull request if you have any improvements or bug fixes.

## License

This project is licensed under the MIT License.

---

**Disclaimer**: This script is provided as-is without any warranties. Use it at your own risk.
