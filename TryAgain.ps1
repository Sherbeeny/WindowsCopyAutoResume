# PowerShell Script to Monitor and Send "Enter" Key to "Try Again" Button on Copy Error Dialog

Add-Type @"
  using System;
  using System.Runtime.InteropServices;
  public class DialogClicker {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);

    [DllImport("user32.dll", EntryPoint = "FindWindowEx")]
    public static extern IntPtr FindWindowEx(IntPtr hwndParent, IntPtr hwndChildAfter, string lpszClass, string lpszWindow);

    [DllImport("user32.dll")]
    public static extern bool SetForegroundWindow(IntPtr hWnd);

    public const UInt32 BM_CLICK = 0x00F5;

    public static bool IsDialogPresent(string dialogTitle) {
      IntPtr dialogHWnd = FindWindow(null, dialogTitle);
      return dialogHWnd != IntPtr.Zero;
    }

    public static void ActivateWindowAndSendKeys(string dialogTitle, string keys) {
      IntPtr dialogHWnd = FindWindow(null, dialogTitle);
      if (dialogHWnd != IntPtr.Zero) {
        Console.WriteLine("Dialog found: " + dialogHWnd);
        SetForegroundWindow(dialogHWnd);
        System.Windows.Forms.SendKeys.SendWait(keys);
      } else {
        Console.WriteLine("Dialog not found.");
      }
    }
  }
"@ -ReferencedAssemblies 'System.Windows.Forms'

while ($true) {
  Start-Sleep -Seconds 5 # Check every 5 seconds
  if ([DialogClicker]::IsDialogPresent('1 Interrupted Action')) {
    Write-Host "Copy error dialog detected. Activating window and sending 'Enter'..."
    [DialogClicker]::ActivateWindowAndSendKeys('1 Interrupted Action', '~')  # '~' simulates Enter key
    Write-Host "'Enter' key sent."
  } else {
    Write-Host "No copy error dialog detected. Checking again in 5 seconds..."
  }
}
