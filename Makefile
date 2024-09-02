.DEFAULT_GOAL := main

.PHONY: install_stow install_oh_my_zsh main

install_stow:
	@brew install stow
	@echo "stow is installed."

install_oh_my_zsh:
	@sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	@echo "oh-my-zsh is installed."

install_powerlevel10k:
	@git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	@echo "powerlevel10k is installed"

install_autosuggestion:
	@git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	@echo "zsh-autosuggestions installed"

install_syntax_highlighting:
	@git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	@echo "zsh-syntax-highlighting installed"

clone_dotfiles: install_stow install_oh_my_zsh install_powerlevel10k install_autosuggestion install_syntax_highlighting
	@git clone git@github.com:DarrenVictoriano/dotfiles.git
