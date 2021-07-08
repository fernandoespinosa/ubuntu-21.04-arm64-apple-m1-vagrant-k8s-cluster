
cd ~/Code/kubernetes-examples/ubuntu-21.04-arm64-apple-m1-packer/

vagrant box add \
  --name local/ubuntu-21.04-arm64-apple-m1 \
  builds/ubuntu-21.04.parallels.build-2021.07.08.box

popd