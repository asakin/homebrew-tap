class Dragoman < Formula
  include Language::Python::Virtualenv

  desc "Small CLI that lets Claude Code reach non-Anthropic models"
  homepage "https://github.com/asakin/dragoman"
  url "https://files.pythonhosted.org/packages/2e/88/30a7a8e78c55bbf00a9c12a246d25091447b2b6dbdb710e6cf2dd113f2ec/dragoman_ai-0.6.1.tar.gz"
  sha256 "973fdd40eef53bd029be022590100f8cd80552f4db2b2d9fc8401a4ee6ef3eae"
  license "Apache-2.0"

  depends_on "python@3.12"

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/2c/ee/afaf0f85a9a18fe47a67f1e4422ed6cf1fe642f0ae0a2f81166231303c52/wcwidth-0.7.0.tar.gz"
    sha256 "90e3a7ea092341c44b99562e75d09e4d5160fe7a3974c6fb842a101a95e7eed0"
  end

  resource "prompt_toolkit" do
    url "https://files.pythonhosted.org/packages/a1/96/06e01a7b38dce6fe1db213e061a4602dd6032a8a97ef6c1a862537732421/prompt_toolkit-3.0.52.tar.gz"
    sha256 "28cde192929c8e7321de85de1ddbe736f1375148b02f2e17edd840042b1be855"
  end

  resource "questionary" do
    url "https://files.pythonhosted.org/packages/f6/45/eafb0bba0f9988f6a2520f9ca2df2c82ddfa8d67c95d6625452e97b204a5/questionary-2.1.1.tar.gz"
    sha256 "3d7e980292bb0107abaa79c68dd3eee3c561b83a0f89ae482860b181c8bd412d"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "dragoman", shell_output("#{bin}/dragoman --version")
  end
end
