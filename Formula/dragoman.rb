class Dragoman < Formula
  include Language::Python::Virtualenv

  desc "A small CLI that lets Claude Code reach non-Anthropic models"
  homepage "https://github.com/asakin/dragoman"
  url "https://files.pythonhosted.org/packages/source/d/dragoman-ai/dragoman_ai-0.5.0.tar.gz"
  sha256 "8f4dc41e5407201dee1bd157925b28300ff15fe9d234c03d1e1b7d0c4c60668d"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "dragoman", shell_output("#{bin}/dragoman --version")
  end
end
