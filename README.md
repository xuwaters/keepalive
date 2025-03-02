# Keep Alive

**KeepAlive** is a Windows application designed to prevent your system from idling or locking the screen on remote virtual desktops, ensuring uninterrupted connectivity.

## Features

- **Prevents System Idle/Screen Lock:** Continuously keeps the system active, avoiding disconnections due to inactivity.

## Installation

1. **Download:** Obtain the latest release from [GitHub Releases](https://github.com/xuwaters/keepalive/releases).
2. **Install:** Extract the files to your desired location.
3. **Run:** Execute `KeepAlive.exe`.
4. **Start:** Click the `Start` button.

## How It Works

The application utilizes the [`SetThreadExecutionState`](https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-setthreadexecutionstate) function to notify the system to remain active, preventing idle states and screen locks during remote sessions.
Reference: https://gist.github.com/jcefoli/36ed07c08dc3795648b3f45185f721c5

## Getting Started

```powershell
flutter run --device-id windows
```

## License

MIT
