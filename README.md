# configurator
it configures your stuff


## Version 1
- brutishly installs my dotfiles
- steps:
  - asks for repo name (if config file isnt present in $HOME)
	- clones repo (and, if config file wasnt present.. check for configurator
		config file)
	- looks for link config section in .configurator.yml
	- runs through links and folders that are being requested.. prints out dry-run
		info (unless -Y is passed) and asks before proceeding
	  - if any action would over-write something.. that file/folder/etc is copied
			into an old.stuff folder for safe-keeping
	- looks for cmd config section
	  - runs any commands needed

## version 2
- abstracted enough to install other peoples dotfiles
- includes verification tests after install to ensure successful installation

## version 3
- maybe start getting fancy..
  - recognize current environment and install correct dotfiles for this OS
	- ask user if its a work/personal/dev/test/etc machine and follow related
		instructions in their dotfiles.
- test kitchen?
