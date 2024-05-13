class Ask < Formula
  desc "A tool to access OpenAI assistants on the command line with easy way to define and interact with assistants."
  homepage "https://github.com/fluxtah/ask"
  version "0.6.0"
  url "https://github.com/fluxtah/ask/releases/download/v#{version}/ask-#{version}.tar.gz"
  sha256 "8feddcc77c906e1473d8b5960b5a68c5bda0864acaf629b5a3d3d4bec502f819"

  def install
    jar_name = "ask-#{version}.jar"

    # Install the JAR file to the 'lib' directory
    lib.install jar_name

    # Install the script to the 'bin' directory
    bin.install "ask.sh" => "ask"

    # Modify the script to call the JAR from the correct location
    inreplace bin/"ask", "PATH_TO_JAR", "#{lib}/#{jar_name}"

    # Create the .ask directory in the user's home directory
    ask_directory = "#{ENV["HOME"]}/.ask"
    (Pathname.new("#{ENV["HOME"]}/.ask")).mkpath

    # Extract and copy the plugins folder to the .ask directory
    tar_path = "#{buildpath}/ask-#{version}.tar.gz"
    system "tar", "-xzf", tar_path, "plugins", "-C", ask_directory
  end

  test do
    # Use a simple command that your application can process and return a predictable result
    assert_match "Expected output", shell_output("#{bin}/ask --version")
  end
end
