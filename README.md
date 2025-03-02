# Keep Alive

**KeepAlive** is a Windows application designed to prevent your system from idling or locking the screen on remote virtual desktops, ensuring uninterrupted connectivity.

## Features

- **Prevents System Idle/Screen Lock:** Continuously keeps the system active, avoiding disconnections due to inactivity.

## Installation

1. **Download:** Obtain the latest release from [GitHub Releases](https://github.com/xuwaters/keepalive/releases).
2. **Install:** Extract the files to your desired location.
3. **Run:** Execute `KeepAlive.exe`.

## How It Works

The application utilizes the `SetThreadExecutionState` function to notify the system to remain active, preventing idle states and screen locks during remote sessions.

## Getting Started

```powershell
flutter run --device-id windows
```

## License

MIT
