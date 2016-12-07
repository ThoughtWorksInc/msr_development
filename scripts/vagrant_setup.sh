function download_vagrant() {
	VAGRANT_DOWNLOAD_URL="https://releases.hashicorp.com/vagrant/1.9.0/vagrant_1.9.0.dmg"
	wget $VAGRANT_DOWNLOAD_URL -O ~/Desktop/$(basename $VAGRANT_DOWNLOAD_URL)
	echo "Vagrant is downloaded to your Desktop. Install it, and rerun this script"
	exit 0
}

function init_vagrant() {
	if ! which vagrant > /dev/null; then
		echo "Downloading Vagrant"
		download_vagrant
	fi

	VAGRANT_VERSION=$(vagrant -v | grep -Eo "\d+\.\d+")
	if [[ "$VAGRANT_VERSION" != "1.9" ]]; then
	    echo "current Vagrant version is: $VAGRANT_VERSION. Downloading Vagrant 1.9"
	    download_vagrant
	fi
}
