class Ask < Formula
  desc "A powerful command line tool for your needs"
  homepage "https://github.com/fluxtah/ask"
  url "file:///Users/ian.warwick/Documents/sdev/assistant-kommander/build/dist/ask-0.1.tar.gz"
  sha256 "95b87cc17b28e880f3fdad2f68d0b1b991cf78e9adf829baa50fcd432ef09f17"

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
