class Ask < Formula
  desc "A tool to access OpenAI assistants on the command line with easy way to define and interact with assistants."
  homepage "https://github.com/fluxtah/ask"
  version "0.7.9"
  url "https://github.com/fluxtah/ask/releases/download/v#{version}/ask-#{version}.tar.gz"
  sha256 "47ab4f0b6f9a9ce98dd648980740af697766026c6cc7d26de5a084745e941d2f"

  def install
    jar_name = "ask-#{version}.jar"

    # Install the JAR file to the 'lib' directory
    lib.install jar_name

    # Install the script to the 'bin' directory
    bin.install "ask.sh" => "ask"

    # Modify the script to call the JAR from the correct location
    inreplace bin/"ask", "PATH_TO_JAR", "#{lib}/#{jar_name}"
  end

  def caveats
    <<~EOS
      'ask' requires Java to be installed. Ensure JAVA_HOME is set:
      export JAVA_HOME="$(/usr/libexec/java_home)"
    EOS
  end

  test do
    assert_match "Ask Version: #{version}", shell_output("#{bin}/ask -v")
  end
end
