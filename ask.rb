class Ask < Formula
  desc "A tool to access OpenAI assistants on the command line with easy way to define and interact with assistants."
  homepage "https://github.com/fluxtah/ask"
  url "https://github.com/fluxtah/ask/releases/download/v0.11/ask-0.11.tar.gz"
  sha256 "1d608a322db95109bfedb3a9c379469d0eb7cb7e60599cf397014802f8c75e43 "

  def install
    # Install the JAR file to the 'lib' directory
    lib.install "ask-0.1.jar"

    # Install the script to the 'bin' directory
    bin.install "ask.sh" => "ask"

    # Modify the script to call the JAR from the correct location
    inreplace bin/"ask", /^java -jar/, "java -jar #{lib}/ask-0.1.jar"
  end

  test do
    # Use a simple command that your application can process and return a predictable result
    assert_match "Expected output", shell_output("#{bin}/ask --version")
  end
end
