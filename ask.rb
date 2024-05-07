class Ask < Formula
  desc "A tool to access OpenAI assistants on the command line with easy way to define and interact with assistants."
  homepage "https://github.com/fluxtah/ask"
  version "0.2.0"
  url "https://github.com/fluxtah/ask/releases/download/v#{version}/ask-#{version}.tar.gz"
  sha256 "3100a12bc0641474b37af23da3a14741d9ac4059a640a4d86343b6bea5ee8103"

  def install
    jar_name = "ask-#{version}.jar"

    # Install the JAR file to the 'lib' directory
    lib.install jar_name

    # Install the script to the 'bin' directory
    bin.install "ask.sh" => "ask"

    # Modify the script to call the JAR from the correct location
    inreplace bin/"ask", /^java -jar.*$/, "java -jar #{lib}/#{jar_name} \"$@\""
  end

  test do
    # Use a simple command that your application can process and return a predictable result
    assert_match "Expected output", shell_output("#{bin}/ask --version")
  end
end
