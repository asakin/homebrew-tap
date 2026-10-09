cask "dotfiles" do
  version "07ad43d6b73f85fb2f42a1e7a143968a158910e0"
  sha256 "3663a15f22fcf40cede4be7e0bc89eac23606692a90fbd551b188536ac1e096a"

  url "https://github.com/asakin/dotfiles/archive/#{version}.tar.gz"
  name "Dotfiles"
  desc "Opinionated zsh config: Starship, zoxide, and fzf"
  homepage "https://github.com/asakin/dotfiles"

  depends_on formula: "fzf"
  depends_on formula: "starship"
  depends_on formula: "zoxide"

  postflight_steps do
    run "/bin/bash",
        args:           ["{{staged_path}}/dotfiles-{{version}}/install.sh"],
        env:            { "HOME" => "/Users/{{user}}" },
        writable_paths: ["/Users/{{user}}"],
        print_stdout:   true
  end

  uninstall_postflight_steps do
    inreplace "{{staged_path}}/dotfiles-{{version}}/uninstall.sh",
              'echo "Uninstalling dotfiles symlinks (repo at: $DOTFILES_DIR)..."',
              'echo "Removing dotfiles symlinks..."'
    inreplace "{{staged_path}}/dotfiles-{{version}}/uninstall.sh",
              'echo "The dotfiles repo at $DOTFILES_DIR was not deleted."',
              ":"
    inreplace "{{staged_path}}/dotfiles-{{version}}/uninstall.sh",
              'echo "To fully remove it: rm -rf \\"$DOTFILES_DIR\\""',
              ":"
    run "/bin/bash",
        args:           ["{{staged_path}}/dotfiles-{{version}}/uninstall.sh"],
        env:            { "HOME" => "/Users/{{user}}" },
        writable_paths: ["/Users/{{user}}"],
        print_stdout:   true
  end

  caveats <<~EOS
    Reload your shell:
      source ~/.zshrc
  EOS
end
