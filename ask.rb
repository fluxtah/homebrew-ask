class Ask < Formula
  desc "A tool to access OpenAI assistants on the command line with easy way to define and interact with assistants."
  homepage "https://github.com/fluxtah/ask"
  version "0.7.3"
  url "https://github.com/fluxtah/ask/releases/download/v#{version}/ask-#{version}.tar.gz"
  sha256 "44ebf83ceb72e6e0a6e2c5b71499d53e29793cb725540fdbaad5653c6a3eb739"

  def install
    jar_name = "ask-#{version}.jar"

    # Install the JAR file to the 'lib' directory
    lib.install jar_name

    # Install the script to the 'bin' directory
    bin.install "ask.sh" => "ask"

    # Modify the script to call the JAR from the correct location
    inreplace bin/"ask", "PATH_TO_JAR", "#{lib}/#{jar_name}"
  end

  test do
    # Use a simple command that your application can process and return a predictable result
    assert_match "Expected output", shell_output("#{bin}/ask --version")
  end
end
