### README for Homebrew Tap: `homebrew-ask`

This repository is the official Homebrew tap for the `ask` command line tool, which facilitates access to OpenAI assistants directly from your command line. For detailed information about the `ask` tool, including usage, configuration, and development details, please visit the main [Ask GitHub Repository](https://github.com/fluxtah/ask).

#### Installation

To install `ask` using Homebrew, follow these simple steps:

1. **Add the Tap**:
   First, add the custom tap to your Homebrew repository list. This informs Homebrew where to find the `ask` formula.
   ```bash
   brew tap fluxtah/ask
   ```

2. **Install the Tool**:
   After adding the tap, install `ask` like any other Homebrew package:
   ```bash
   brew install ask
   ```

#### Uninstallation

If you need to uninstall `ask`, use the following command:
```bash
brew uninstall ask
```

This command removes all components related to `ask` that were installed by Homebrew.

#### Further Information

For detailed usage instructions and more information about `ask`, please visit the GitHub repository:
[Ask Repository](https://github.com/fluxtah/ask)

#### Feedback and Contributions

Feedback and contributions are always welcome. Please submit any bugs, questions, or feature requests to the GitHub issue tracker:
[Submit Issue](https://github.com/fluxtah/ask/issues)

## Development & Testing
Follow these steps to ensure the formula works correctly before release:

### 1. Modify the Formula
Change the `url` in the formula to a local `file://` URL for testing purposes:
```ruby
url "file:///absolute/path/to/your/ask-1.0.tar.gz"
```

### 2. Install Locally
Test install the formula from the local file:
```bash
brew install --build-from-source --verbose /path/to/your/formula.rb
```

### 3. Clear Brew Cache
Clear the Homebrew cache to avoid using stale data:
```bash
rm -rf $(brew --cache)
```

### 4. Test Functionality
Use the installed application to verify all functionalities:
```bash
ask --version
```

and

```bash
ask --interactive
```

### 5. Uninstall the Formula
Remove the installed formula to ensure clean state:
```bash
brew uninstall ask
```

### 6. Remove Downloaded Tarball
Ensure Homebrew fetches a fresh tarball for each test:
```bash
rm -rf $(brew --cache)/downloads/*
```
